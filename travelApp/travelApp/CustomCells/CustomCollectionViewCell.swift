//
//  CustomCollectionViewCell.swift
//  travelApp
//
//  Created by Данила on 15.05.2025.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	let titleLabel = UILabel()
	let imageView = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		// Настройка UI элементов
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		contentView.addSubview(imageView)
		
		titleLabel.textColor = .black
		titleLabel.font = UIFont.systemFont(ofSize: 14)
		contentView.addSubview(titleLabel)
		
		// Constraints
		imageView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 100),
			
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
		])
	}
}
