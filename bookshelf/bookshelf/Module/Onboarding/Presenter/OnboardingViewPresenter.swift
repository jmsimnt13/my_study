//
//  OnboardingViewPresenter.swift
//  bookshelf
//
//  Created by Данила on 27.04.2025.
//

import Foundation
import UIKit

protocol OnboardingViewPresenterProtocol: AnyObject {
	var mockData: [OnboardingViewData] { get }
	func startApp()
}

class OnboardingViewPresenter: OnboardingViewPresenterProtocol {
	
	var mockData: [OnboardingViewData] = OnboardingViewData.mockData
	
	weak var view: (any OnboardingViewProtocol)?
	
	init(view: any OnboardingViewProtocol) {
		self.view = view
	}
	
	func startApp() {
		// save state
		//NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: WindowCase.main])
		let img: UIImage = .bratSummer
		if let imgData = img.jpegData(compressionQuality: 1) {
			DataBaseManager.shared.createBook(name: "Мартин Иден", author: "Джек Лондон", description: "Некоторый текст, описывающий книгу", cover: imgData)
		}
	}
}
