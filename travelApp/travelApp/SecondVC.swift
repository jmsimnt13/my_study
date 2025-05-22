//
//  SecondVC.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

struct PlaceData {
	let title: String
	let description: String
	let place: (country: String, city: String)
	var userMark: Double
	let price: Double
	let durationInDays: Int
	
	// Заполнение массива мест
	static func fillArray() -> [PlaceData] {
		//
		let arrTemp: [PlaceData] = [
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5, durationInDays: 5),
		]
		return arrTemp
	}
}

class SecondVC: UIViewController {
	var placeData: [PlaceData] = PlaceData.fillArray()
	
	// Коллекции
	lazy var sliderCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createSliderLayout())
	lazy var recommendedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createRecommendedLayout())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		// Настройка UI
		setupUI()
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
		titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
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
		
		// Разделы
		let tabsView = UIView()
		tabsView.backgroundColor = .clear
		tabsView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tabsView)
		
		let popularTab = createTabButton(title: "Popular")
		let featuredTab = createTabButton(title: "Featured")
		let mostVisitedTab = createTabButton(title: "Most Visited")
		let europeTab = createTabButton(title: "Europe")
		let asiaTab = createTabButton(title: "Asia")
		
		popularTab.translatesAutoresizingMaskIntoConstraints = false
		featuredTab.translatesAutoresizingMaskIntoConstraints = false
		mostVisitedTab.translatesAutoresizingMaskIntoConstraints = false
		europeTab.translatesAutoresizingMaskIntoConstraints = false
		asiaTab.translatesAutoresizingMaskIntoConstraints = false
		
		tabsView.addSubview(popularTab)
		tabsView.addSubview(featuredTab)
		tabsView.addSubview(mostVisitedTab)
		tabsView.addSubview(europeTab)
		tabsView.addSubview(asiaTab)
		
		// Ограничения для разделов
		NSLayoutConstraint.activate([
			tabsView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
			tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tabsView.heightAnchor.constraint(equalToConstant: 40),
			
			popularTab.leadingAnchor.constraint(equalTo: tabsView.leadingAnchor, constant: 16),
			featuredTab.leadingAnchor.constraint(equalTo: popularTab.trailingAnchor, constant: 16),
			mostVisitedTab.leadingAnchor.constraint(equalTo: featuredTab.trailingAnchor, constant: 16),
			europeTab.leadingAnchor.constraint(equalTo: mostVisitedTab.trailingAnchor, constant: 16),
			asiaTab.leadingAnchor.constraint(equalTo: europeTab.trailingAnchor, constant: 16),
			
			popularTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			featuredTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			mostVisitedTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			europeTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			asiaTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor)
		])
		
		// Коллекция с горизонтальной прокруткой
		sliderCollectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCell")
		sliderCollectionView.dataSource = self
		sliderCollectionView.delegate = self
		sliderCollectionView.showsHorizontalScrollIndicator = false
		sliderCollectionView.backgroundColor = .clear
		sliderCollectionView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(sliderCollectionView)
		
		// Ограничения для нее
		NSLayoutConstraint.activate([
			sliderCollectionView.topAnchor.constraint(equalTo: tabsView.bottomAnchor, constant: 16),
			sliderCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			sliderCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			sliderCollectionView.heightAnchor.constraint(equalToConstant: 250)
		])
		
		// Индикаторы под коллекцией
		let pageControl = UIPageControl()
		pageControl.currentPageIndicatorTintColor = .purple
		pageControl.pageIndicatorTintColor = .lightGray
		pageControl.numberOfPages = placeData.count
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(pageControl)
		
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
		recommendedLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		recommendedLabel.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(recommendedLabel)
		
		let viewAllButton = UIButton(type: .system)
		viewAllButton.setTitle("View All", for: .normal)
		viewAllButton.setTitleColor(.gray, for: .normal)
		viewAllButton.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(viewAllButton)
		
		// Коллекция рекомендаций вертикальная прокрутка
		recommendedCollectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: "RecommendedCell")
		recommendedCollectionView.dataSource = self
		recommendedCollectionView.delegate = self
		recommendedCollectionView.backgroundColor = .clear
		recommendedCollectionView.translatesAutoresizingMaskIntoConstraints = false
		recommendedSection.addSubview(recommendedCollectionView)
		
		// Ограничения для секции "Recommended"
		NSLayoutConstraint.activate([
			recommendedSection.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 32),
			recommendedSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			recommendedSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//			recommendedSection.heightAnchor.constraint(equalToConstant: 400),
			recommendedSection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
			recommendedLabel.leadingAnchor.constraint(equalTo: recommendedSection.leadingAnchor, constant: 16),
			recommendedLabel.topAnchor.constraint(equalTo: recommendedSection.topAnchor, constant: 16),
			
			viewAllButton.trailingAnchor.constraint(equalTo: recommendedSection.trailingAnchor, constant: -16),
			viewAllButton.centerYAnchor.constraint(equalTo: recommendedLabel.centerYAnchor),
			
			recommendedCollectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 16),
			recommendedCollectionView.leadingAnchor.constraint(equalTo: recommendedSection.leadingAnchor),
			recommendedCollectionView.trailingAnchor.constraint(equalTo: recommendedSection.trailingAnchor),
			recommendedCollectionView.bottomAnchor.constraint(equalTo: recommendedSection.bottomAnchor)
		])
		
	}
	
	private func createTabButton(title: String, isSelected: Bool = false) -> UIButton {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.setTitleColor(isSelected ? .purple : .black, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		return button
	}
	
	private func createSliderLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: view.frame.width - 32, height: 250)
		layout.minimumLineSpacing = 16
		return layout
	}
	
	private func createRecommendedLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.itemSize = CGSize(width: (view.frame.width - 48) / 2, height: 175)
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		return layout
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
			cell.configure(with: placeData[indexPath.row])
			return cell
		}
	}
}
	
// MARK: - UICollectionViewDelegate
extension SecondVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if collectionView == sliderCollectionView {
			return CGSize(width: view.frame.width - 32, height: 250)
		} else {
			return CGSize(width: (view.frame.width - 48) / 2, height: 175)
		}
	}
}

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

