//
//  OnboardingViewData.swift
//  bookshelf
//
//  Created by Данила on 27.04.2025.
//

import Foundation

struct OnboardingViewData: Identifiable {
	var id: UUID = UUID()
	var image: String
	var description: String
	
	static var mockData: [OnboardingViewData] {
		[
			OnboardingViewData(image: "bratSummer", description: "Bad tattoos on leather-tanned skin"),
			OnboardingViewData(image: "danila", description: "Jesus Christ on a plastic sign"),
			OnboardingViewData(image: "nissanSunny", description: "Fall in love again and again Winding roads, doing manual drive"),
		]
	}
}
