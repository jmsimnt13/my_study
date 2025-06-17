//
//  ViewController.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
//

import UIKit

final class ViewController: UIViewController {
	let networkManagerToSecondVC = NetworkManager()
	// UI элементы
	// Главное изображение
	private let imageView: UIImageView = {
		$0.image = UIImage(named: "appMainVC")
		$0.contentMode = .scaleAspectFill
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 37
		$0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
		return $0
	}(UIImageView())
	
	// Заголовок
	private let titleLabel: UILabel = {
		let label = UILabel()
		$0.text = """
  Winter
  Vacation Trips
  """
		$0.textAlignment = .left
		$0.numberOfLines = 2
		$0.font = MyAppFont.makeMerriweather(size: 36, weight: .Bold)
//		$0.font = UIFont.boldSystemFont(ofSize: 36)
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// Описание
	private let descriptionLabel: UILabel = {
		$0.text = """
Enjoy your winter vacations with warmth 
and amazing sightseeing on the mountains. 
Enjoy the best expirience with us!
"""
		$0.textAlignment = .left
		$0.numberOfLines = 3
		$0.font = MyAppFont.makeSourceSansPro(size: 16, weight: .Regular)
//		$0.font = UIFont.systemFont(ofSize: 16) // Как заставить работать с моими шрифтами хз
		$0.textColor = .black
		return $0
	}(UILabel())
	
	// Кнопка Let's Go
	private let nextBtn: UIButton = {
		$0.setTitle("Let's Go!", for: .normal)
		$0.titleLabel?.font = MyAppFont.makeMerriweather(size: 16, weight: .Regular)
		$0.setImage(UIImage(named: "appRight"), for: .normal)
		$0.tintColor = .white
		$0.semanticContentAttribute = .forceRightToLeft
		$0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
//		$0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
//		$0.sizeToFit()
		$0.backgroundColor = .appViolet
		$0.setTitleColor(.white, for: .normal)
		$0.layer.cornerRadius = 25
//		$0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		return $0
	}(UIButton(type: .system))
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		navigationController?.navigationBar.isHidden = true
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
			imageView.topAnchor.constraint(equalTo: view.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			
			// Ограничения для заголовка
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
			
			// Ограничения для описания
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
//			descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87),
			
			// Ограничения для кнопки перехода
//			nextBtn.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
			nextBtn.widthAnchor.constraint(equalToConstant: Constants.smallScreen ? 150 : 181),
			nextBtn.heightAnchor.constraint(equalToConstant: 50),
			nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
			nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.smallScreen ? -20 : -16)
		])
	}
	
	// Функция для добавления действий с кнопками
	private func setupActions() {
		nextBtn.addTarget(self, action: #selector(nextBtnTupped), for: .touchUpInside)
	}
	
	// Функция для осуществления действия
	@objc private func nextBtnTupped() {
		let secondVC = SecondVC()
		secondVC.networkManager = networkManagerToSecondVC
		secondVC.modalPresentationStyle = .fullScreen
		navigationController?.pushViewController(secondVC, animated: true)
//		UIView.transition(with: self.view.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
//			self.present(secondVC, animated: false, completion: nil)
//		}, completion: nil)
	}
}

