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
        
        run {
            for try await partialData in stream {
                withAnimation {
                    self.quiz = partialData.content
                }
            }
        }
    }
    
    func regenerate(question: Question.PartiallyGenerated) {
        guard !isGenerating,
              var quiz = self.quiz,
              let questions = quiz.questions,
              let index = questions.firstIndex(where: { $0.id == question.id }) else {
            return
        }
        
        let session = LanguageModelSession(instructions: "Create a question focused on \(topic)")
        let existingQuestions = questions.compactMap { $0.text }.joined(separator: ", ")
        let prompt = "Avoid asking questions similar to these: \(existingQuestions)"
        let stream = session.streamResponse(to: prompt, generating: Question.self)
        run {
            for try await partial in stream {
                withAnimation {
                    quiz.questions?[index] = partial.content
                    self.quiz = quiz
                }
            }
        }
    }
    
    func run(session: @escaping () async throws -> Void) {
        Task {
            withAnimation {
                isGenerating = true
            }
            error = nil
            do {
                try await session()
            } catch {
                self.error = error
            }
            isGenerating = false
        }
    }
}
