//
//  Topic.swift
//  GenerableQuiz
//
//  Created by Prabhdeep Singh on 07/09/26.
//

import Foundation

struct Topic: Identifiable {
    let id: UUID = UUID()
    var name: String
    var imageName: String
    
    static var topics: [Topic] {
        return [
            Topic(name: "Marine Life", imageName: "fish"),
            Topic(name: "Farm Animals", imageName: "hare"),
            Topic(name: "Modern Reptiles", imageName: "lizard"),
            Topic(name: "Birds of Prey", imageName: "bird")
        ]
    }
}

