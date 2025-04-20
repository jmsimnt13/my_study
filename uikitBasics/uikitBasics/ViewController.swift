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

// 1 Если один элемент на странице - то closure
// 2 два и более на одной странице пишем функцию для создания
// 3 если элемент есть на разных страницах - кастом
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

class ViewController: UIViewController {

	lazy var pageTitle: UILabel = createLabel(text: "Main Page")
	lazy var topImage = createImageView(image: .img)
	lazy var pageTitle1: UILabel = createLabel(text: "Brat")
	lazy var bottomImage = createImageView(image: .img1)
	
	lazy var btn: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle("Bump It Up", for: .normal)
		$0.setTitleColor(.black, for: .normal)
		$0.backgroundColor = .white
		$0.layer.cornerRadius = 10
		return $0
	}(UIButton(primaryAction: btnAction))
	
	lazy var btnAction: UIAction = UIAction { _ in
		print("Hello")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .appGreen
		print("viewDidLoad")
		
		view.addSubview(topImage)
		view.addSubview(pageTitle)
		view.addSubview(bottomImage)
		view.addSubview(btn)
		
		NSLayoutConstraint.activate([
			topImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
			topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
		])
	}
	
	
	// 2
	func createLabel(text: String) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = text
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.textColor = .black
		return label
	}
	
	func createImageView(image: UIImage) -> UIImageView {
		{
			$0.image = image
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.contentMode = .scaleAspectFit
			$0.clipsToBounds = true
			return $0
		}(UIImageView())
	}

}

