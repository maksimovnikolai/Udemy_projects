//
//  SceneDelegate.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 18.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationVC = UINavigationController(rootViewController: QuizViewController())
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }
}

