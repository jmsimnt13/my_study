//
//  PlaceData.swift
//  travelApp
//
//  Created by Данила on 24.05.2025.
//

import Foundation
import UIKit

struct Constants {
	static let smallScreen = UIScreen.main.nativeBounds.height <= 1334
}

enum CollectionType: Int {
	case horizontal = 1
	case vertical = 2
}

enum RequestType: Int {
	case image = 1
	case place = 2
}

struct PlaceData {
	let title: String
	let description: String
	let place: (country: String, city: String)
	var userMark: Double
	let price: Int
	let durationInDays: Int
	let imageAssetUrl: String
	
	// Заполнение массива мест
	static func fillArray(networkManager: NetworkManager, completion: @escaping ([PlaceData]) -> Void) {
		networkManager.fetchPlaces { places in
			completion(places)
		}
	}
}
