//
//  SecondViewController.swift
//  uikitBasics
//
//  Created by Данила on 17.04.2025.
//

import UIKit

class SecondViewController: UIViewController {

	var userItem: UserItem
	
	init(userItem: UserItem) {
		self.userItem = userItem
		super.init(nibName: nil, bundle: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
