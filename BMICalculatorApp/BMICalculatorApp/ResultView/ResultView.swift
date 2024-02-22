//
//  ResultView.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class ResultView: UIView {
    
    // MARK: Public Properties
    lazy var bmiValueLabel = makeLabel(
        withTitle: "12",
        font: .boldSystemFont(ofSize: 80),
        hugPrior: 251,
        comprPrior: 1000
    )
    
    lazy var adviceLabel = makeLabel(
        withTitle: "EAT SOME MORE SNACKS!",
        font: .systemFont(ofSize: 20, weight: .light),
        hugPrior: 251
    )
    
    lazy var button = makeButton(withTitle: "RECALCULATE")
    
    // MARK: Private Properties
    private lazy var backgroundImage = makeImageView()
    private lazy var vStack = makeMainVStack()
    private lazy var resultTitle = makeLabel(
        withTitle: "YOUR RESULT",
        font: .boldSystemFont(ofSize: 35),
        hugPrior: 251,
        comprPrior: 1000
    )
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Properties
extension ResultView {
    
    private func commonInit() {
        setupBackgroundImageConstraints()
        setupVStack()
        setupStackViewConstraints()
        setupButtonConstraints()
    }
    
    private func setupVStack() {
        [resultTitle, bmiValueLabel, adviceLabel].forEach {
            vStack.addArrangedSubview($0)
        }
    }
}

// MARK: - Constraints
extension ResultView {
    
    private func setupBackgroundImageConstraints() {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupStackViewConstraints() {
        addSubview(vStack)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupButtonConstraints() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// MARK: - UI Elements
extension ResultView {
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "result_background")
        return imageView
    }
    
    private func makeLabel(withTitle title: String, font: UIFont, hugPrior: Float, comprPrior: Float? = nil ) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = .white
        label.textAlignment = .center
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        label.setContentCompressionResistancePriority(.init(comprPrior ?? 750), for: .horizontal)
        return label
    }
    
    private func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = title
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 20)
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .init(named: "buttonColor")
        return button
    }
    
    private func makeMainVStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
}
