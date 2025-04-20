//
//  SceneDelegate.swift
//  uikitBasics
//
//  Created by Данила on 17.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		// 1 scene
		guard let scene = (scene as? UIWindowScene) else { return }
		
		// 2 init window
		self.window = UIWindow(windowScene: scene)
		// 3 root controller = главный контроллер
		self.window?.rootViewController = ViewController()
		self.window?.makeKeyAndVisible()
		
	}
	
}

