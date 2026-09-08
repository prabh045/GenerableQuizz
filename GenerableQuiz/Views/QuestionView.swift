//
//  QuestionView.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 08/09/26.
//

import SwiftUI
import FoundationModels

struct QuestionView: View {
    var question: Question.PartiallyGenerated
    @State var selectedAnswer: Answer.PartiallyGenerated?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let text = question.text {
                HStack {
                    Text(text)
                    Spacer()
                }
                .padding(.bottom, 8)
            }
            
            if let answers = question.answers {
                ForEach(answers) { answer in
                    AnswerView(displayAnswer: answer, selectedAnswer: $selectedAnswer)
                }
            }
            
            if let selectedAnswer = selectedAnswer {
                Text(selectedAnswer.explanation ?? "Generating...")
                    .font(.body.italic())
                    .padding(.top, 8)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(24)
        .background(.background, in: RoundedRectangle(cornerRadius: 24.0))
    }
}

#Preview {
    QuestionView(question: Question.sample.asPartiallyGenerated())
}
