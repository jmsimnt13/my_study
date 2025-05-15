//
//  ViewController.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

class ViewController: UIViewController {
	// UI элементы
	// Главное изображение
	private let imageView: UIImageView = {
		$0.image = UIImage(named: "mainVC")
		$0.contentMode = .scaleAspectFill
		$0.clipsToBounds = true
		return $0
	}(UIImageView())
	
	// Заголовок
	private let titleLabel: UILabel = {
		let label = UILabel()
		$0.text = "Winter Vacation Trips"
		$0.textAlignment = .center
		$0.font = UIFont.boldSystemFont(ofSize: 24)
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// Описание
	private let descriptionLabel: UILabel = {
		$0.text = """
Enjoy your winter vacations with warmth and amazing sightseeing on the mountains. 
Enjoy the best expirience with us!
"""
		$0.textAlignment = .center
		$0.numberOfLines = 0
		$0.font = UIFont.boldSystemFont(ofSize: 16) // Как заставить работать с моими шрифтами хз
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// Кнопка Let's Go
	private let nextBtn: UIButton = {
		$0.setTitle("Let's Go!", for: .normal)
		$0.backgroundColor = .appViolet
		$0.setTitleColor(.white, for: .normal)
		$0.layer.cornerRadius = 10
		$0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		return $0
	}(UIButton(type: .system))
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupUI()
		setupConstraints()
		setupActions()
	}
	
	// Функция добавления объектов на экран
	private func setupUI() {
		view.backgroundColor = .white
		view.addSubview(imageView)
		view.addSubview(titleLabel)
		view.addSubview(descriptionLabel)
		view.addSubview(nextBtn)
	}
	
	// Функиця установления ограничений
	private func setupConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		nextBtn.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			// Ограничения для картинки
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			
			// Ограничения для заголовка
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
			
			// Ограничения для описания
			descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			// Ограничения для кнопки перехода
			nextBtn.widthAnchor.constraint(equalToConstant: 100),
			nextBtn.heightAnchor.constraint(equalToConstant: 50),
			nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
		])
	}
	
	// Функция для добавления действий с кнопками
	private func setupActions() {
		nextBtn.addTarget(self, action: #selector(nextBtnTupped), for: .touchUpInside)
	}
	
	// Функция для осуществления действия
	@objc private func nextBtnTupped() {
		let secondVC = SecondVC()
		secondVC.modalPresentationStyle = .fullScreen
		UIView.transition(with: self.view.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
			self.present(secondVC, animated: false, completion: nil)
		}, completion: nil)
	}
}

