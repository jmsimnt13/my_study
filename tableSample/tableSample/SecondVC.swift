//
//  SecondVC.swift
//  tableSample
//
//  Created by Данила on 30.04.2025.
//

import UIKit

class SecondVC: UIViewController {

	lazy var backAction: UIAction = UIAction { [weak self] _ in
		// чтобы вернуться назад нужно сделать вот так
		self?.navigationController?.popViewController(animated: true)
		
		// Так не делаем, поскольку создается новый ViewController...
		//		let mainVC = ViewController()
		//		self?.navigationController?.pushViewController(mainVC, animated: true)
		
	}
	
	var colorItem: ColorItem
	
	init(colorItem: ColorItem) {
		self.colorItem = colorItem
		super.init(nibName: nil, bundle: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = colorItem.nameOfColor
		let scColor = colorItem.typeOfColor.color
		view.backgroundColor = scColor
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
