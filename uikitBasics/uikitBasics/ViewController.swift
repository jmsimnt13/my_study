//
//  ViewController.swift
//  uikitBasics
//
//  Created by Данила on 17.04.2025.
//

import UIKit

// UIViewController
// Жизненный цикл UIViewController
// удаление сториборд
// создание элемнтов кодом
// UILabel
// UIButton
// UIImage
// фреймы
// констрейнты
// таблицы
// навигация

class ViewController: UIViewController {

	let pageTitle = UILabel()
	let imageView = UIImageView()
	let imageView1 = UIImageView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .appGreen
		print("viewDidLoad")

		// Настраиваем наш элемент UILabel()
		pageTitle.text = "Main Page"
		pageTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		pageTitle.textColor = .black
		pageTitle.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 50)
		
		// Настраиваем картинку 1
		imageView.image = .img
		imageView.frame = CGRect(x: 30, y: 160, width: view.frame.width - 60, height: 200)
		imageView.contentMode = .scaleAspectFit
		
		// Настраиваем картинку 2
		imageView1.image = .img1
		imageView1.frame = CGRect(x: 30, y: 420, width: view.frame.width - 60, height: 200)
		imageView1.contentMode = .scaleAspectFill
		imageView1.clipsToBounds = true
		
		// После создания эти элементы нужно добавить на view
		view.addSubview(pageTitle)
		view.addSubview(imageView)
		view.addSubview(imageView1)
		
	}

}

