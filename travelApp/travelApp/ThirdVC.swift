//
//  ThirdVC.swift
//  travelApp
//
//  Created by Данила on 19.05.2025.
//

import UIKit

final class ThirdVC: UIViewController {
	
	var placeData: PlaceData? // свойство куда передается информация о выбранном месте
	var networkManager: NetworkManager? // свойство куда передаем ссылку на экземпляр сетевого менеджера
	
	// Вынос контейнеров для корректной работы функции по закраске звезд для досутпа к placeData
	// Следует ли все контейнеры вынести в свойства???
	lazy var placeInfoContainerView = UIView()
	lazy var ratingStackView = UIStackView()
	
	// Для реализации тумблера с выбором дней отдыха
	lazy var personControlStack = UIStackView()
	lazy var personLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .appPurple
		//
		setupUI()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.navigationBar.isHidden = true
	}
	
	private func setupUI() {
		// аккуратненько вынимаем данные если они успешно передались))0
		guard let place = placeData else { return }
		
		// Подложка в виде изображения местности
		let backgroundImageView: UIImageView = {
//			$0.image = UIImage(named: "\(place.imageAssetName)") установка изображения местности переехала
			$0.contentMode = .scaleToFill
			$0.clipsToBounds = true
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIImageView())
		
		networkManager?.loadImage(urlString: placeData?.imageAssetUrl ?? "none") { image in
			DispatchQueue.main.async {
				backgroundImageView.image = image ?? UIImage(named: "appVillage")
			}
		}
		
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
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
		placeInfoContainerView = {
			$0.backgroundColor = UIColor.white
			$0.layer.cornerRadius = 37
			$0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
			$0.clipsToBounds = true
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
			return $0
		}(UIView())
		
		let titleLabel: UILabel = {
			$0.text = place.title
			$0.textColor = .black
			$0.font = MyAppFont.makeMerriweather(size: 24, weight: .Bold)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		// UIStackView для местоположения
		let locationStackView: UIStackView = {
			$0.axis = .horizontal
			$0.spacing = 4
			$0.alignment = .center
			$0.distribution = .fill
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		let locationImage: UIImageView = {
			$0.image = UIImage(named: "appLocationIcon")
			$0.widthAnchor.constraint(equalToConstant: 14).isActive = true
			$0.heightAnchor.constraint(equalToConstant: 14).isActive = true
			$0.contentMode = .scaleAspectFit
			$0.tintColor = .black
			locationStackView.addArrangedSubview($0)
			return $0
		}(UIImageView())
		
		let locationLabel: UILabel = {
			$0.text = "\(place.place.city), \(place.place.country)"
			$0.textColor = .black
			$0.font = MyAppFont.makeSourceSansPro(size: 12, weight: .Bold)
			$0.font = UIFont.systemFont(ofSize: 12)
			$0.translatesAutoresizingMaskIntoConstraints = false
			locationStackView.addArrangedSubview($0)
			return $0
		}(UILabel())
		
		ratingStackView = {
			$0.axis = .horizontal
			$0.spacing = 4
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		// добавляем пять звезд
		for _ in 1...5 {
			let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
			starImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
			starImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
			starImageView.tintColor = .gray
			ratingStackView.addArrangedSubview(starImageView)
		}
		
		let ratingLabel = UILabel()
		ratingLabel.text = "\(place.userMark)"
		ratingLabel.textColor = .black
		ratingLabel.font = MyAppFont.makeSourceSansPro(size: 12, weight: .Bold)
		ratingLabel.translatesAutoresizingMaskIntoConstraints = false
		ratingStackView.addArrangedSubview(ratingLabel)
		
		// Заполняем цветом рейтинг
		updateStarRating(rating: place.userMark)
		
		// настраиваем стек для тумберов выбора количества персон
		personControlStack = {
			$0.axis = .horizontal
			$0.spacing = 0
			$0.distribution = .fillEqually
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		// -
		let _ : UIButton = {
			$0.setTitle("-", for: .normal)
			$0.setTitleColor(.white, for: .normal)
			$0.backgroundColor = .appViolet
			$0.layer.cornerRadius = 13.5
			$0.addTarget(self, action: #selector(decreasePersons), for: .touchUpInside)
			$0.translatesAutoresizingMaskIntoConstraints = false
			personControlStack.addArrangedSubview($0)
			return $0
		}(UIButton(type: .system))
		
		// Количество персон
		personLabel = {
			$0.text = "1"
			$0.font = MyAppFont.makeSourceSansPro(size: 16, weight: .Bold)
			$0.textAlignment = .center
			$0.translatesAutoresizingMaskIntoConstraints = false
			personControlStack.addArrangedSubview($0)
			return $0
		}(UILabel())
		
		// +
		let _ : UIButton = {
			$0.setTitle("+", for: .normal)
			$0.setTitleColor(.white, for: .normal)
			$0.backgroundColor = .appViolet
			$0.layer.cornerRadius = 13.5
			$0.addTarget(self, action: #selector(increasePersons), for: .touchUpInside)
			$0.translatesAutoresizingMaskIntoConstraints = false
			personControlStack.addArrangedSubview($0)
			return $0
		}(UIButton(type: .system))
		
		let durationStackView: UIStackView = {
			$0.axis = .horizontal
			$0.spacing = 8
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIStackView())
		
		let clockImageView = UIImageView(image: UIImage(systemName: "clock"))
		clockImageView.tintColor = .black
		clockImageView.contentMode = .scaleAspectFit
		durationStackView.addArrangedSubview(clockImageView)
		
		let durationLabel: UILabel = {
			$0.text = String(place.durationInDays) + " Days"
			$0.textColor = .black
			$0.font = MyAppFont.makeSourceSansPro(size: 16, weight: .Regular)
			durationStackView.addArrangedSubview($0)
			return $0
		}(UILabel())
		
		
		// Описание
		let descriptionLabel: UILabel = {
			$0.text = "Description"
			$0.textColor = .black
			$0.font = MyAppFont.makeMerriweather(size: 20, weight: .Bold)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let detailsLabel: UILabel = {
			$0.text = place.description
			$0.textColor = .black
			$0.numberOfLines = 0
			$0.font = MyAppFont.makeSourceSansPro(size: 18, weight: .Regular)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let priceLabel: UILabel = {
			$0.text = "$\(place.price)"
			$0.textColor = .appViolet
			$0.font = MyAppFont.makeSourceSansPro(size: 30, weight: .Bold)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let packageLabel: UILabel = {
			$0.text = "/Package"
			$0.textColor = .appViolet
			$0.font = MyAppFont.makeSourceSansPro(size: 18, weight: .Bold)
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UILabel())
		
		let bookNowButton: UIButton = {
			$0.setTitle("Book Now", for: .normal)
			$0.setTitleColor(.white, for: .normal)
			$0.titleLabel?.font = MyAppFont.makeMerriweather(size: 18, weight: .Bold)
			$0.backgroundColor = .appViolet
			
			// добавил проверку с каким экраном мы имеем дело
			if Constants.smallScreen {
				$0.widthAnchor.constraint(equalToConstant: 130).isActive = true
				$0.heightAnchor.constraint(equalToConstant: 40).isActive = true
				$0.layer.cornerRadius = 20
			} else {
				$0.widthAnchor.constraint(equalToConstant: 160).isActive = true
				$0.heightAnchor.constraint(equalToConstant: 50).isActive = true
				$0.layer.cornerRadius = 25
			}
			$0.translatesAutoresizingMaskIntoConstraints = false
			placeInfoContainerView.addSubview($0)
			return $0
		}(UIButton(type: .system))
		
		// Активация ограничений
		NSLayoutConstraint.activate([
			placeInfoContainerView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -37),
			placeInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			placeInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			placeInfoContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: placeInfoContainerView.topAnchor, constant: 25),
			titleLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			titleLabel.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -25),
			
			locationStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			locationStackView.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			
			ratingStackView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: 8),
			ratingStackView.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			
			personControlStack.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
			personControlStack.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			
			durationStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
			durationStackView.centerYAnchor.constraint(equalTo: personControlStack.centerYAnchor),
			durationStackView.leadingAnchor.constraint(equalTo: personControlStack.trailingAnchor, constant: 25),
			
			descriptionLabel.topAnchor.constraint(equalTo: durationStackView.bottomAnchor, constant: 16),
			descriptionLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			
			detailsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
			detailsLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			detailsLabel.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -25),
			
			// $400/Package
			priceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
			priceLabel.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 25),
			packageLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
			packageLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
			
			// Book Now
			bookNowButton.trailingAnchor.constraint(equalTo: placeInfoContainerView.trailingAnchor, constant: -25),
			bookNowButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
		])
	}
}

