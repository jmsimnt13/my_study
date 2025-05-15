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
		var arrTemp: [PlaceData] = [
			
		]
		return arrTemp
	}
}

class SecondVC: UIViewController, UICollectionViewDataSource {
	var placeData: [PlaceData] = PlaceData.fillArray()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
	}
	
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
		return cell
	}
}

extension SecondVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(placeData[indexPath.row])
	}
}
