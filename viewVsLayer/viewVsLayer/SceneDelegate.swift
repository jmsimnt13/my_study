//
//  SceneDelegate.swift
//  viewVsLayer
//
//  Created by Данила on 04.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		//1
		guard let scene = (scene as? UIWindowScene) else { return }
		//2
		self.window = UIWindow(windowScene: scene)
		self.window?.rootViewController = ViewController()
		self.window?.makeKeyAndVisible()
	}

}

