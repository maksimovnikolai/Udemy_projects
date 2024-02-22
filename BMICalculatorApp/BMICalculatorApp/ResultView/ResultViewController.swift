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
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
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
        resultView.resultTitle.text = advice
        resultView.resultValue.text = bmiValue
        resultView.backgroundColor = color
    }
    
    @objc
    private func buttonWasPressed() {
        dismiss(animated: true)
    }
}
