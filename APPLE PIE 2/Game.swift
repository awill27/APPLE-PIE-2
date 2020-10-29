//
//  Game.swift
//  APPLE PIE 2
//
//  Created by MXC Swift on 8/27/20.
//  Copyright © 2020 Ashley Williams. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters:[Character]
    
    mutating func playerGuessed(letter: Character) {
          guessedLetters.append(letter)
          if !word.contains(letter) {
            incorrectMovesRemaining -= 1
          }
    }
var formattedWord: String {
        var guessedWord = " "
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    
}
}
