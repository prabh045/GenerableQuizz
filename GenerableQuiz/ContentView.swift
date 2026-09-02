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
                Text("Hurrah")
            case .unavailable(let reason):
                UnAvailableView(reason: reason)
            }
        }
    }
}

#Preview {
    ContentView()
}
