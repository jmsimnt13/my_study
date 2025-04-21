//
//  SecondViewController.swift
//  uikitBasics
//
//  Created by Данила on 17.04.2025.
//

import UIKit

class SecondViewController: UIViewController {
	
	private lazy var addBtn: UIButton = {
		$0.frame.size = CGSize(width: 70, height: 70)
		$0.layer.cornerRadius = 30
		$0.backgroundColor = .white
		$0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
		$0.tintColor = .appGreen
		$0.frame.origin = CGPoint(x: 30, y: view.frame.height - 100)
		return $0
	}(UIButton(primaryAction: backAction))

	lazy var backAction: UIAction = UIAction { [weak self] _ in
		// чтобы вернуться назад нужно сделать вот так
		self?.navigationController?.popViewController(animated: true)
		
		// Так не делаем, поскольку создается новый ViewController...
//		let mainVC = ViewController()
//		self?.navigationController?.pushViewController(mainVC, animated: true)
		
	}
	
	var userItem: UserItem
	
	init(userItem: UserItem) {
		self.userItem = userItem
		super.init(nibName: nil, bundle: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .appGreen
		title = userItem.name
		
		view.addSubview(addBtn)
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
