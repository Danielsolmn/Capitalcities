//
//  questionsdata .swift
//  Trivia
//
//  Created by Daniel Woldetsadik on 6/25/25.
//

import Foundation
struct Question {
    let imageName: String
    let text: String
    let answers: [String]
    let correctIndex: Int
}
