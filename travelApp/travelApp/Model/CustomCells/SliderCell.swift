//
//  SliderCell.swift
//  travelApp
//
//  Created by Данила on 20.05.2025.
//

import UIKit
import Kingfisher

class SliderCell: UICollectionViewCell {
	let imageView = UIImageView()
	let titleLabel = UILabel()
	lazy var ratingStackView = UIStackView()
	let starImageView = UIView()
	let ratingLabel = UILabel()
	let heartButton = UIButton()
	// замыкание для обработки нажатия кнопки
	var onHeartButtonTap: ((SliderCell) -> Void)?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .appPurple
		layer.cornerRadius = 19
		clipsToBounds = true
		
		// ImageView
		imageView.backgroundColor = .lightGray
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)
		
		// Title Label
		titleLabel.textColor = .white
		titleLabel.font = MyAppFont.makeMerriweather(size: 20, weight: .Bold)
//		titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(titleLabel)
		
		// Rating Stack View
		
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
		ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
		ratingLabel.translatesAutoresizingMaskIntoConstraints = false
		ratingStackView.addArrangedSubview(ratingLabel)
		
		// Heart Button
		// Установка изображения
		if let image = UIImage(named: "appHeartButton") {
			heartButton.setImage(image, for: .normal)
		} else {
			print("Изображение 'appHeartButton' не найдено")
		}
		heartButton.addTarget(self, action: #selector(heartButtonIsTapped), for: .touchUpInside)
		heartButton.layer.cornerRadius = 12
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
			
			heartButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			heartButton.widthAnchor.constraint(equalToConstant: 24),
			heartButton.heightAnchor.constraint(equalToConstant: 24)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension SliderCell {
	func configure(with place: PlaceData, isHeartSelected: Bool) {
		titleLabel.text = place.title
		ratingLabel.text = "\(place.userMark)"
//		imageView.image = UIImage(named: "\(place.imageAssetName)") // устанока изображения переехала 
		ratingLabel.text = "\(place.userMark)"
		// Заполняем цветом рейтинг
		updateStarRating(rating: place.userMark)
		
		// Загружаем состояни
		heartButton.isSelected = isHeartSelected
		
		// Кнопка выглядит иначе в завимисимости от нахождения в избранном
		heartButton.backgroundColor = isHeartSelected ? .appYellow : .white
		
		// Загружаем картинку по полученному URL
		// Kingfisher сам проверить и загрузит изображение из кеша при необходимости
		imageView.kf.setImage(with: URL(string: place.imageAssetUrl),
							  placeholder: UIImage(named: "appVillage"),
							  options: [
								.scaleFactor(UIScreen.main.scale),
								.transition(.fade(0.2)) // плавный переход
							  ])
		
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
	
	// Сохранение состояния кнопки
	func buttonTapped(_ sender: UIButton) {
		//Переключение состояния
		sender.isSelected.toggle()
		
		//Сохранение сосотяния в UserDefaults
		UserDefaults.standard.set(sender.isSelected, forKey: "isButtonSelected")
	}
	
	@objc func heartButtonIsTapped() {
		let message = heartButton.isSelected ? "Ячейка \(titleLabel.text ?? "unknown") удалена из избранного" :  "Ячейка \(titleLabel.text ?? "unknown") добавлена в избранное"
		print(message)
		onHeartButtonTap?(self)
	}
}
