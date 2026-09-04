//
//  QuizView.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 04/09/26.
//

import SwiftUI

struct QuizView: View {
    @State private var quiz: Quiz
    
    init(quiz: Quiz) {
        self.quiz = quiz
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                quizStack
            }
        }
    }
    
    private var quizStack: some View {
        VStack(spacing: 16) {
            ForEach(quiz.questions, id: \.description) { question in
                Text(question)
            }
        }
        .navigationTitle("Sample Topic")
        .padding()
    }
}

#Preview {
    var sampleQuiz: Quiz {
        Quiz(questions: [
            "Question 1",
            "Question 2",
            "Question 3"
        ])
    }
    
    QuizView(quiz: sampleQuiz)
}
