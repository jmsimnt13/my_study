//
//  RecomendedCell.swift
//  travelApp
//
//  Created by Данила on 20.05.2025.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
	let imageView = UIImageView()
	let titleLabel = UILabel()
	let ratingLabel = UILabel()
	let heartButton = UIButton(type: .system)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemPurple
		layer.cornerRadius = 16
		clipsToBounds = true
		
		// ImageView
		imageView.backgroundColor = .lightGray
		contentView.addSubview(imageView)
		
		// Title Label
		titleLabel.textColor = .white
		titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		contentView.addSubview(titleLabel)
		
		// Rating Label
		ratingLabel.textColor = .white
		ratingLabel.font = UIFont.systemFont(ofSize: 14)
		contentView.addSubview(ratingLabel)
		
		// Heart Button
		heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
		heartButton.tintColor = .white
		contentView.addSubview(heartButton)
		
		// Ограничения
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
			
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			
			ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			
			heartButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			heartButton.widthAnchor.constraint(equalToConstant: 32),
			heartButton.heightAnchor.constraint(equalToConstant: 32)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with place: PlaceData) {
		titleLabel.text = place.place.city
		ratingLabel.text = "\(place.userMark)"
	}
}
