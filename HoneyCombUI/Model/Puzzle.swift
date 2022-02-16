//
//  Puzzle.swift
//  HoneyCombUI
//
//  Created by Stanley Pan on 2022/02/16.
//

import SwiftUI

// MARK: Puzzle Model and sample puzzles
struct Puzzle: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var answer: String
    var jumbledWord: String
}

var puzzles: [Puzzle] = [
    Puzzle(imageName: "crown", answer: "Crown", jumbledWord: "CUROROWKN"),
    Puzzle(imageName: "shower", answer: "Shower", jumbledWord: "SHAOWIERL")
]
