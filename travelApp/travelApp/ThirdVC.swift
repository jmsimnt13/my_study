//
//  ThirdVC.swift
//  travelApp
//
//  Created by Данила on 19.05.2025.
//

import UIKit

class ThirdVC: UIViewController {
	var placeData: PlaceData? // свойство куда передается информация о выбранном месте

	lazy var backAction: UIAction = UIAction { [weak self] _ in
		// чтобы вернуться назад нужно сделать вот так
		self?.navigationController?.popViewController(animated: true)
	} // вообще я ожидал что появится кнока в левом верхнем углу назад.... но она не появилась
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .appPurple
		//
		setupUI()
	}
	
	private func setupUI() {
		// аккуратненько вынимаем данные если они успешно передались))0
		guard let place = placeData else { return }
		
		// Подложка в виде изображения местности
		let backgroundImageView: UIImageView = {
			$0.image = UIImage(named: "mainVC")
			$0.contentMode = .scaleAspectFill
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIImageView())
		
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
		
		// Навигация (верх слева) только с кнпкой меню поверх фонового изображения
		let menuButton: UIButton = {
			$0.setImage(UIImage(named: "appMenu"), for: .normal)
			$0.tintColor = .black
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIButton(type: .system))
		
		NSLayoutConstraint.activate([
			menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
		])
		
		// Основной контейнер для отображения информации
		let placeInfoContainerView: UIView = {
			$0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
			$0.layer.cornerRadius = 20
			$0.clipsToBounds = true
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIView())
		
		let titleLabel: UILabel = {
			$0.text = place.title
			$0.textColor = .black
			$0.font = UIFont.boldSystemFont(ofSize: 24)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let locationLabel: UILabel = {
			$0.text = "\(place.place.city), \(place.place.country)"
			$0.textColor = .black
			$0.font = UIFont.systemFont(ofSize: 16)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		NSLayoutConstraint.activate([
			placeInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
			placeInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			placeInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			placeInfoContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
			
			titleLabel.topAnchor.constraint(equalTo: placeInfoContainerView.topAnchor, constant: 16),
			titleLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -16),
			
			locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			locationLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			
		])
	}
	
	
}
