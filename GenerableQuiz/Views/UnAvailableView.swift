//
//  UnAvailableView.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 02/09/26.
//

import SwiftUI
import FoundationModels

struct UnAvailableView: View {
    let reason: SystemLanguageModel.Availability.UnavailableReason
    
    var body: some View {
        let text = switch reason {
        case .appleIntelligenceNotEnabled:
            "Apple Intelligence is not enabled. Please enable it in Settings."
        case .deviceNotEligible:
            "This device is not eligible for Apple Intelligence. Please use a compatible device."
        case .modelNotReady:
            "The language model is not ready."
        @unknown default:
            "The language model is unavailable."
        }
        ContentUnavailableView(text, systemImage: "apple.intelligence.badge.xmark")
    }
}

#Preview {
    UnAvailableView(reason: .appleIntelligenceNotEnabled)
}

#Preview("Not enabled") {
    UnAvailableView(reason: .appleIntelligenceNotEnabled)
}


#Preview("Not eligible") {
    UnAvailableView(reason: .deviceNotEligible)
}


#Preview("Model not ready") {
    UnAvailableView(reason: .modelNotReady)
}
