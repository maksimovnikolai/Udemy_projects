//
//  QuizView.swift
//  QuizApp
//
//  Created by Nikolai Maksimov on 19.02.2024.
//

import UIKit

final class QuizView: UIView {
    
    //MARK: Properties
    private lazy var scoreTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: "
        label.textColor = .white
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        return label
    }()
    public lazy var mainVStackView = makeVStackView()
    
    public lazy var scoreValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Score label"
        label.textColor = .white
        return label
    }()
    
    public lazy var questionLabel: UILabel = {
       let label = UILabel()
        label.text = "Question Label"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .natural
        label.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .vertical)
        return label
    }()
    
    public lazy var choice1Button = makeButton(withTitle: "Choice 1")
    public lazy var choice2Button = makeButton(withTitle: "Choice 2")
    public lazy var choice3Button = makeButton(withTitle: "Choice 3")
    
    public lazy var progressView = makeProgressView()

    public var answerButtons = [UIButton]()
    
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
extension QuizView {
    
    private func commonInit() {
        backgroundColor = UIColor(red: 37/255, green: 44/255, blue: 74/255, alpha: 1)
        setupStackViewConstraints()
        answerButtons = [choice1Button, choice2Button, choice3Button]
    }
}

//MARK: - Constraints
extension QuizView {

    private func setupStackViewConstraints() {
        addSubview(mainVStackView)
        mainVStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainVStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainVStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainVStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            mainVStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}

//MARK: - Methods for creating UI
extension QuizView {
    
    private func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 25)
        button.configuration?.title = title
        button.configuration?.baseForegroundColor = .white
        button.configuration?.background.image = #imageLiteral(resourceName: "Rectangle")
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }
    
    private func configureLabelsStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        [scoreTitleLabel, scoreValueLabel].forEach {
            stack.addArrangedSubview($0)
        }
        
        return stack
    }
    
    private func makeVStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        [
            configureLabelsStackView(),
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
        pv.tintColor = .systemPink
        pv.trackTintColor = .white
        pv.backgroundColor = .white
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return pv
    }
}
