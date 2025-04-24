//
//  RegistViewPresenter.swift
//  bookshelf
//
//  Created by Данила on 24.04.2025.
//

import Foundation

protocol RegistViewPresenterProtocol: AnyObject {
	
}

class RegistViewPresenter: RegistViewPresenterProtocol {
	weak var view: (any RegistViewProtocol)?
	
	init(view: any RegistViewProtocol){
		self.view = view
	}
}
