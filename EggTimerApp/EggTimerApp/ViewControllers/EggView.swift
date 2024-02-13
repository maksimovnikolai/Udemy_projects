//
//  EggView.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 13.02.2024.
//

import UIKit

final class EggView: UIView {
    
    //MARK: - Private Properties
    private let imageView: UIView
    private let buttonView: UIView
    
    //MARK: - Init
    init(imageView: UIView, button: UIView) {
        self.imageView = imageView
        self.buttonView = button
        super.init(frame: .zero)
        setupImageConstraints()
        setupButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension EggView {
   
    private func setupImageConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupButtonConstraints() {
        addSubview(buttonView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
