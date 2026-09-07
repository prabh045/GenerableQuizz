//
//  ContentView.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 02/09/26.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea(.all)
            switch SystemLanguageModel.default.availability {
            case .available:
                topicSelectionView
            case .unavailable(let reason):
                UnAvailableView(reason: reason)
            }
        }
    }
    
    private var topicSelectionView: some View {
        VStack(spacing: 16) {
            Text("Pick a topic for your quiz")
                .font(.title)
            
            ForEach(Topic.topics) { topic in
                NavigationLink {
                    QuizView()
                        .environment(QuizGenerator(topic: topic.name))
                } label: {
                    HStack {
                        Image(systemName: topic.imageName)
                        Text(topic.name)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
