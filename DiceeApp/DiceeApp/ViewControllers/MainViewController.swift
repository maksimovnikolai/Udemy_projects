//
//  MainViewController.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 07.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Private properties
    private lazy var backgroundImageView: UIImageView = .makeImageView(withImage: .background)
    private let diceLogoView = DiceLogoView()
    private let diceView = DiceView()
    private let rollButtonView = RollButtonView()
    private let stackView = UIStackView()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        updateUI()
    }
}

// MARK: - Private Methods
extension MainViewController {
    
    private func commonInit() {
        setupBackgroundImageConstraints()
        setupStackView()
        setupStackViewConstraints()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        [diceLogoView, diceView, rollButtonView].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func updateUI() {
        rollButtonView.completion = { [weak self] in
            self?.diceView.update(leftDiceTitle: DiceNumber.allCases.randomElement()?.rawValue ?? "",
                                  rightDiceTitle: DiceNumber.allCases.randomElement()?.rawValue ?? "")
        }
    }
}

// MARK: - Constraints
extension MainViewController {
    
    private func setupBackgroundImageConstraints() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupStackViewConstraints() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
