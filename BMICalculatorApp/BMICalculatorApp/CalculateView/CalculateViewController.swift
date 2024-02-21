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
        let resultView = ResultViewController()
       present(resultView, animated: true)
    }
}
