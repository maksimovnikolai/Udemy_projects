//
//  QuizViewController.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 18.02.2024.
//

import UIKit


final class QuizViewController: UIViewController {
    
    // MARK: Private Properties
    private let quizView = QuizView()
    private var quizBrain = QuizBrain()
    
    // MARK: Life cycle
    override func loadView() {
        view = quizView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private Methods
extension QuizViewController {
    
    private func commonInit() {
        configureNavBar()
        addTargetForAnswerButtons()
        updateUI()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }

    private func addTargetForAnswerButtons() {
        quizView.answerButtons.forEach {
            $0.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc
    private func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer ?? "")
        
        sender.backgroundColor = userGotItRight ? .green : .red
        quizBrain.nextQuestion {
            showResult()
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc
    private func updateUI() {
        
        let answerChoices = quizBrain.setTitle()
        
        quizView.choice1Button.setTitle(answerChoices[0], for: .normal)
        quizView.choice2Button.setTitle(answerChoices[1], for: .normal)
        quizView.choice3Button.setTitle(answerChoices[2], for: .normal)
        
        navigationItem.title = "Question № \(quizBrain.setCurrentQuestionNumber())"
        
        quizView.questionLabel.text = quizBrain.getQuestionText()
        quizView.progressView.progress = quizBrain.getProgress()
        quizView.scoreValueLabel.text = "\(quizBrain.getScore())"
    
        quizView.answerButtons.forEach { $0.backgroundColor = .clear }
    }
    
    private func showResult() {
        let score = quizView.scoreValueLabel.text
        let message = "Number of correct answers: \(score ?? "")"
        let alert = UIAlertController(title: "Done!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
