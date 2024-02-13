//
//  EggViewController.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 12.02.2024.
//

import UIKit

final class EggViewController: UIViewController {
    
    // MARK: Private Properties
    private lazy var mainStackView: UIStackView = .makeStackView(
        axis: .vertical,
        distribution: .fillEqually,
        spacing: 20
    )
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupMainStackViewConstraints()
        configureMainStacks()
    }
}

//MARK: - Configure UI
extension EggViewController {
    
    private func configureMainStacks() {
        [makeLabel(), configureEggStackView(), makeProgressView()].forEach {
            mainStackView.addArrangedSubview($0)
        }
    }
    
    private func makeLabel() -> UIView  {
        let label = UILabel()
        label.text = "How do you like yours eggs?"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        return label
    }
    
    private func configureEggStackView() -> UIStackView {
        let stack: UIStackView = .makeStackView(axis: .horizontal,
                                                distribution: .fillEqually,
                                                spacing: 20)
        
        let softEggView = configureEggView(title: .soft)
        let mediumEggView = configureEggView(title: .medium)
        let hardEggView = configureEggView(title: .hard)
        [softEggView, mediumEggView, hardEggView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }
    
    private func configureEggView(title: EggInfo) -> UIView {
        let image = UIImageView.makeImageView(title: title)
        let button = UIButton.makeButton(withTitle: title)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        let view = EggView(imageView: image, button: button)
        return view
    }
    
    @objc
    private func buttonDidTap(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
    }
    
    private func makeProgressView() -> UIView {
        let customView = UIView()
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.5
        progressView.progressTintColor = .systemYellow
        customView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10).isActive = true
        return customView
    }
}

//MARK: - Constraints
extension EggViewController {
    
    private func setupMainStackViewConstraints() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
