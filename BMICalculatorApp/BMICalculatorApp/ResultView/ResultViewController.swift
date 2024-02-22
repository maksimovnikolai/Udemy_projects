//
//  ResultViewController.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: Properties
    private let resultView = ResultView()
    
    private var bmiValue: String
    private var advice: String
    private var color: UIColor
    
    // MARK: Init
    init(bmiValue: String, advice: String, color: UIColor) {
        self.bmiValue = bmiValue
        self.advice = advice
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    private func commonInit() {
        updateUI()
        resultView.button.addTarget(self, action: #selector(buttonWasPressed), for: .touchUpInside)
    }
    
    private func updateUI() {
        resultView.adviceLabel.text = advice
        resultView.bmiValueLabel.text = bmiValue
        resultView.backgroundColor = color
    }
    
    @objc
    private func buttonWasPressed() {
        dismiss(animated: true)
    }
}
