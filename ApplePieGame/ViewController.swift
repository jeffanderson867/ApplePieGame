//
//  ViewController.swift
//  ApplePieGame
//
//  Created by Big J on 6/1/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var incorrectLeftLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    var currentGame: Game!
    var listOfWords: [String] = ["dogs", "cats","basketball", "baseball", "house"]
    let incorrectMovesAllowed: Int = 7
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
    }
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }else {
            updateUI()
        }
    }
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins) Losses: \(totalLosses)"
        incorrectLeftLabel.text = "\(currentGame.incorrectMovesRemaining)"
        correctWordLabel.text = "\(currentGame.formattedWord)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

