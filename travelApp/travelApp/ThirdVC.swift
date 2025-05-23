//
//  ThirdVC.swift
//  travelApp
//
//  Created by Данила on 19.05.2025.
//

import UIKit

class ThirdVC: UIViewController {
	var placeData: PlaceData? // свойство куда передается информация о выбранном месте

	// Вынос контейнеров для корректной работы функции по закраске звезд
	// Следует ли все контейнеры вынести в свойства???
	private lazy var placeInfoContainerView = UIView()
	private lazy var ratingStackView = UIStackView()
	
	// Для реализации тумблера с выбором дней отдыха
	private lazy var personControlStack = UIStackView()
	private lazy var personLabel = UILabel()
	
	// Пока не понял как эту кнопку задействовать, но свайп назад сам по себе работает,
	// либо я не понял как его включил...
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
		placeInfoContainerView = {
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
			starImageView.tintColor = .gray
			ratingStackView.addArrangedSubview(starImageView)
		}
		
		let ratingLabel = UILabel()
		ratingLabel.text = "\(place.userMark)"
		ratingLabel.textColor = .black
		ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
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
			$0.font = UIFont.boldSystemFont(ofSize: 16)
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
			
			personControlStack.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
//			personControlStack.centerXAnchor.constraint(equalTo: placeInfoContainerView.centerXAnchor),
			personControlStack.leadingAnchor.constraint(equalTo: placeInfoContainerView.leadingAnchor, constant: 16),
			
			durationStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 16),
			durationStackView.centerYAnchor.constraint(equalTo: personControlStack.centerYAnchor),
			durationStackView.leadingAnchor.constraint(equalTo: personControlStack.trailingAnchor, constant: 16),
			
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

extension ThirdVC {
	// Методы для увеличения/уменьшения числа дней
	@objc func increasePersons() {
		if let currentPersons = Int(personLabel.text ?? "0"), currentPersons < 10 { // Предположим, максимальное значение — 10 человек
			personLabel.text = "\(currentPersons + 1)"
		}
	}
	
	@objc func decreasePersons() {
		if let currentPersons = Int(personLabel.text ?? "0"), currentPersons > 1 { // Минимальное значение — 1 человек
			personLabel.text = "\(currentPersons - 1)"
		}
	}
	
	// Функция для закрашивания звезд
	func updateStarRating(rating: Double) {
		let roundedRating = Int(rating.rounded())
		
		for i in 0..<5 {
			if i < roundedRating {
				ratingStackView.arrangedSubviews[i].tintColor = .appYellow
			} else {
				ratingStackView.arrangedSubviews[i].tintColor = .lightGray
			}
		}
	}
}
