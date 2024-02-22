//
//  CalculateViewController.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    // MARK: Private Properties
    private let calculateView = CalculateView()
    private var calculateBrain = CalculateBrain()
    
    // MARK: Life Cycle
    override func loadView() {
        view = calculateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: Private Methods
extension CalculateViewController {
    
    private func commonInit() {
        addTargets()
    }
    
    private func addTargets() {
        calculateView.heightSlider.addTarget(self, action: #selector(heighSliderDidChange), for: .valueChanged)
        calculateView.weightSlider.addTarget(self, action: #selector(weightSliderDidChange), for: .valueChanged)
        calculateView.button.addTarget(self, action: #selector(showResultView), for: .touchUpInside)
    }
    
    @objc
    private func heighSliderDidChange() {
        let height = String(format: "%.2f", calculateView.heightSlider.value)
        calculateView.heightValueLabel.text = "\(height)m"
    }
    
    @objc
    private func weightSliderDidChange() {
        let weight = String(format: "%.0f", calculateView.weightSlider.value)
        calculateView.weightValueLabel.text = "\(weight)Kg"
    }
    
    @objc
    private func showResultView() {
        calculateBMI()
        let resultView = ResultViewController(
            bmiValue: calculateBrain.getBMIValue(),
            advice: calculateBrain.getAdvice(),
            color: calculateBrain.getColor()
        )
       present(resultView, animated: true)
    }
    
    private func calculateBMI() {
        let height = calculateView.heightSlider.value
        let weight = calculateView.weightSlider.value
        calculateBrain.calculateBMI(height: height, weight: weight)
    }
}
