//
//  DiceView.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 08.02.2024.
//

import UIKit

final class DiceView: UIView {
    
    // MARK: Private Properties
    private lazy var leftDiceImageView: UIImageView = .makeImageView(withDiceImage: .five)
    private lazy var rightDiceImageView: UIImageView = .makeImageView(withDiceImage: .one)
    
    private let stackView = UIStackView()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupStackView()
        setupStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public method
    func update(leftDiceTitle: String, rightDiceTitle: String) {
        leftDiceImageView.image = UIImage(named: leftDiceTitle)
        rightDiceImageView.image = UIImage(named: rightDiceTitle)
    }
}

// MARK: Private Methods
extension DiceView {
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.distribution = .fillEqually
        [leftDiceImageView, rightDiceImageView].forEach {
            stackView.addArrangedSubview($0)
        }
    }
}

// MARK: Constraints
extension DiceView {
    
    private func setupStackViewConstraints() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
