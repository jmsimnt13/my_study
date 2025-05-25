//
//  PlaceData.swift
//  travelApp
//
//  Created by Данила on 24.05.2025.
//

import Foundation

struct PlaceData {
	let title: String
	let description: String
	let place: (country: String, city: String)
	var userMark: Double
	let price: Double
	let durationInDays: Int
	let imageAssetName: String
	
	// Заполнение массива мест
	static func fillArray() -> [PlaceData] {
		//
		let arrTemp: [PlaceData] = [
			PlaceData(title: "Northern Mountain", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Jercey"), userMark: 4.5, price: 334.5, durationInDays: 5, imageAssetName: "appVillage"),
			PlaceData(title: "Greenough", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("USA", "Montana"), userMark: 3.9, price: 521.7, durationInDays: 3, imageAssetName: "appMontana"),
			PlaceData(title: "Mount Fuji", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("Japan", "Honshu"), userMark: 4.9, price: 400.0, durationInDays: 5, imageAssetName: "appFuji"),
			PlaceData(title: "Alpen Gold", description: "Bad tattoos on leather-tanned skin Jesus Christ on a plastic sign Fall in love again and again Winding roads, doing manual drive", place: ("Austria", "Salzburg"), userMark: 4.1, price: 600.0, durationInDays: 3, imageAssetName: "appLake"),
		]
		return arrTemp
	}
}
