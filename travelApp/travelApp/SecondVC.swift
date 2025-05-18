//
//  SecondVC.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import Foundation
import UIKit

struct PlaceData {
	let title: String
	let description: String
	let place: (country: String, city: String)
	var userMark: Double
	let price: Double
	
	// Заполнение массива мест
	static func fillArray() -> [PlaceData] {
		//
		let arrTemp: [PlaceData] = [
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.3, price: 234.5),
		]
		return arrTemp
	}
}

class SecondVC: UIViewController, UICollectionViewDelegateFlowLayout {
	private var placeData: [PlaceData] = PlaceData.fillArray()
	
	//MARK: UI элементы
	/// Навигационная строка, на которую лягут меню заголовок и иконка профиля пользователя
	private let navigationBar: UIView = {
		$0.backgroundColor = .clear
		return $0
	}(UIView())
	
	// Изображение меню
	private let menuImageView: UIImageView = {
		$0.image = UIImage(named: "appMenu")
		$0.frame.size.height = 33
		$0.frame.size.width = 33
		$0.contentMode = .scaleAspectFit
		$0.clipsToBounds = true
		return $0
	}(UIImageView())
	
	// Discover
	private let titleLabelDiscover: UILabel = {
		let label = UILabel()
		$0.text = "Discover"
		$0.textAlignment = .center
		$0.font = UIFont.boldSystemFont(ofSize: 27)
		$0.textColor = .black
		return $0
	}(UILabel())
	
	/// Вью, на которую лягут разделы табы
	private let tabsView: UIView = {
		$0.backgroundColor = .clear
		return $0
	}(UIView())
	
	// Сами разделы
	lazy var popularTab = createTabButton(title: "Popular", isSelected: true)
	lazy var featuredTab = createTabButton(title: "Featured")
	lazy var mostVisitedTab = createTabButton(title: "Most Visited")
	lazy var europeTab = createTabButton(title: "Europe")
	lazy var asiaTab = createTabButton(title: "Asia")
	
