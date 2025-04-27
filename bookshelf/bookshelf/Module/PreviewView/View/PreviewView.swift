//
//  PreviewView.swift
//  bookshelf
//
//  Created by Данила on 24.04.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
	
	lazy var lottieView: LottieAnimationView = {
		$0.frame.size = CGSize(width: view.frame.width - 80, height: view.frame.width - 80)
		$0.center = view.center
		$0.loopMode = .loop
		return $0
	}(LottieAnimationView(name: "bookAnimation"))
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .bgMain // выставили цвет вью
		view.addSubview(lottieView) // добавили анимацию
		lottieView.play(fromFrame: 0, toFrame: 20, loopMode: .repeat(3)) { _ in
			NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: WindowCase.reg])
		}
		
//		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//
//		}
		
	}
	
}
