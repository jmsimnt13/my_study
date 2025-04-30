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
	
	var colorItem: colorItem
	
	init(colorItem: colorItem) {
		self.colorItem = colorItem
		super.init(nibName: nil, bundle: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = colorItem.nameOfColor
		switch colorItem.typeOfColor {
		case .Green:
			view.backgroundColor = .appGreen
		case .ProductRed:
			view.backgroundColor = .appRed
		case .Yellow:
			view.backgroundColor = .appYellow
		case .Purple:
			view.backgroundColor = .appPurple
		case .DeepPurple:
			view.backgroundColor = .appDeepPurple
		case .Violet:
			view.backgroundColor = .appViolet
		case .Gray:
			view.backgroundColor = .gray
		case .SpaceGray:
			view.backgroundColor = .appSpaceGray
		case .RoseGold:
			view.backgroundColor = .appRoseGold
		case .Gold:
			view.backgroundColor = .appGold
		case .Brat:
			view.backgroundColor = .appBrat
		case .Lime:
			view.backgroundColor = .appLime
		case .Cyan:
			view.backgroundColor = .cyan
		case .Magenta:
			view.backgroundColor = .magenta
		case .Brown:
			view.backgroundColor = .brown
		case .Orange:
			view.backgroundColor = .orange
		case .Blue:
			view.backgroundColor = .blue
		case .Red:
			view.backgroundColor = .red
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
