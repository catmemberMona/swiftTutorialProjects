//
//  ViewController.swift
//  tictactoeTutorial
//
//  Created by mona zheng on 12/17/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buSelectEvent(_ sender: UIButton) {
        let buSelect = sender // whichever button triggered the event
        playGame(buSelect: buSelect)
    }
    
    var ActivePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buSelect: UIButton){
        
        if ActivePlayer == 1 {
            buSelect.setTitle("X", for: .normal) // text for button
            buSelect.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 255/255, alpha: 0.8)
            player1.append(buSelect.tag)
            findWinner(player: player1) // checks if the player won
            ActivePlayer = 2
            
        } else {
            buSelect.setTitle("O", for: .normal)
            buSelect.backgroundColor = UIColor(red: 52/255, green: 114/255, blue: 0/255, alpha: 0.6)
            player2.append(buSelect.tag)
            findWinner(player: player2)
            ActivePlayer = 1
        }
        buSelect.isEnabled = false
    }
    
    
    func findWinner(player: [Int]){
        if player.count < 3 {
            return
        }
        
        var winner = -1
        let winnings = [[1,4,7],[1,2,3],[1,5,9],[2,5,8],[3,6,9],[3,5,9],[4,5,6],[7,8,9]]
        var contains = false
        
        for possibility in winnings {
            var count = 0;
            for index in 0...2 {
                count+=1
                if !player.contains(possibility[index]){
                    count = 0
                }
            }
            if count == 3 {
                contains = true
                break
            }
        }
        if contains == true {
            winner = ActivePlayer
            if winner == 1 {
                // display message
                print("You won!")
            } else {
                print("You lost")
            }
            // freeze game & ask for rematch
        }
        

        
    }
    

}

