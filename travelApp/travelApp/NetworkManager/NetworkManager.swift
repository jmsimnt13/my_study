//
//  NetworkManager.swift
//  travelApp
//
//  Created by Данила on 12.06.2025.
//

import Foundation
import UIKit

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
	let limitForGeo: String = "1"
	
	let imageCache = NSCache<NSString, UIImage>()
	
	/// photos/random
	/// /v2/places?
	/// https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:12.4924,41.8902,10000&limit=10&apiKey=f680f379bcf149a783f5858ad873466a
	///  https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:92.872586,56.0091173,750000&bias=proximity:92.872586,56.0091173&limit=20&apiKey=YOUR_API_KEY
	/// разобраться как прикрутить изображение по этому url к моему изображению https://images.unsplash.com/photo-1657566638409-f7fa1a761b42?crop=entropy\u0026cs=tinysrgb\u0026fit=max\u0026fm=jpg\u0026ixid=M3w3NjI2ODd8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NDk5NzM3NTh8\u0026ixlib=rb-4.1.0\u0026q=80\u0026w=1080

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
				print("Geoapify Error: \(error!.localizedDescription)")
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse else {
				print("Invalid response from geoapify")
				return
			}
			
			print("HTTP Status Code: \(httpResponse.statusCode)")
			
			guard let data = data else {
				print("No data received from geopify")
				return
			}
			
//			// отладка json'a
//			if let jsonString = String(data: data, encoding: .utf8) {
//				print("JSON Response: \(jsonString)")
//			}
			
			do {
				let result = try JSONDecoder().decode(ResponceGeoapify.self, from: data)
				let features = result.features
				
				// Создаем группу для параллельных запросов
				let dispatchGroup = DispatchGroup()
				
				var places: [PlaceData] = []
				
				for feature in features {
					let properties = feature.properties
					// Входим в группу перед каждым запросом
					dispatchGroup.enter()
					
					self.fetchImage(query: properties.name ?? "unknown") { imageUrl in
						let place = PlaceData(
							title: properties.name ?? "unknown",
							description: properties.description ?? "No description",
							place: (country: properties.country ?? "unknown", city: properties.city ?? "Unknown"),
							userMark: (Double.random(in: 3...5) * 10).rounded(.toNearestOrAwayFromZero) / 10, // рандом оценка
							price: Int.random(in: 500...2000), // рандом цена
							durationInDays: Int.random(in: 1...10), // от 1 до 10 дней рандом
							imageAssetUrl: imageUrl ?? "appVillage" // Надо прикрутить сюда картинку от Unsplash
						)
						places.append(place)
						
						// Выходим из группы после завершения запроса
						dispatchGroup.leave()
					}
				}
				
				// Ждем пока не завершатся все запросы
				dispatchGroup.notify(queue: .main){
					completion(places)
				}
			} catch {
				print("Decoding error: \(error.localizedDescription)")
			}
		}.resume()
	}
	
	func fetchImage(query: String, completion: @escaping (String?) -> Void) {
		guard var urlComponents = URLComponents(string: urlForUnsplash)  else {
			completion(nil)
			return
		}
		
		urlComponents.path = "/photos/random"
		
		var components = urlComponents
		components.queryItems = [
			URLQueryItem(name: "client_id", value: apiKeyForUnsplash),
			URLQueryItem(name: "query", value: query),
			URLQueryItem(name: "orientation", value: "landscape")
		]
		
		guard let url = components.url else {
			completion(nil)
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: url) { data, resp, err in
			guard err == nil else {
				print(err!.localizedDescription)
				completion(nil)
				return
			}
			
			guard let httpResponse = resp as? HTTPURLResponse else {
				print("Invalid response from geoapify")
				return
			}
			
			print("HTTP Status Code: \(httpResponse.statusCode)")
			
			guard let data else {
				completion(nil)
				return
			}
			
//			отладка json'a
			if let jsonString = String(data: data, encoding: .utf8) {
				print("JSON Response: \(jsonString)")
			}
			
			do {
				let result = try JSONDecoder().decode(ResponceUnsplash.self, from: data)
				completion(result.urls.regular)
			} catch {
				print("Unsplash decoding error: \(error.localizedDescription)")
				completion(nil)
			}
		}.resume()
	}
	
	func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
		guard let url = URL(string: urlString) else {
			completion(nil)
			return
		}
		
		if let cachedImage = imageCache.object(forKey: urlString as NSString) {
			completion(cachedImage)
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, resp, err in
			guard let data = data, err == nil else {
				print("There is problem with data")
				completion(nil)
				return
			}
			let image = UIImage(data: data)
			self.imageCache.setObject(image!, forKey: urlString as NSString)
			DispatchQueue.main.async {
				completion(image)
			}
		}.resume()
	}
}
