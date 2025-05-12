//
//  FontManager.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import Foundation

//["Merriweather-Regular", "Merriweather-Light", "Merriweather-Medium", "Merriweather-SemiBold", "Merriweather-Bold", "Merriweather-ExtraBold", "Merriweather-Black"]
//["SourceSans3-Roman_Regular", "SourceSans3-Roman", , "SourceSans3-Roman_Medium", "SourceSans3-Roman_SemiBold", "SourceSans3-Roman_Bold", "SourceSans3-Roman_ExtraBold", "SourceSans3-Roman_Black"]

enum MWFontType: String {
	case regular = "Merriweather-Regular"
	case light = "Merriweather-Light"
	case medium = "Merriweather-Medium"
	case semiBold = "Merriweather-SemiBold"
	case bold = "Merriweather-Bold"
	case extraBold = "Merriweather-ExtraBold"
	case black = "Merriweather-Black"
}

enum SSPFontType: String {
	case roman = "SourceSans3-Roman"
	case regular = "SourceSans3-Roman_Regular"
	case light = "SourceSans3-Roman_Light"
	case medium = "SourceSans3-Roman_Medium"
	case semiBold = "SourceSans3-Roman_SemiBold"
	case bold = "SourceSans3-Roman_Bold"
	case extraBold = "SourceSans3-Roman_ExtraBold"
	case black = "SourceSans3-Roman_Black"
}
