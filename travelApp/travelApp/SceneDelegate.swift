//
//  SceneDelegate.swift
//  travelApp
//
//  Created by Данила on 12.05.2025.
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
		self.window?.rootViewController = UINavigationController(rootViewController: FirstVC())
		
		//
		self.window?.makeKeyAndVisible()
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}


}

