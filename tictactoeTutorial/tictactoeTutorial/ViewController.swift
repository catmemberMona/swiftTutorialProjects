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
            ActivePlayer = 2
            
        } else {
            buSelect.setTitle("O", for: .normal)
            buSelect.backgroundColor = UIColor(red: 52/255, green: 114/255, blue: 0/255, alpha: 0.6)
            player2.append(buSelect.tag)
            ActivePlayer = 1
        }
        buSelect.isEnabled = false
    }
    

}

