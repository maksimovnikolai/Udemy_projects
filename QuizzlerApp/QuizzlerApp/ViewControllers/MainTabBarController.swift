//
//  MainTabBarController.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 20.02.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: Private Properties
    private lazy var vc1 = UINavigationController(rootViewController: setupQuizViewController())
    private lazy var vc2 = UINavigationController(rootViewController: setupSettingsViewController())
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private Methods
extension MainTabBarController {
    
    private func commonInit() {
        setupTabBar()
        setupBackgroundImageViewConstraints()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .yellow
        tabBar.unselectedItemTintColor = .gray
        setViewControllers([vc1, vc2], animated: true)
    }
    
    private func setupQuizViewController() -> UIViewController {
        let quizVC = QuizViewController()
        quizVC.tabBarItem.image = UIImage(systemName: "house")
        quizVC.title = "Quiz"
        return quizVC
    }
    
    private func setupSettingsViewController() -> UIViewController {
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        settingsVC.title = "Settings"
        return settingsVC
    }
}

// MARK: - Tab Bar Image
extension MainTabBarController {
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
         imageView.image = #imageLiteral(resourceName: "Background-Bubbles")
         return imageView
    }
    
    private func setupBackgroundImageViewConstraints() {
        let imageView = makeImageView()
        tabBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
