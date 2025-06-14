//
//  SecondVC.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

final class SecondVC: UIViewController {
	let networkManager = NetworkManager()
	lazy var placeData: [PlaceData] = []
	
	// Коллекции
	lazy var sliderCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createSliderLayout())
	lazy var recommendedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createRecommendedLayout())
	
	// Свойства нужные в классе
	 lazy var pageControl = UIPageControl()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		// Настройка UI
		setupUI()
		
		// Получение данных
		PlaceData.fillArray(networkManager: networkManager){ [weak self] places in
			self?.placeData = places
			DispatchQueue.main.async {
				self?.sliderCollectionView.reloadData()
				self?.recommendedCollectionView.reloadData()
			}
		}
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
		])
		
		// Коллекция с горизонтальной прокруткой
		sliderCollectionView.register(SliderCell.self, forCellWithReuseIdentifier: "SliderCell")
		sliderCollectionView.dataSource = self
		sliderCollectionView.delegate = self
		sliderCollectionView.showsHorizontalScrollIndicator = false
		sliderCollectionView.backgroundColor = .clear
		sliderCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) //сдвиг до прокрутки
		sliderCollectionView.translatesAutoresizingMaskIntoConstraints = false
		sliderCollectionView.tag = CollectionType.horizontal.rawValue
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
		recommendedCollectionView.tag = CollectionType.vertical.rawValue
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
			recommendedCollectionView.leadingAnchor.constraint(equalTo: recommendedSection.leadingAnchor, constant: 20),
			recommendedCollectionView.trailingAnchor.constraint(equalTo: recommendedSection.trailingAnchor, constant: -20),
			recommendedCollectionView.bottomAnchor.constraint(equalTo: recommendedSection.bottomAnchor)
		])
	}
}


