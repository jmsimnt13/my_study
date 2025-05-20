////
////  ThirdVC.swift
////  travelApp
////
////  Created by Данила on 19.05.2025.
////
//
//import UIKit
//
//class ThirdVC: UIViewController {
//	var placeToShow: PlaceData?
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		view.backgroundColor = .appPurple
//		//
//		setupUI()
//		setupConstraints()
//	}
//	
//	private func setupUI() {
//		guard let place = placeToShow else { return }
//		//
//		 let navigationBar: UIView = {
//			$0.backgroundColor = .clear
//			return $0
//		}(UIView())
//		
//		// Изображение меню
//		let menuImageView: UIImageView = {
//			$0.image = UIImage(named: "appMenu")
//			$0.frame.size.height = 33
//			$0.frame.size.width = 33
//			$0.contentMode = .scaleAspectFit
//			$0.clipsToBounds = true
//			return $0
//		}(UIImageView())
//		
//		//
//	 let contentContainer: UIView = {
//			$0.backgroundColor = .white
//			$0.layer.cornerRadius = 20
//			$0.clipsToBounds = true
//			return $0
//		}(UIView())
//		
//	let imageView: UIImageView = {
//			$0.backgroundColor = .appPurple
//			$0.contentMode = .scaleAspectFill
//			$0.clipsToBounds = true
//			return $0
//		}(UIImageView())
//	let locationLabel: UILabel = {
//			// не понимаю как обеспечить видимость этого массива из SecondVC
//		$0.text = place.title
//		$0.font = UIFont.boldSystemFont(ofSize: 32)
//			
//			return $0
//		}(UILabel())
//		
//		view.addSubview(navigationBar)
//		navigationBar.addSubview(menuImageView)
//		
//		view.addSubview(contentContainer)
//		contentContainer.addSubview(imageView)
//		
//		
//		navigationBar.translatesAutoresizingMaskIntoConstraints = false
//		contentContainer.translatesAutoresizingMaskIntoConstraints = false
//		
//	}
//	
//	private func setupConstraints() {
//		NSLayoutConstraint.activate([
//			//
//			navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//			navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//			navigationBar.heightAnchor.constraint(equalToConstant: 50),
//			
//			menuImageView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
//			menuImageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
//			
//			//
//			
//		])
//	}
//}
