//
//  SecondVC.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

//struct PlaceData {
//	let title: String
//	let description: String
//	let place: (country: String, city: String)
//	var userMark: Double
//	let price: Double
//	let durationInDays: Int
//	
//	// Заполнение массива мест
//	static func fillArray() -> [PlaceData] {
//		//
//		let arrTemp: [PlaceData] = [
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 2.3, price: 234.5, durationInDays: 5),
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 3.3, price: 234.5, durationInDays: 5),
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 1.3, price: 234.5, durationInDays: 5),
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 3.1, price: 234.5, durationInDays: 5),
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 5.0, price: 234.5, durationInDays: 5),
//			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
//		]
//		return arrTemp
//	}
//}

class SecondVC: UIViewController {
	var placeData: [PlaceData] = PlaceData.fillArray()
	
	// Коллекции
	lazy var sliderCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createSliderLayout())
	lazy var recommendedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createRecommendedLayout())
	
	// Свойства нужные в классе
	private lazy var pageControl = UIPageControl()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		// Настройка UI
		setupUI()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.navigationBar.isHidden = true
	}
	
	private func setupUI() {
		// Навигационная строка
		let navigationBar = UIView()
		navigationBar.backgroundColor = .clear
		navigationBar.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(navigationBar)
		
		// Кнопка меню
		let menuButton = UIButton(type: .system)
		menuButton.setImage(UIImage(named: "appMenu"), for: .normal)
		menuButton.tintColor = .black
		menuButton.translatesAutoresizingMaskIntoConstraints = false
		navigationBar.addSubview(menuButton)
		
		// Discover
		let titleLabel = UILabel()
		titleLabel.text = "Discover"
		titleLabel.font = MyAppFont.makeMerriweather(size: 27, weight: .Regular)
//		titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		navigationBar.addSubview(titleLabel)
		
		// Иконка профиля пользователя
		let profileImageView = UIImageView(image: UIImage(named: "appProfileIcon"))
		profileImageView.contentMode = .scaleAspectFill
		profileImageView.layer.cornerRadius = 20
		profileImageView.clipsToBounds = true
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		navigationBar.addSubview(profileImageView)
		
		// Ограничения для области навигации
		NSLayoutConstraint.activate([
			// для основы
			navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			navigationBar.heightAnchor.constraint(equalToConstant: 50),
			
			// для элементов на ней
			menuButton.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
			menuButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
			
			titleLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
			
			profileImageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16),
			profileImageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
			profileImageView.widthAnchor.constraint(equalToConstant: 40),
			profileImageView.heightAnchor.constraint(equalToConstant: 40)
		])
		
		// Разделы попробовать реализовать через UIScrollView
		
		let tabScrollView = UIScrollView()
		tabScrollView.showsHorizontalScrollIndicator = false // без индикатора прокрутки
		tabScrollView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tabScrollView)
		
		let tabsViewContainer = UIView()
		tabsViewContainer.backgroundColor = .clear
		tabsViewContainer.translatesAutoresizingMaskIntoConstraints = false
		tabScrollView.addSubview(tabsViewContainer)
		
		let popularTab = createTabButton(title: "Popular")
		let featuredTab = createTabButton(title: "Featured")
		let mostVisitedTab = createTabButton(title: "Most Visited")
		let europeTab = createTabButton(title: "Europe")
		let asiaTab = createTabButton(title: "Asia")
		let africaTab = createTabButton(title: "Africa")
		let americaTab = createTabButton(title: "America")
		
