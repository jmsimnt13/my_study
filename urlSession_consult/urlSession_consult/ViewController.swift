//
//  ViewController.swift
//  urlSession_consult
//
//  Created by Данила on 11.06.2025.
//

import UIKit

class ViewController: UIViewController {
	private let networkManager = NetworkManager()
	
	private lazy var imageUIImage: UIImageView = {
		$0.frame.size = CGSize(width: 200, height: 200)
		$0.center = view.center
		$0.contentMode = .scaleAspectFill
		$0.clipsToBounds = true
		return $0
	}(UIImageView())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(imageUIImage)
		networkManager.sendRequest(query: "car"){ [weak self] urlString in
			guard let self = self else {return}
			guard let urlString = URL(string: urlString) else {return}
			imageUIImage.load(url: urlString)
		}
	}
}

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global(qos: .utility).async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
