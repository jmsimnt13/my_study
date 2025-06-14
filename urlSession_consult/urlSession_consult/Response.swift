//
//  Response.swift
//  urlSession_consult
//
//  Created by Данила on 11.06.2025.
//

import Foundation

struct Responce: Decodable {
	let urls: ImageURLS
}

struct ImageURLS: Decodable {
	let regular: String
	let full: String
}

// объект struct
