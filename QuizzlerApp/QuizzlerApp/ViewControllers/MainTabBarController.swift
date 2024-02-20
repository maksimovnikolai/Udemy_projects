//
//  MainTabBarController.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 20.02.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Private Properties
    private lazy var vc1 = UINavigationController(rootViewController: setupQuizViewController())
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

// MARK: - Private Methods
extension MainTabBarController {
    
    private func setupTabBar() {
        tabBar.tintColor = .yellow
        setViewControllers([vc1], animated: true)
    }
    
    private func setupQuizViewController() -> UIViewController {
        let quizVC = QuizViewController()
        quizVC.tabBarItem.image = UIImage(systemName: "house")
        quizVC.title = "Quiz"
        return quizVC
    }
}
