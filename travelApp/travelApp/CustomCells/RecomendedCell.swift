//
//  RecomendedCell.swift
//  travelApp
//
//  Created by Данила on 20.05.2025.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
	let imageView = UIImageView(/*image: UIImage(named: "mainVC")*/)
	let titleLabel = UILabel()
	lazy var ratingStackView = UIStackView()
	let starImageView = UIView()
	let ratingLabel = UILabel()
	let heartButton = UIButton()
	// замыкание для обработки нажатия кнопки
	var onHeartButtonTap: ((RecommendedCell) -> Void)?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .appPurple
		layer.cornerRadius = 10
		clipsToBounds = true
		
		// ImageView
		imageView.backgroundColor = .lightGray
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)
		
		// Title Label
		titleLabel.textColor = .white
		titleLabel.font = MyAppFont.makeMerriweather(size: 12, weight: .Bold)
//		titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(titleLabel)
		
		// rating stack view
		
		ratingStackView = {
			$0.axis = .horizontal
			$0.spacing = 0
			$0.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview($0)
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
		
		ratingLabel.textColor = .white
		ratingLabel.font = UIFont.boldSystemFont(ofSize: 12)
		ratingLabel.translatesAutoresizingMaskIntoConstraints = false
		ratingStackView.addArrangedSubview(ratingLabel)
		
		// Heart Button
//		heartButton.backgroundColor = .red
		// проверяем что изображение правильно добавляется
		if let image = UIImage(named: "appHeartButton") {
			heartButton.setImage(UIImage(named: "appHeartButton")/*?.withRenderingMode(.alwaysOriginal)*/, for: .normal)
		} else {
			print("Изображение 'appHeartButton' не найдено")
		}
		
//		// Установка изображения
//		if let image = UIImage(named: "appHeartButton") {
//			heartButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
//		} else {
//			print("Изображение 'appHeartButton' не найдено")
//		}
		heartButton.addTarget(self, action: #selector(heartButtonIsTapped), for: .touchUpInside)
		heartButton.layer.cornerRadius = 10
		heartButton.clipsToBounds = true
		heartButton.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(heartButton)
		
		// Ограничения
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
			
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			
			ratingStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			ratingStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			
			heartButton.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
//			heartButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: -15),
			heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			heartButton.widthAnchor.constraint(equalToConstant: 20),
			heartButton.heightAnchor.constraint(equalToConstant: 20)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension RecommendedCell {
	
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
	
	// Сохранение состояния кнопки
	@IBAction func buttonTapped(_ sender: UIButton) {
		//Переключение состояния
		sender.isSelected.toggle()
		
		//Сохранение состояния в UserDefaults
		UserDefaults.standard.set(sender.isSelected, forKey: "isButtonSelected")
	}
	
	func configure(with place: PlaceData, isHeartSelected: Bool) {
		titleLabel.text = place.title
		ratingLabel.text = "\(place.userMark)"
		imageView.image = UIImage(named: "\(place.imageAssetName)")
		ratingLabel.text = "\(place.userMark)"
		// Заполняем цветом рейтинг
		updateStarRating(rating: place.userMark)
		
		// Загружаем состояние
		heartButton.isSelected = isHeartSelected
		
		// Кнопка выглядит иначе в зависимости от нахождения в избранном
		heartButton.backgroundColor = isHeartSelected ? .appYellow : .white
	}
	
	@objc func heartButtonIsTapped() {
		print("Heart button is tapped!")
		onHeartButtonTap?(self)
	}
}
