//
//  QuizzlerView.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 19.02.2024.
//

import UIKit

final class QuizzlerView: UIView {
    
    //MARK: Properties
    public lazy var backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Background-Bubbles")
        return imageView
    }()
    
    public lazy var stackView = makeStackView()
    
    public lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score label"
        label.textColor = .white
        label.setContentCompressionResistancePriority(.init(251), for: .horizontal)
        label.setContentCompressionResistancePriority(.init(251), for: .vertical)
        return label
    }()
    
    public lazy var questionLabel: UILabel = {
       let label = UILabel()
        label.text = "Question Label"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .natural
        label.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        return label
    }()
    
    public lazy var choice1Button = makeButton(withTitle: "Choice 1")
    public lazy var choice2Button = makeButton(withTitle: "Choice 2")
    public lazy var choice3Button = makeButton(withTitle: "Choice 3")
    
    public lazy var progressView = makeProgressView()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods
extension QuizzlerView {
    
    private func commonInit() {
        backgroundColor = UIColor(red: 37/255, green: 44/255, blue: 74/255, alpha: 1)
        setupBackgroundImageViewConstraints()
        setupStackViewConstraints()
    }
}

//MARK: - Constraints
extension QuizzlerView {
    
    private func setupBackgroundImageViewConstraints() {
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupStackViewConstraints() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: - Methods for creating UI
extension QuizzlerView {
    
    private func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 25)
        button.configuration?.title = title
        button.configuration?.baseForegroundColor = .white
        button.configuration?.background.image = #imageLiteral(resourceName: "Rectangle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        [
            scoreLabel,
            questionLabel,
            choice1Button,
            choice2Button,
            choice3Button,
            progressView,
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }
    
    private func makeProgressView() -> UIProgressView {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.progress = 0.5
        pv.tintColor = .purple
        pv.trackTintColor = .white
        pv.backgroundColor = .white
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return pv
    }
}
