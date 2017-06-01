//
//  game.swift
//  ApplePieGame
//
//  Created by Big J on 6/1/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import Foundation


struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String{
        var guessedWord = ""
        for letter in word.characters{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
                
            }else {
                guessedWord += "X"
                
            }
            
        }
        
        
        return guessedWord
    }
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
        
    }
    
    
    
    
    
}
