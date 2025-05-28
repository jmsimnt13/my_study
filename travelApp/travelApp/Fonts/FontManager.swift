//
//  FontManager.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

//["Merriweather-Regular", "Merriweather-Light", "Merriweather-Medium", "Merriweather-SemiBold", "Merriweather-Bold", "Merriweather-ExtraBold", "Merriweather-Black"]
//["SourceSans3-Roman_Regular", "SourceSans3-Roman", , "SourceSans3-Roman_Medium", "SourceSans3-Roman_SemiBold", "SourceSans3-Roman_Bold", "SourceSans3-Roman_ExtraBold", "SourceSans3-Roman_Black"]

class MyAppFont: UIFont {
	enum MerriweatherFontWeight: String {
		case Regular = "Merriweather-Regular"
		case Medium = "Merriweather-Medium"
		case SemiBold = "Merriweather-SemiBold"
		case Bold = "Merriweather-Bold"
		case Black = "Merriweather-Black"
	}
	
	enum SourceSansProFontWeight: String {
		case Regular = "SourceSans3-Roman_Regular"
		case Medium = "SourceSans3-Roman_Medium"
		case SemiBold = "SourceSans3-Roman_SemiBold"
		case Bold = "SourceSans3-Roman_Bold"
		case Black = "SourceSans3-Roman_Black"
	}
	
	static func makeMerriweather(size: CGFloat, weight: MerriweatherFontWeight) -> UIFont {
		let name = weight.rawValue
		return UIFont(name: name, size: size)! // Может упасть
	}
	
	static func makeSourceSansPro(size: CGFloat, weight: SourceSansProFontWeight) -> UIFont {
		let name = weight.rawValue
		return UIFont(name: name, size: size) ?? .systemFont(ofSize: size, weight: .medium) // Если не найдет шрифт, то будет стандартный
	}
}

//  MARK: - Usage
//subtitleLabel.font = MyAppFont.makeInter(size: 16, weight: .Bold)



