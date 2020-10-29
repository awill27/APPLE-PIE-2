//
//  ViewController.swift
//  APPLE PIE 2
//
//  Created by MXC Swift on 8/26/20.
//  Copyright © 2020 Ashley Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
  
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["sauske uchiha", "usagi tsukino", "kakashi hatake","naruto uzumaki", "ken kaneki", "ichigo kurosaki", "goku","yukihira soma","pink lady", "golden delicious", "granny smith", "ambrosia","macintosh","honey crisp","fuji"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }

    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }

    }
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    func newRound() {
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord,incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
            } else {
            enableLetterButtons(false)
        }
    }
            func enableLetterButtons(_ enable: Bool) {
              for button in letterButtons {
                button.isEnabled = enable
              }
        }
    
            
    
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
                letters.append(String(letter))
            }
        
         let wordWithSpacing = letters.joined(separator: " ")
            correctWordLabel.text = wordWithSpacing
        //correctWordLabel.text = currentGame.formattedWord//
        scoreLabel.text = "Wins: \(totalWins), Losses:\(totalLosses)"
        treeImageView.image = UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled=false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()

        
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
          } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
          } else {
            updateUI()
        

        
    }
    

}

}

