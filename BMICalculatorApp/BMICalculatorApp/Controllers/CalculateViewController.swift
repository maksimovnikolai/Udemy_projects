//
//  CalculateViewController.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    private let calculateView = CalculateView()
    
    override func loadView() {
        view = calculateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
}

extension CalculateViewController {
    
    private func commonInit() {
        addTargets()
    }
    
    private func addTargets() {
        calculateView.heightSlider.addTarget(self, action: #selector(heighSliderDidChange), for: .valueChanged)
        calculateView.weightSlider.addTarget(self, action: #selector(weightSliderDidChange), for: .valueChanged)
        
    }
    
    @objc
    private func heighSliderDidChange() {
        let height = String(format: "%.2f", calculateView.heightSlider.value)
        calculateView.heightValueLabel.text = "\(height)m"
    }
    
    @objc
    private func weightSliderDidChange() {
        let weight = String(format: "%.3f", calculateView.weightSlider.value)
        calculateView.weightValueLabel.text = "\(weight)Kg"
    }
}
