//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Emmeline Mutka.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1
    var gameSquares = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winnerCombo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var activeGame = true
    var gameWinner = false
    var playTurn = 0
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    func gameFinished() {
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.isEnabled = false
            button.adjustsImageWhenDisabled = false
        }
    }
    
    @IBAction func gameAction(sender: AnyObject) {
    
        if (gameSquares[sender.tag-1] == 0 && activeGame == true) {
            gameSquares[sender.tag-1] = currentPlayer
            if (currentPlayer == 1) {
            sender.setImage(UIImage(named: "Unicorn.png"), for: UIControl.State())
            currentPlayer = 2
            } else {
            sender.setImage(UIImage(named: "Dragon.png"), for: UIControl.State())
            currentPlayer = 1
            }
            let disableButton = sender as! UIButton
            disableButton.isEnabled = false
            disableButton.adjustsImageWhenDisabled = false
        }
        
        playTurn += 1
        print("\(playTurn)number of Turns")
        
        for combination in winnerCombo {
            if gameSquares[combination[0]] != 0 && gameSquares[combination[0]] == gameSquares[combination[1]] && gameSquares[combination[1]] == gameSquares[combination[2]] {
                activeGame = false
                if gameSquares[combination[0]] == 1 {
                    winnerLabel.text = "UNICORN WON!"
                } else {
                    winnerLabel.text = "DRAGON WON!"
                }
                playAgainBtn.isHidden = false
                winnerLabel.isHidden = false
                gameWinner = true
                gameFinished()
            }
        }
        
        if gameWinner == false && playTurn == 9 {
            winnerLabel.text = "IT'S A DRAW"
            winnerLabel.isHidden = false
            playAgainBtn.isHidden = false
        }
        
    }
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(sender: AnyObject) {
        gameSquares = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        currentPlayer = 1
        playAgainBtn.isHidden = true
        winnerLabel.isHidden = true
        playTurn = 0
        gameWinner = false
        
        for i in 1...9 {
         let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
            button.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