//		popularTab.translatesAutoresizingMaskIntoConstraints = false
//		featuredTab.translatesAutoresizingMaskIntoConstraints = false
//		mostVisitedTab.translatesAutoresizingMaskIntoConstraints = false
//		europeTab.translatesAutoresizingMaskIntoConstraints = false
//		asiaTab.translatesAutoresizingMaskIntoConstraints = false
		
		tabsViewContainer.addSubview(popularTab)
		tabsViewContainer.addSubview(featuredTab)
		tabsViewContainer.addSubview(mostVisitedTab)
		tabsViewContainer.addSubview(europeTab)
		tabsViewContainer.addSubview(asiaTab)
		tabsViewContainer.addSubview(africaTab)
		tabsViewContainer.addSubview(americaTab)
		
		// Ограничения для разделов (ДОДЕЛАТЬ!!!!)
		NSLayoutConstraint.activate([
			tabScrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 15),
			tabScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tabScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tabScrollView.heightAnchor.constraint(equalToConstant: 50), // Высота кнопок разделов
			
			tabsViewContainer.topAnchor.constraint(equalTo: tabScrollView.topAnchor),
			tabsViewContainer.bottomAnchor.constraint(equalTo: tabScrollView.bottomAnchor),
			tabsViewContainer.leadingAnchor.constraint(equalTo: tabScrollView.leadingAnchor),
			tabsViewContainer.trailingAnchor.constraint(equalTo: tabScrollView.trailingAnchor),
			tabsViewContainer.heightAnchor.constraint(equalTo: tabScrollView.heightAnchor),
			
			popularTab.leadingAnchor.constraint(equalTo: tabsViewContainer.leadingAnchor, constant: 13),
			popularTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			featuredTab.leadingAnchor.constraint(equalTo: popularTab.trailingAnchor, constant: 16),
			featuredTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			mostVisitedTab.leadingAnchor.constraint(equalTo: featuredTab.trailingAnchor, constant: 16),
			mostVisitedTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			europeTab.leadingAnchor.constraint(equalTo: mostVisitedTab.trailingAnchor, constant: 16),
			europeTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			asiaTab.leadingAnchor.constraint(equalTo: europeTab.trailingAnchor, constant: 16),
			asiaTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			africaTab.leadingAnchor.constraint(equalTo: asiaTab.trailingAnchor, constant: 16),
			africaTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			
			americaTab.leadingAnchor.constraint(equalTo: africaTab.trailingAnchor, constant: 16),
			americaTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
			americaTab.trailingAnchor.constraint(equalTo: tabsViewContainer.trailingAnchor, constant: -13),
			//again
			
//			tabsViewContainer.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
//			tabsViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			tabsViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//			tabsViewContainer.heightAnchor.constraint(equalToConstant: 40),
//
//			popularTab.leadingAnchor.constraint(equalTo: tabsViewContainer.leadingAnchor, constant: 16),
//			featuredTab.leadingAnchor.constraint(equalTo: popularTab.trailingAnchor, constant: 16),
//			mostVisitedTab.leadingAnchor.constraint(equalTo: featuredTab.trailingAnchor, constant: 16),
//			europeTab.leadingAnchor.constraint(equalTo: mostVisitedTab.trailingAnchor, constant: 16),
//			asiaTab.leadingAnchor.constraint(equalTo: europeTab.trailingAnchor, constant: 16),
//			
//			popularTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
//			featuredTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
//			mostVisitedTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
//			europeTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor),
//			asiaTab.centerYAnchor.constraint(equalTo: tabsViewContainer.centerYAnchor)
		])
		
		
//		let sliderViewContainer = UIView()
//		sliderViewContainer.backgroundColor = .clear
//		sliderViewContainer.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(sliderViewContainer)
		
		// Коллекция с горизонтальной прокруткой
		sliderCollectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCell")
		sliderCollectionView.dataSource = self
		sliderCollectionView.delegate = self
		sliderCollectionView.showsHorizontalScrollIndicator = false
		sliderCollectionView.backgroundColor = .clear
		sliderCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) //сдвиг до прокрутки
		sliderCollectionView.translatesAutoresizingMaskIntoConstraints = false
		sliderCollectionView.isPagingEnabled = false // Отключил стандартную пагинацию
//		sliderCollectionView.decelerationRate = .fast // Ускорение затухания прокрутки
		
		view.addSubview(sliderCollectionView)
		
		// Ограничения для нее
		NSLayoutConstraint.activate([
			sliderCollectionView.topAnchor.constraint(equalTo: tabScrollView.bottomAnchor, constant: 16),
			sliderCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			sliderCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			sliderCollectionView.heightAnchor.constraint(equalToConstant: 250),
		])
		
		// Индикаторы под коллекцией
		pageControl = {
			$0.currentPageIndicatorTintColor = .appLightViolet
			$0.pageIndicatorTintColor = .appPurple
			$0.numberOfPages = placeData.count
			$0.currentPage = 0
			$0.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIPageControl())
		
		// Ограничения для индикаторов
		NSLayoutConstraint.activate([
			pageControl.topAnchor.constraint(equalTo: sliderCollectionView.bottomAnchor, constant: 8),
			pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pageControl.heightAnchor.constraint(equalToConstant: 20)
		])
		
		// Раздел Recommended
		let recommendedSection = UIView()
		recommendedSection.backgroundColor = .clear
		recommendedSection.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(recommendedSection)
		
		let recommendedLabel = UILabel()
		recommendedLabel.text = "Recommended"
		recommendedLabel.font = MyAppFont.makeMerriweather(size: 18, weight: .Bold)