	// Шаблон для таблицы внизу с прокруткой горизонтальный + индикаторы страницы
	private let sliderLayoutHorizontal: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 335, height: 253)
		layout.minimumLineSpacing = 16
		return layout
	}()
	
	private lazy var placeCollectionViewHorizontal: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: sliderLayoutHorizontal)
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = .appPurple
		return collectionView
	}()
	
	lazy var pageControl: UIPageControl = {
		$0.currentPageIndicatorTintColor = .appPurple
		$0.pageIndicatorTintColor = .lightGray
		$0.numberOfPages = 3
		return $0
	}(UIPageControl())
	
	/// Вью на которую лягут элементы из раздела рекомендации
	private let recomendedView: UIView = {
		$0.backgroundColor = .clear
		return $0
	}(UIView())
	// Recomended
	private let titleLabelRecomended: UILabel = {
		$0.text = "Recomended"
		$0.textAlignment = .center
		$0.numberOfLines = 0
		$0.font = UIFont.boldSystemFont(ofSize: 18) // Как заставить работать с моими шрифтами хз
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// View All
	private let titleLabelViewAll: UILabel = {
		$0.text = "View All"
		$0.textAlignment = .center
		$0.numberOfLines = 0
		$0.font = UIFont.systemFont(ofSize: 14) // Как заставить работать с моими шрифтами хз
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// Шаблон для таблицы внизу с прокруткой вертиально
	private let sliderLayoutVertical: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.itemSize = CGSize(width: 175, height: 175)
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		return layout
	}()
	
	private lazy var placeCollectionViewVertical: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: sliderLayoutVertical)
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.backgroundColor = .white
		return collectionView
	}()
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//
		setupUI()
		setupConstraints()
	}
	
	//MARK: SETUP UI
	private func setupUI() {
		view.backgroundColor = .white
		
		view.addSubview(navigationBar)
		navigationBar.addSubview(menuImageView)
		navigationBar.addSubview(titleLabelDiscover)
		//navigationBar.addSubview(profileImageView)
		
		view.addSubview(tabsView)
		tabsView.addSubview(popularTab)
		tabsView.addSubview(featuredTab)
		tabsView.addSubview(mostVisitedTab)
		tabsView.addSubview(europeTab)
		tabsView.addSubview(asiaTab)
		view.addSubview(placeCollectionViewHorizontal)
		placeCollectionViewHorizontal.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(pageControl)
		
		view.addSubview(recomendedView)
		recomendedView.addSubview(titleLabelRecomended)
		recomendedView.addSubview(titleLabelViewAll)
		view.addSubview(placeCollectionViewVertical)
		placeCollectionViewVertical.translatesAutoresizingMaskIntoConstraints = false
	}
	
	//MARK: CONSTRAINTS
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			//MARK: ВЕРХ СТРАНИЦЫ
			// Ограничения для строки навигации
			navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			navigationBar.heightAnchor.constraint(equalToConstant: 50),
			
			// Ограничения для картинки
			menuImageView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
			menuImageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
			
			// Ограничения для Discover
			titleLabelDiscover.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
			titleLabelDiscover.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
			
			// Ограничения для кнопок Popular Featured Most.. + pageControl
			tabsView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
			tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tabsView.heightAnchor.constraint(equalToConstant: 40),
			
			popularTab.leadingAnchor.constraint(equalTo: tabsView.leadingAnchor, constant: 16),
			featuredTab.leadingAnchor.constraint(equalTo: popularTab.trailingAnchor, constant: 16),
			mostVisitedTab.leadingAnchor.constraint(equalTo: featuredTab.trailingAnchor, constant: 16),
			europeTab.leadingAnchor.constraint(equalTo: mostVisitedTab.trailingAnchor, constant: 16),
			asiaTab.leadingAnchor.constraint(equalTo: asiaTab.trailingAnchor, constant: 16),
			
			popularTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			featuredTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			mostVisitedTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			europeTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			asiaTab.centerYAnchor.constraint(equalTo: tabsView.centerYAnchor),
			
			pageControl.topAnchor.constraint(equalTo: placeCollectionViewHorizontal.bottomAnchor, constant: 8),
			pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pageControl.heightAnchor.constraint(equalToConstant: 20),
			
			// Слайдер с карточками
			placeCollectionViewHorizontal.topAnchor.constraint(equalTo: tabsView.bottomAnchor, constant: 16),
			placeCollectionViewHorizontal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			placeCollectionViewHorizontal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			placeCollectionViewHorizontal.heightAnchor.constraint(equalToConstant: 250),
			
			//MARK: СЕКЦИЯ РЕКОМЕНДАЦИИ
			recomendedView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 32),
			recomendedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			recomendedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			recomendedView.heightAnchor.constraint(equalToConstant: 300),
			
			titleLabelRecomended.leadingAnchor.constraint(equalTo: recomendedView.leadingAnchor, constant: 16),
			titleLabelRecomended.topAnchor.constraint(equalTo: recomendedView.topAnchor, constant: 16),
			
			titleLabelViewAll.trailingAnchor.constraint(equalTo: recomendedView.trailingAnchor, constant: -16),
			titleLabelViewAll.centerYAnchor.constraint(equalTo: recomendedView.centerYAnchor),
			
			placeCollectionViewVertical.topAnchor.constraint(equalTo: titleLabelRecomended.bottomAnchor, constant: 16),
			placeCollectionViewVertical.leadingAnchor.constraint(equalTo: recomendedView.leadingAnchor),
			placeCollectionViewVertical.trailingAnchor.constraint(equalTo: recomendedView.trailingAnchor),
			placeCollectionViewVertical.bottomAnchor.constraint(equalTo: recomendedView.bottomAnchor),
		])
	}

//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return CGSize(width: 175, height: 175)
//	}
	
	//Создание одного раздела
	private func createTabButton(title: String, isSelected: Bool = false) -> UIButton {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.setTitleColor(isSelected ? .appPurple : .black, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold) // тут тоже шрифты
		return button
	}
	
	//Создание слайдера
	
}

extension SecondVC: UICollectionViewDataSource {
	// Количество секций
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	// Количество ячеек в секции
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return placeData.count
	}
	
	// Настройка самой ячейки
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		cell.backgroundColor = .appPurple
		cell.layer.cornerRadius = 10
		return cell
	}
}

extension SecondVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(placeData[indexPath.row])
	}
}
