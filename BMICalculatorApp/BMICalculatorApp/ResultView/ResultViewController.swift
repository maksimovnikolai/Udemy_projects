//
//  ResultViewController.swift
//  BMICalculatorApp
//
//  Created by Nikolai Maksimov on 21.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private let result = ResultView()
    
    override func loadView() {
        view = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
