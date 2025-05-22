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
			$0.contentMode = .scaleToFill
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIImageView())
		
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
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
			$0.backgroundColor = UIColor.white
			$0.layer.cornerRadius = 37
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
		
		let ratingStackView: UIStackView = {
			$0.axis = .horizontal
			$0.spacing = 8
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
		starImageView.tintColor = .yellow
		ratingStackView.addArrangedSubview(starImageView)
		
		let ratingLabel = UILabel()
		ratingLabel.text = "\(place.userMark)"
		ratingLabel.textColor = .black
		ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
		ratingStackView.addArrangedSubview(ratingLabel)
		
		let durationStackView: UIStackView = {
			$0.axis = .horizontal
			$0.spacing = 8
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		let clockImageView = UIImageView(image: UIImage(systemName: "clock"))
		clockImageView.tintColor = .black
		durationStackView.addArrangedSubview(clockImageView)
		
		let durationLabel: UILabel = {
			$0.text = String(place.durationInDays) + " Days"
			$0.textColor = .black
			$0.font = UIFont.boldSystemFont(ofSize: 16)
			durationStackView.addArrangedSubview($0)
			return $0
		}(UILabel())
		
		let descriptionLabel: UILabel = {
			$0.text = "Description"
			$0.textColor = .black
			$0.font = UIFont.boldSystemFont(ofSize: 20)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let detailsLabel: UILabel = {
			$0.text = place.description
			$0.textColor = .black
			$0.numberOfLines = 0
			$0.font = UIFont.systemFont(ofSize: 16)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let priceLabel: UILabel = {
			$0.text = "$\(place.price)/Package"
			$0.textColor = .appViolet
			$0.font = UIFont.boldSystemFont(ofSize: 20)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let bookNowButton: UIButton = {
			$0.setTitle("Book Now", for: .normal)
			$0.setTitleColor(.white, for: .normal)
			$0.backgroundColor = .appViolet
			$0.layer.cornerRadius = 10
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIButton(type: .system))
		
		NSLayoutConstraint.activate([
			placeInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
			placeInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			placeInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			placeInfoContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: placeInfoContainerView.topAnchor, constant: 16),
			titleLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -16),
			
			locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			locationLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			ratingStackView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
			ratingStackView.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			durationStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
			durationStackView.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			descriptionLabel.topAnchor.constraint(equalTo: durationStackView.bottomAnchor, constant: 16),
			descriptionLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			detailsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
			detailsLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			detailsLabel.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -16),
			
			priceLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 16),
			priceLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			bookNowButton.topAnchor.constraint(equalToSystemSpacingBelow: priceLabel.bottomAnchor, multiplier: 16),
			bookNowButton.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -16),
			bookNowButton.heightAnchor.constraint(equalToConstant: 50),
			bookNowButton.widthAnchor.constraint(equalToConstant: 200),
			bookNowButton.bottomAnchor.constraint(equalTo: placeInfoContainerView.bottomAnchor, constant: -16),
			
			
		])
	}
	
	
}