//		recommendedLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		recommendedLabel.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(recommendedLabel)
		
		let viewAllButton = UIButton(type: .system)
		viewAllButton.setTitle("View All", for: .normal)
		viewAllButton.titleLabel?.font = MyAppFont.makeMerriweather(size: 14, weight: .Regular)
		viewAllButton.setTitleColor(.gray, for: .normal)
		viewAllButton.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(viewAllButton)
		
		// Коллекция рекомендаций вертикальная прокрутка
		recommendedCollectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: "RecommendedCell")
		recommendedCollectionView.dataSource = self
		recommendedCollectionView.delegate = self
		recommendedCollectionView.showsVerticalScrollIndicator = false
		recommendedCollectionView.backgroundColor = .clear
		recommendedCollectionView.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(recommendedCollectionView)
		
		// Ограничения для секции "Recommended"
		NSLayoutConstraint.activate([
			recommendedSection.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
			recommendedSection.leadingAnchor.constraint(equalTo: view.leadingAnchor/*, constant: 13*/),
			recommendedSection.trailingAnchor.constraint(equalTo: view.trailingAnchor/*, constant: -13*/),
//			recommendedSection.heightAnchor.constraint(equalToConstant: 400),
			recommendedSection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
			recommendedLabel.topAnchor.constraint(equalTo: recommendedSection.topAnchor, constant: 16),
			recommendedLabel.leadingAnchor.constraint(equalTo: recommendedSection.leadingAnchor, constant: 16),
			
			viewAllButton.trailingAnchor.constraint(equalTo: recommendedSection.trailingAnchor, constant: -16),
			viewAllButton.centerYAnchor.constraint(equalTo: recommendedLabel.centerYAnchor),
			
			recommendedCollectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 16),
			recommendedCollectionView.leadingAnchor.constraint(equalTo: recommendedSection.leadingAnchor),
			recommendedCollectionView.trailingAnchor.constraint(equalTo: recommendedSection.trailingAnchor),
			recommendedCollectionView.bottomAnchor.constraint(equalTo: recommendedSection.bottomAnchor)
		])
		
	}
	
	
}

// MARK: - UICollectionViewDataSource
extension SecondVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == sliderCollectionView {
			return placeData.count
		} else {
			return placeData.count
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if collectionView == sliderCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
			cell.configure(with: placeData[indexPath.row])
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
			// создаем идентификатор
			let heartButtonKey = "heartButtonState_\(indexPath.item)"
			// загрузка состояня из UserDefaults
			let isHeartSelected = UserDefaults.standard.bool(forKey: heartButtonKey)
			// обработка нажатия кнопки
			cell.onHeartButtonTap = { // [weak self] tappedCell in
//				guard let self = self else {return}
				print(indexPath)
				// находим индекс ячейки
				if let index = collectionView.indexPath(for: $0)?.item {
					// инверсия состояния кнопки
					let newState = !UserDefaults.standard.bool(forKey: "heartButtonState_\(index)")
					// сохранение нового состояния
					UserDefaults.standard.set(newState, forKey: "heartButtonState_\(index)")
					if UserDefaults.standard.bool(forKey: "heartButtonState_\(index)") {
						print("Ячейка \(self.placeData[indexPath.row].title) добавлена в избранное")
					} else {
						print("Ячейка \(self.placeData[indexPath.row].title) удалена из избранного")
					}
					
					// перегружаем ячейку для обновления вида
					collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
				}
			}
			// настройка ячейки
			cell.configure(with: placeData[indexPath.row], isHeartSelected: isHeartSelected)
			return cell
		}
	}
}
	
// MARK: - UICollectionViewDelegateFlowLayout
extension SecondVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if collectionView == sliderCollectionView {
			let size = CGSize(width: 335, height: 250)
			print("Cell size: \(size)")
			return size
		} else {
			let spacer = (view.bounds.width * 0.05) * 3
			let cellSize: CGFloat = (view.bounds.width - spacer) / 2
			let size = CGSize(width: cellSize, height: cellSize) /*(width: 175, height: 175)*/
			print("Recommended cell size: \(size)")
			return size
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
	
	// !!!!
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		guard let layout = sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
		
		let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
		let contentInsetLeft = sliderCollectionView.contentInset.left
		
		// Вычисляем индекс ближайшей ячейки к левому краю
		let rawIndex = (scrollView.contentOffset.x + contentInsetLeft) / cellWidthIncludingSpacing
		let nearestIndex = round(rawIndex)
		
		// Вычисляем новую целевую позицию
		let newOffsetX = nearestIndex * cellWidthIncludingSpacing - contentInsetLeft
		targetContentOffset.pointee = CGPoint(x: newOffsetX, y: -scrollView.contentInset.top)
	}
	
}

extension SecondVC {
	
	// Создать кнопку для раздела
	private func createTabButton(title: String, isSelected: Bool = false) -> UIButton {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.titleLabel?.textAlignment = .center
		button.setTitleColor(isSelected ? .appPurple : .black, for: .normal)
		button.titleLabel?.font = MyAppFont.makeSourceSansPro(size: 16, weight: .Regular)
//		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
	
	private func createSliderLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
//		layout.itemSize = CGSize(width: 335 /*view.frame.width - 32*/, height: 250)
		layout.minimumLineSpacing = 16
		
		return layout
	}
	
	private func createRecommendedLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
//		layout.itemSize = CGSize(width: (view.frame.width - 15) / 2, height: 175)
		layout.minimumLineSpacing = 15
		layout.minimumInteritemSpacing = 15
		return layout
	}
	
	// Для обработки действия UIPageControl
	@objc private func pageControlValueChanged() {
		let currentPage = pageControl.currentPage
		let indexPath = IndexPath(item: currentPage, section: 0)
		
		// Прокручиваем UICollectionView к соответствующей странице
		sliderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
}
