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
    
    @IBOutlet weak var bu9: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu1: UIButton!
    
    
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
            print("where is the error place 1")
            findWinner(player: player1) // checks if the player won
            print("where is the error place 2")
            ActivePlayer = 2
            print("where is the error place 3")
            if player1.count < 5 {
                AutoPlay()
            }
            print("where is the error place 4", player1, player2)
            
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
        
        var msg = ""
        if contains || player.count > 4 {
            
            if !contains {
                msg = "It's a tie"
            } else {
                winner = ActivePlayer
                
                if winner == 1 {
                    // display message
                    msg = "You won!"
                } else if winner == 2 {
                    msg = "You lost"
                }
            }
            
            // freeze game & ask for rematch
            let alert = UIAlertController(title: msg, message: "Let's have a rematch!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func AutoPlay(){
        
        // scan empty cells
        var emptycells = [Int]()
        
        // when neither player one or two picked the cells, add to selection
        for tag in 1...9 {
            if !(player1.contains(tag) || player2.contains(tag)){
                emptycells.append(tag)
            }
        }
        
        let randomTag = Int.random(in: 0..<emptycells.count)
        let cellId = emptycells[randomTag]
        var buSelect:UIButton?
        
        switch cellId {
        case 1:
            buSelect = bu1
        case 2:
            buSelect = bu2
        case 3:
            buSelect = bu3
        case 4:
            buSelect = bu4
        case 5:
            buSelect = bu5
        case 6:
            buSelect = bu6
        case 7:
            buSelect = bu7
        case 8:
            buSelect = bu8
        case 9:
            buSelect = bu9
        default:
            print("Error")
        }
        playGame(buSelect: buSelect!)
        
    }

}

