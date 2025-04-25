//
//  CustomFont.swift
//  bookshelf
//
//  Created by Данила on 25.04.2025.
//

import SwiftUI

struct CustomFont: ViewModifier {
	var font: FontType
	var size: CGFloat
	func body(content: Content) -> some View {
		content
			.font(.custom(font.rawValue, size: size))
	}
}
