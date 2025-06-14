//
//  NetworkManager.swift
//  urlSession_consult
//
//  Created by Данила on 11.06.2025.
//

import Foundation

// 1 - url куда мы будем отправлять запрос
// 2 - ключ доступа
// 3 - дополнительные параметры в рамках выбранного API

// 4 - выполнить запрос
//client_id
class NetworkManager {
	let apiKey: String = "5rXeAnsgJrCwDiFAQC5QRvvp3cDk3yliR_LMWh1MSJI"
	let url: String = "https://api.unsplash.com"
	///photos/random
	///
	func sendRequest(query: String, completion: @escaping (String) -> Void){
		
		//
		
		var urlComponents = URLComponents(string: url)
		urlComponents?.path = "/photos/random"
		
		urlComponents?.queryItems = [
			URLQueryItem(name: "client_id", value: apiKey),
			URLQueryItem(name: "query", value: query),
			URLQueryItem(name: "orientation", value: "landscape")
		]
		
		guard let url = urlComponents?.url else {return}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"

		
		URLSession.shared.dataTask(with: request) { data, resp, err in
			guard err == nil else {
				print(err!.localizedDescription)
				return
			}
			
			guard let data else {return}
			
			do {
				let result = try JSONDecoder().decode(Responce.self, from: data)
				completion(result.urls.regular)
			} catch {
				print(error.localizedDescription)
			}
			
		}.resume()
	}
}
