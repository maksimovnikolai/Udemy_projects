//
//  CalculateView.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class CalculateView: UIView {
    
    // MARK: Properties
    lazy var heightValueLabel = makeLabel(
        withTitle: String(format: "%.2f", heightSlider.value) + "m",
        font: .systemFont(ofSize: 17)
    )
    
    lazy var weightValueLabel = makeLabel(
       withTitle: String(format: "%.0f", weightSlider.value) + "Kg",
       font: .systemFont(ofSize: 17, weight: .light)
   )
    
    lazy var heightSlider = makeSlider(minValue: 0, maxValue: 3)
    lazy var weightSlider = makeSlider(minValue: 0, maxValue: 200)
 
    lazy var button = makeButton(withTitle: "CALCULATE")
    
    
    // MARK: Private Properties
    private lazy var backgroundImage = makeImageView()
    
    
    private lazy var mainVStack = makeMainVStack()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        label.setContentCompressionResistancePriority(.init(1000), for: .horizontal)
        return label
    }()
    
    private lazy var heightLabel = makeLabel(
        withTitle: "Height",
        font: .systemFont(ofSize: 17)
    )
    
    private lazy var weightLabel = makeLabel(
        withTitle: "Weight" ,
        font: .systemFont(ofSize: 17, weight: .light)
    )
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension CalculateView {
    
    private func commonInit() {
        setupImageConstraints()
        setupMainVStack()
        setupMainStackConstraints()
    }
    
    private func setupMainVStack() {
        let heightHStack = makeHStack(heightLabel, heightValueLabel)
        let weightHStack = makeHStack(weightLabel, weightValueLabel)
        
        [
            titleLabel,
            heightHStack,
            heightSlider,
            weightHStack,
            weightSlider,
            button,
        ].forEach { mainVStack.addArrangedSubview($0) }
    }
}

// MARK: Make UI
extension CalculateView {
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "calculate_background")
        return imageView
    }
    
    private func makeLabel(withTitle title: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.textAlignment = .natural
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        label.textColor = .black
        return label
    }
    
    private func makeSlider(minValue: Float, maxValue: Float ) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        slider.value = (minValue + maxValue) / 2
        slider.thumbTintColor = .init(named: "sliderColor")
        slider.minimumTrackTintColor = .init(named: "sliderColor")
        slider.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return slider
    }
    
    private func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = title
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 20)
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .init(named: "buttonColor")
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
    
    private func makeMainVStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }
    
    private func makeHStack(_ arrangedView: UIView...) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        arrangedView.forEach { stackView.addArrangedSubview($0) }
        stackView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        return stackView
    }
}

// MARK: - Constraints
extension CalculateView {
    
    private func setupImageConstraints() {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupMainStackConstraints() {
        addSubview(mainVStack)
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
