//
//  View.ext.swift
//  bookshelf
//
//  Created by Данила on 25.04.2025.
//

import SwiftUI

extension View {
	func font(type: FontType = .regular, size: CGFloat = 14) -> some View {
		modifier(CustomFont(font: type, size: size))
	}
}
