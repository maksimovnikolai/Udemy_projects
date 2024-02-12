//
//  SoundViewController.swift
//  XylophoneApp
//
//  Created by Nikolai Maksimov on 12.02.2024.
//

import UIKit
import AVFoundation

final class SoundViewController: UIViewController {
    
    // MARK: Private Properties
    private var player: AVAudioPlayer!
    private lazy var mainStackView = makeStackView()
    private var constant: CGFloat = 10
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Logic
extension SoundViewController {
    
    private func commonInit() {
        setupStackViewConstraints()
        setupUI()
    }
    
    private func setupUI() {
        title = "Xylophone"
        view.backgroundColor = .systemBackground
        
        (0...Title.allCases.count - 1).forEach { i in
            let buttonView = UIView()
            let button = makeButton(
                withTitle: Title.allCases[i].rawValue,
                color: Title.allCases[i].color)
            setup(button: button, toView: buttonView, spacing: constant)
            constant += 5
            mainStackView.addArrangedSubview(buttonView)
        }
    }
    
    @objc
    private func buttonWasTapped(_ button: UIButton) {
        playSound(button.configuration?.title ?? "")
    }
    
    func playSound(_ soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - UI Elements
extension SoundViewController {
    
    private func makeButton(withTitle title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.title = title
        button.configuration?.attributedTitle?.font = .boldSystemFont(ofSize: 30)
        button.configuration?.baseBackgroundColor = color
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        return button
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}

// MARK: - Constraints
extension SoundViewController {
    
    private func setup(button: UIView, toView view: UIView, spacing: CGFloat) {
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing).isActive = true
    }
    
    private func setupStackViewConstraints() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
