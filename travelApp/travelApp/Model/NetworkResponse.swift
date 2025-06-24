//
//  Response.swift
//  travelApp
//
//  Created by Данила on 13.06.2025.
//

import Foundation

struct ResponceGeoapify: Decodable {
	let type: String // "type": "FeatureCollection",
	let features: [Place]
}

struct ResponceUnsplash: Decodable {
	let urls: ImageUrls
}

struct ImageUrls: Decodable {
	let regular: String
	let full: String
}

struct Place: Decodable {
	let type: String //  "type": "Feature",
	let properties: PlaceProperites
}

struct PlaceProperites: Decodable {
	let name: String?
	let country: String?
	let city: String?
	let description: String?
}
// объект struct
