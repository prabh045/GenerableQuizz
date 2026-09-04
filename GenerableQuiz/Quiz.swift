//
//  Quiz.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 04/09/26.
//

import FoundationModels

// Generable Macro so AI Model can give us back response of type Quiz
@Generable
struct Quiz {
    let questions: [String]
}
