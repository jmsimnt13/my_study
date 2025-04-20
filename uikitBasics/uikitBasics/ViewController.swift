//
//  ViewController.swift
//  uikitBasics
//
//  Created by Данила on 17.04.2025.
//

import UIKit

// +UIViewController
// +Жизненный цикл UIViewController
// +удаление сториборд

// +создание элемнтов кодом
// +UILabel
// +UIButton
// +UIImage
// +фреймы

// констрейнты (умеют рассчитывать динамически, более умные чем frames)
// таблицы
// навигация

class ViewController: UIViewController {

	// 1 Если один элемент на странице - то closure
	// 2 два и более на одной странице пишем функцию для создания
	// 3 если элемент есть на разных страницах - кастом
	lazy var pageTitle: UILabel = createLabel(text: "Main Page", frame: CGRect(x: 30, y: 60, width: view.frame.width - 60, height: 50))
	
	// 1
//	lazy var pageTitle: UILabel = {
//		// Настраиваем наш элемент UILabel()
//		$0.text = "Main Page"
//		$0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//		$0.textColor = .black
//		$0.frame = CGRect(x: 30, y: 60, width: view.frame.width - 60, height: 50)
//		// Возвращаем его
//		return $0
//	}(UILabel())
	
	lazy var imageView: UIImageView = {
		// Настраиваем картинку 1
		$0.image = .img
		$0.frame = CGRect(x: 30, y: pageTitle.frame.maxY + 10, width: view.frame.width - 60, height: 150)
		$0.contentMode = .scaleAspectFill
		$0.clipsToBounds = true
		
		return $0
	}(UIImageView())
	
	lazy var pageTitle1: UILabel = createLabel(text: "Brat", frame: CGRect(x: 30, y: imageView.frame.maxY + 10, width: view.frame.width - 60, height: 50))
	
	lazy var imageView1: UIImageView = {
		// Настраиваем картинку 2
		$0.image = .img1
		$0.frame = CGRect(x: 30, y: pageTitle1.frame.maxY + 10, width: view.frame.width - 60, height: 150)
		$0.contentMode = .scaleAspectFill
		$0.clipsToBounds = true
		
		return $0
	}(UIImageView())
	
	lazy var btn: UIButton = {
		$0.setTitle("Bump It Up", for: .normal)
		$0.setTitleColor(.black, for: .normal)
		$0.backgroundColor = .white
		$0.layer.cornerRadius = 10
		$0.frame.size = CGSize(width: view.frame.width - 60, height: 50)
		$0.frame.origin = CGPoint(x: 30, y: imageView1.frame.maxY + 30)
		
		return $0
	}(UIButton(primaryAction: btnAction))
	
	lazy var btnAction: UIAction = UIAction { _ in
		print("Hello")
	}
	
	lazy var circle: UIView = {
		$0.backgroundColor = .white
		$0.frame.size = CGSize(width: 300, height: 100)
		$0.center.x = view.center.x
		$0.frame.origin.y = btn.frame.maxY + 30
		$0.layer.cornerRadius = 50
		return $0
	}(UIView())
	
	lazy var viewLabel = createLabel(text: "v label", frame: CGRect(x: 30, y: 30, width: circle.frame.width - 20, height: 30))
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .appGreen
		print("viewDidLoad")

		// После создания эти элементы нужно добавить на view
		view.addSubview(pageTitle)
		view.addSubview(imageView)
		view.addSubview(pageTitle1)
		view.addSubview(imageView1)
		view.addSubview(btn)
		view.addSubview(circle)
		circle.addSubview(viewLabel)
		
	}
	
	
	// 2
	func createLabel(text: String, frame: CGRect) -> UILabel {
		let label = UILabel()
		label.text = text
		label.frame = frame
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.textColor = .black
		return label
	}

}

