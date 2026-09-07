//
//  Answer.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 07/09/26.
//

import Foundation
import FoundationModels

@Generable
struct Answer: Identifiable {
    let id = UUID()
    
    @Guide(description: "the display text of answer")
    let text: String
    
    @Guide(description: "Whether this is correct answer or not")
    let isCorrect: Bool
    
    @Guide(description: "Detailed explanation to why the answer is coreect or incorrect")
    let explanation: String
}

extension Answer {
    static let correctAnswer = Answer(
        text: "This answer is correct.",
        isCorrect: true,
        explanation: "Explanation that this is right."
    )


    static let incorrectAnswer = Answer(
        text: "This answer is incorrect.",
        isCorrect: false,
        explanation: "Explanation that this is wrong."
    )
}
