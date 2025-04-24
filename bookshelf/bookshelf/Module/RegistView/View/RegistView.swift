//
//  RegistView.swift
//  bookshelf
//
//  Created by Данила on 24.04.2025.
//

import UIKit
import SwiftUI

protocol RegistViewProtocol: BaseViewProtocol {
	
}

class RegistView: UIViewController, RegistViewProtocol {
	typealias PresenterType = RegistViewPresenterProtocol
	var presenter: PresenterType?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let contentView = RegistViewContent()
		
		let content = UIHostingController(rootView: contentView)
		addChild(content)
		content.view.frame = view.frame
		view.addSubview(content.view)
		content.didMove(toParent: self)
    }

}
