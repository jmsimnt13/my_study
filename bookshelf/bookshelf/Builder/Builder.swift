//
//  Builder.swift
//  bookshelf
//
//  Created by Данила on 24.04.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
	associatedtype PresenterType
	var presenter: PresenterType? { get set }
}

class Builder {
	// view
	// presenter
	
	
	static private func createView<View: UIViewController & BaseViewProtocol>(viewType: View.Type, presenter: (View) -> View.PresenterType) -> UIViewController {
		let view = View()
		let presenter = presenter(view)
		view.presenter = presenter
		return view
	}
	
	static func createRegistView() -> UIViewController {
		return self.createView(viewType: RegistView.self) { view in
			RegistViewPresenter(view: view)
		}
	}
	
	static func createOnboardingView() -> UIViewController {
		return self.createView(viewType: OnboardingView.self) { view in
			OnboardingViewPresenter(view: view)
		}
	}
	
}
