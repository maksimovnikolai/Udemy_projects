//
//  MainViewController.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 07.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Private properties
    private lazy var backgroundImageView = makeImageView(withImage: .background)
    private lazy var diceeLogoImageView = makeImageView(withImage: .logo)
    private lazy var leftDiceImageView = makeImageView(withDiceImage: .five)
    private lazy var rightDiceImageView = makeImageView(withDiceImage: .one)
    private lazy var rollButton = makeButton()
    
    private enum DiceNumber: String, CaseIterable {
        case one = "DiceOne"
        case two = "DiceTwo"
        case three = "DiceThree"
        case four = "DiceFour"
        case five = "DiceFive"
        case six = "DiceSix"
    }
    
    private enum DiceLogo: String {
        case background = "GreenBackground"
        case logo = "DiceeLogo"
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private Methods
extension MainViewController {
    
    private func commonInit() {
        view.backgroundColor = .red
        setupBackgroundImageView()
        setupDiceeLogoConstraints()
        setupLeftDiceImageViewConstraints()
        setupRightDiceImageViewConstraints()
        setupRollButtonConstraints()
    }
    
    private func makeImageView(withDiceImage dice: DiceNumber? = nil, withImage image: DiceLogo? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = dice != nil ? UIImage(named: dice?.rawValue ?? "")
                                      : UIImage(named: image?.rawValue ?? "")
        return imageView
    }
    
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Roll"
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 32)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }
    
    @objc
    private func rollButtonPressed() {
        leftDiceImageView.image = UIImage(named: DiceNumber.allCases.randomElement()?.rawValue ?? "")
        rightDiceImageView.image = UIImage(named: DiceNumber.allCases.randomElement()?.rawValue ?? "")
    }
}

// MARK: - Constraints
extension MainViewController {
    
    private func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupDiceeLogoConstraints() {
        view.addSubview(diceeLogoImageView)
        diceeLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            diceeLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            diceeLogoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            diceeLogoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            diceeLogoImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupLeftDiceImageViewConstraints() {
        view.addSubview(leftDiceImageView)
        leftDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftDiceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            leftDiceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            leftDiceImageView.heightAnchor.constraint(equalToConstant: 125),
            leftDiceImageView.widthAnchor.constraint(equalToConstant: 125),
        ])
    }
    
    private func setupRightDiceImageViewConstraints() {
        view.addSubview(rightDiceImageView)
        rightDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightDiceImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rightDiceImageView.centerYAnchor.constraint(equalTo: leftDiceImageView.centerYAnchor),
            rightDiceImageView.heightAnchor.constraint(equalToConstant: 125),
            rightDiceImageView.widthAnchor.constraint(equalToConstant: 125),
        ])
    }
    
    private func setupRollButtonConstraints() {
        view.addSubview(rollButton)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rollButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            rollButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
        ])
    }
}
