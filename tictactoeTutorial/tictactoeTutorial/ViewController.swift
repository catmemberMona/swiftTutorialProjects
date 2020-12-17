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
        let buSelect = sender
        print(buSelect.tag)
    }
    

}

