//
//  ThirdVC.ext.swift
//  travelApp
//
//  Created by Данила on 09.06.2025.
//

import UIKit
import Kingfisher

extension ThirdVC {
	
	// Методы для увеличения/уменьшения числа персон
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
