//
//  QuizGenerator.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 04/09/26.
//

import SwiftUI
import FoundationModels

@Observable
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?
    var isGenerating = false
    var error: Error?

    init(topic: String) {
        self.topic = topic
    }
    
   // we give instructions to a LanguageModelSession to describe or contextualize the data you want back from it. This information acts like a prompt and helps refine the model’s responses.
    func generateQuiz() {
        let session = LanguageModelSession(instructions: "Create a quiz with the provided topic as the focus.")
        let stream = session.streamResponse(to: topic, generating: Quiz.self)
        
        Task {
            isGenerating = true
            do {
                for try await partialData in stream {
                    quiz = partialData.content
                }
            } catch (let er) {
                error = er
            }
            isGenerating = false
        }
    }
}
