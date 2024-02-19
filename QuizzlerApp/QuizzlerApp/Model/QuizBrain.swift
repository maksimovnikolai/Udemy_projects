//
//  QuizBrain.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 19.02.2024.
//

import Foundation

struct QuizBrain {
    
    private let quiz = [
        Question(text: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], rightAnswer: "Skin"),
        Question(text: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], rightAnswer: "100"),
        Question(text: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], rightAnswer: "Greenwich Mean Time"),
        Question(text: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], rightAnswer: "Chapeau"),
        Question(text: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], rightAnswer: "Watch"),
        Question(text: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], rightAnswer: "Adiós"),
        Question(text: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], rightAnswer: "Orange"),
        Question(text: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], rightAnswer: "Rum"),
        Question(text: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], rightAnswer: "Gorilla"),
        Question(text: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], rightAnswer: "Australia")
    ]
    
    private var questionNumber = 0
    private var score = 0
    
    func getQuestionText() -> String {
        quiz[questionNumber].text
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        score
    }
    
    func setTitle() -> [String] {
        quiz[questionNumber].answers
    }
}
