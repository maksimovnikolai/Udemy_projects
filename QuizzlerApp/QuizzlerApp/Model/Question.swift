//
//  Question.swift
//  QuizzlerApp
//
//  Created by Nikolai Maksimov on 19.02.2024.
//

import Foundation

struct Question {
    
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(text: String, answers: [String], rightAnswer: String) {
        self.text = text
        self.answers = answers
        self.rightAnswer = rightAnswer
    }
}
