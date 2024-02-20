//
//  QuizViewController.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 18.02.2024.
//

import UIKit

final class QuizViewController: UIViewController {
    
    //MARK: Private Properties
    private let quizzlerView = QuizzlerView()
    private var quizBrain = QuizBrain()
    
    // MARK: Life cycle
    // Load View Method
    override func loadView() {
        view = quizzlerView
    }
    
    // View Did Load Method
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

//MARK: - Private Methods
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
        quizzlerView.answerButtons.forEach {
            $0.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc
    private func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer ?? "")
        
        sender.backgroundColor = userGotItRight ? .green : .red
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc
    private func updateUI() {
        let answerChoices = quizBrain.setTitle()
        quizzlerView.choice1Button.setTitle(answerChoices[0], for: .normal)
        quizzlerView.choice2Button.setTitle(answerChoices[1], for: .normal)
        quizzlerView.choice3Button.setTitle(answerChoices[2], for: .normal)
        
        navigationItem.title = "Question № \(quizBrain.setCurrentQuestionNumber())"
        
        quizzlerView.questionLabel.text = quizBrain.getQuestionText()
        quizzlerView.progressView.progress = quizBrain.getProgress()
        quizzlerView.scoreLabel.text = "Score: \(quizBrain.getScore())"
    
        quizzlerView.answerButtons.forEach { $0.backgroundColor = .clear }
    }
}
