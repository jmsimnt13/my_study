//
//  OnboardingView.swift
//  bookshelf
//
//  Created by Данила on 27.04.2025.
//

import UIKit
import SwiftUI

protocol OnboardingViewProtocol: BaseViewProtocol {
	
}

class OnboardingView: UIViewController, OnboardingViewProtocol {
	
	typealias PresenterType = OnboardingViewPresenterProtocol
	var presenter: PresenterType?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let contentView = OnboardingViewContent(slides: presenter?.mockData ?? []) { [weak self] in
			guard let self = self else { return }
			presenter?.startApp()
			print("next")
		}
		
		let content = UIHostingController(rootView: contentView)
		addChild(content)
		content.view.frame = view.frame
		view.addSubview(content.view)
		content.didMove(toParent: self)
	}
}
