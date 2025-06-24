//
//  SecondVC.ext.swift
//  travelApp
//
//  Created by Данила on 08.06.2025.
//

import UIKit

extension SecondVC {
	// Создать кнопку для раздела
	func createTabButton(title: String, isSelected: Bool = false) -> UIButton {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.titleLabel?.textAlignment = .center
		button.setTitleColor(isSelected ? .appPurple : .black, for: .normal)
		button.titleLabel?.font = MyAppFont.makeSourceSansPro(size: 16, weight: .Regular)
		button.addTarget(self, action: #selector(tabTapped(_ :)), for: .touchUpInside)
		button.sizeToFit()
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}
	// Для обработки нажатия на какой то раздел
	@objc private func tabTapped(_ sender: UIButton) {
		print("Нажат раздел: \(sender.currentTitle ?? "")")
		// Если у меня появятся разделы то можно будет тут
		// решить куда кидать пользователя дальше
	}
	func createSliderLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		return layout
	}
	func createRecommendedLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		return layout
	}
	// Для обработки действия UIPageControl
	@objc func pageControlValueChanged() {
		let currentPage = pageControl.currentPage
		let indexPath = IndexPath(item: currentPage, section: 0)
		// Прокручиваем UICollectionView к соответствующей странице
		sliderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
extension SecondVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let type = CollectionType(rawValue: collectionView.tag) else { return 0 }
		switch type {
		case .horizontal:
			return placeData.count
		case .vertical:
			return placeData.count
		}
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let type = CollectionType(rawValue: collectionView.tag) else { fatalError("Unknown collectionView type") }
		switch type {
		case .horizontal:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
			// создаем идентификатор
			let heartButtonKeySlider = "heartButtonStateSlider_\(indexPath.item)"
			// загрузка состояня из UserDefaults
			let isHeartSelected = UserDefaults.standard.bool(forKey: heartButtonKeySlider)
			// обработка нажатия кнопки
			cell.onHeartButtonTap = {
//				print(indexPath)
				// находим индекс ячейки
				if let index = collectionView.indexPath(for: $0)?.item {
					// инверсия состояния кнопки
					let newState = !UserDefaults.standard.bool(forKey: "heartButtonStateSlider_\(index)")
					// сохранение нового состояния
					UserDefaults.standard.set(newState, forKey: "heartButtonStateSlider_\(index)")
					
//					let message = newState ? "Ячейка \(index) добавлена в избранное" : "Ячейка \(index) удалена из избранного"
//					print(message)
					
					// перегружаем ячейку для обновления вида
					collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
				}
			}

			cell.configure(with: placeData[indexPath.row], isHeartSelected: isHeartSelected)
			
			return cell
			
		case .vertical:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
			// создаем идентификатор
			let heartButtonKey = "heartButtonState_\(indexPath.item)"
			
			// загрузка состояня из UserDefaults
			let isHeartSelected = UserDefaults.standard.bool(forKey: heartButtonKey)
			
			// обработка нажатия кнопки
			cell.onHeartButtonTap = {
//				print(indexPath)
				// находим индекс ячейки
				if let index = collectionView.indexPath(for: $0)?.item {
					// инверсия состояния кнопки
					let newState = !UserDefaults.standard.bool(forKey: "heartButtonState_\(index)")
					// сохранение нового состояния
					UserDefaults.standard.set(newState, forKey: "heartButtonState_\(index)")
					
//					let message = newState ? "Ячейка \(index) добавлена в избранное" : "Ячейка \(index) удалена из избранного"
//					print(message)
					
					// перегружаем ячейку для обновления вида
					collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
				}
			}

			cell.configure(with: placeData[indexPath.row], isHeartSelected: isHeartSelected)
			
			return cell
		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SecondVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		guard let type = CollectionType(rawValue: collectionView.tag) else { return .zero }
		switch type {
		case .horizontal:
			return CGSize(width: view.bounds.width * 0.8, height: 250)
		case .vertical:
			let spacer = (view.bounds.width * 0.05) * 3
			let cellSize: CGFloat = (view.bounds.width - spacer) / 2
			let size = CGSize(width: cellSize, height: cellSize)
			return size
		}
	}
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		guard let type = CollectionType(rawValue: collectionView.tag) else { return .zero }
		
		switch type {
		case .horizontal:
			return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		case .vertical:
			return .zero
		}
	}
}

// MARK: - UICollectionViewDelegate
extension SecondVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("IndexPath = \(indexPath.row)")
		// получаем данные для выбранной ячейки
		let selectedPlace = placeData[indexPath.row] // поместили в константу данные о текущей карточке
		
		// создаем экземпляр ThirdVC с передачей туда данных
		let thirdVC = ThirdVC()
		thirdVC.placeData = selectedPlace
		
		// переключение на ThirdVC
		navigationController?.pushViewController(thirdVC, animated: true)
	}
}

//MARK: - UIScrollViewDelegate
extension SecondVC: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		guard let collectionView = scrollView as? UICollectionView else { return }
		
		// Определяем текущую страницу
		let visibleRect	= CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
		
		if let indexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = indexPath.row
		}
	}
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		
		let cellWidth: CGFloat = view.bounds.width * 0.8
		
		guard let layout = sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
		
		let cellWidthIncludingSpacing = cellWidth + layout.minimumLineSpacing
		
		let proposedContentOffset = targetContentOffset.pointee
		let offset = proposedContentOffset.x + scrollView.contentInset.left
		
		let index = round(offset / cellWidthIncludingSpacing)
		let newOffset = index * cellWidthIncludingSpacing - scrollView.contentInset.left
		
		targetContentOffset.pointee = CGPoint(x: newOffset, y: proposedContentOffset.y)
	}
}


