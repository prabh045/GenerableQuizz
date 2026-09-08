//
//  AnswerView.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 07/09/26.
//

import SwiftUI
import FoundationModels

struct AnswerView: View {
    var displayAnswer: Answer.PartiallyGenerated
    @Binding var selectedAnswer: Answer.PartiallyGenerated?
    
    var body: some View {
        Button {
            selectedAnswer = displayAnswer
        } label: {
            HStack {
                Image(systemName: imageName)
                Text(displayAnswer.text ?? "Generating...")
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                Spacer()
            }
        }
        .buttonStyle(.bordered)
        .foregroundStyle(tintColor)
        .tint(tintColor)
    }
    
    private var tintColor: Color {
        if let isAnswerCorrect {
            return isAnswerCorrect ? .green : .red
        } else {
            return .secondary
        }
    }
    
    private var isAnswerCorrect: Bool? {
        guard selectedAnswer?.id == displayAnswer.id else { return nil }
        return displayAnswer.isCorrect
    }
    
    private var imageName: String {
        if let isAnswerCorrect {
            return isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill"
        } else {
            return "circle"
        }
    }
    
    
}

#Preview {
    @Previewable @State var correctAnswer = Optional(Answer.correctAnswer.asPartiallyGenerated())
    @Previewable @State var incorrectAnswer = Optional(Answer.incorrectAnswer.asPartiallyGenerated())


    VStack {
        AnswerView(displayAnswer: correctAnswer!, selectedAnswer: $correctAnswer)
    }
}
