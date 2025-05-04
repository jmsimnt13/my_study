//
//  ViewController.swift
//  viewVsLayer
//
//  Created by Данила on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {

	let view1: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .orange
		
		return $0
	}(UIView())
	
	let layer1: CALayer = {
		$0.backgroundColor = UIColor.green.cgColor
		$0.cornerRadius = 10
		$0.borderColor = UIColor.black.cgColor
		$0.borderWidth = 5
		$0.shadowRadius = 5
		$0.contents = UIImage(named: "cute")?.cgImage
		$0.contentsGravity = .resizeAspect
		return $0
	}(CALayer())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		print("ViewDidLoad")
		// Do any additional setup after loading the view.
		
		setupView()
		setupLayer()
		setupViewActions()
		setupLayerAnimation()
	}
	
	// MARK: - View
	func setupView() {
		// view setup
		view.addSubview(view1)
		NSLayoutConstraint.activate([
			view1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			view1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			view1.heightAnchor.constraint(equalToConstant: 200),
		])
	}
	
	// MARK: - Layer
	func setupLayer() {
		// layer setup
		view.layer.addSublayer(layer1)
		layer1.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
	}
	
	// MARK: - View Actions
	func setupViewActions() {
		let gr = UITapGestureRecognizer(target: self, action: #selector(view1Tapped(tapGestureRecognizer:)))
		view1.addGestureRecognizer(gr)
	}
	
	// MARK: - Layer Animation
	func setupLayerAnimation() {
		let circlePath = UIBezierPath(arcCenter: view.center, radius: 20, startAngle: 0, endAngle: .pi*2, clockwise: true)
		
		let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
		animation.path = circlePath.cgPath
		animation.duration = 1
		animation.repeatCount = .infinity
		
		layer1.add(animation, forKey: nil)
	}
	@objc func view1Tapped(tapGestureRecognizer: UITapGestureRecognizer)
	{
		print("view tapped")
	}
}

