//
//  NetworkManager.swift
//  travelApp
//
//  Created by Данила on 12.06.2025.
//

import Foundation

// 1 - url куда мы будем отправлять запрос
// 2 - ключ доступа
// 3 - дополнительные параметры в рамках выбранного API

// 4 - выполнить запрос
//client_id
class NetworkManager {
	let apiKeyForUnsplash: String = "5rXeAnsgJrCwDiFAQC5QRvvp3cDk3yliR_LMWh1MSJI"
	let apiKeyForGeoapify: String = "f680f379bcf149a783f5858ad873466a"
	let urlForUnsplash: String = "https://api.unsplash.com"
	let urlForGeoapify: String = "https://api.geoapify.com"
	let filterFieldForGeo: String = "circle:12.4924,41.8902,50000"
	let limitForGeo: String = "15"
	/// photos/random
	/// /v2/places?
	/// https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:12.4924,41.8902,10000&limit=10&apiKey=f680f379bcf149a783f5858ad873466a
	///  https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:92.872586,56.0091173,750000&bias=proximity:92.872586,56.0091173&limit=20&apiKey=YOUR_API_KEY

	func fetchPlaces(completion: @escaping ([PlaceData]) -> Void) {
		var urlComponentsGeoapify = URLComponents(string: urlForGeoapify)
		urlComponentsGeoapify?.path = "/v2/places"
		urlComponentsGeoapify?.queryItems = [
			URLQueryItem(name: "categories", value: "tourism.sights"),
			URLQueryItem(name: "filter", value: filterFieldForGeo),
			URLQueryItem(name: "limit", value: limitForGeo),
			URLQueryItem(name: "apiKey", value: apiKeyForGeoapify)
		]
		
		guard let url = urlComponentsGeoapify?.url else {
			print("invalid url")
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard error == nil else {
				print("Error: \(error!.localizedDescription)")
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse else {
				print("Invalid response")
				return
			}
			
			print("HTTP Status Code: \(httpResponse.statusCode)")
			
			guard let data = data else {
				print("No data received")
				return
			}
			
			// отладка json'a
			if let jsonString = String(data: data, encoding: .utf8) {
				print("JSON Response: \(jsonString)")
			}
			
			do {
				let result = try JSONDecoder().decode(Responce.self, from: data)
				let places = result.features.map { place -> PlaceData in
					let properties = place.properties
					return PlaceData(
						title: properties.name ?? "unknown",
						description: properties.description ?? "No description",
						place: (country: properties.country ?? "unknown", city: properties.city ?? "Unknown"),
						userMark: (Double.random(in: 3...5) * 10).rounded(.toNearestOrAwayFromZero) / 10, // рандом оценка
						price: Int.random(in: 500...2000), // рандом цена
						durationInDays: Int.random(in: 1...10), // от 1 до 10 дней рандом
						imageAssetName: "UnsplashImageHere" // Надо прикрутить сюда картинку от Unsplash
					)
				}
				completion(places)
			} catch {
				print("Decoding error: \(error.localizedDescription)")
			}
		}.resume()
	}
}
