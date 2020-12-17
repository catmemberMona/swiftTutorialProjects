//
//  ViewController.swift
//  calculator
//
//  Created by mona zheng on 12/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberViewArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var newOperation = true
    func addNumberToInput(number:String){
        var textNumber = String(numberViewArea.text!)
        if newOperation {
            textNumber = ""
            newOperation = false
        }
        textNumber += number
        numberViewArea.text = textNumber
        
    }
    
    
    @IBAction func buAC(_ sender: Any) {
        
    }
    
    @IBAction func buPlusMinus(_ sender: Any) {
    }
    
    @IBAction func buPercent(_ sender: Any) {
    }
    
    
    var op = "+"
    var number1:Double?
    
    @IBAction func buDiv(_ sender: Any) {
    }
    
    
    @IBAction func buMult(_ sender: Any) {
        op = "*"
        number1 = Double(numberViewArea.text!)
        newOperation = true
    }
    
    
    @IBAction func buSub(_ sender: Any) {
    }
    
    
    @IBAction func buAdd(_ sender: Any) {
    }
    
    
    @IBAction func buEqual(_ sender: Any) {
        let number2 = Double(numberViewArea.text!)
        var results:Double?
        switch op {
        case "*":
            results = number1! * number2!
        default:
            results = 0.0
        }
        numberViewArea.text = String(results!)
        newOperation = true
    }
    
    
    
    @IBAction func buDot(_ sender: Any) {
    }
    
    
    @IBAction func buZero(_ sender: Any) {
        addNumberToInput(number: "0")
    }
    
    
    @IBAction func buOne(_ sender: Any) {
        addNumberToInput(number: "1")
    }
    
    
    @IBAction func buTwo(_ sender: Any) {
        addNumberToInput(number: "2")
    }
    
    
    @IBAction func buThree(_ sender: Any) {
        addNumberToInput(number: "3")
    }
    
    
    @IBAction func buFour(_ sender: Any) {
        addNumberToInput(number: "4")
    }
    
    
    @IBAction func buFive(_ sender: Any) {
        addNumberToInput(number: "5")
    }
    
    @IBAction func buSix(_ sender: Any) {
        addNumberToInput(number: "6")
    }
    
    
    @IBAction func buSeven(_ sender: Any) {
        addNumberToInput(number: "7")
    }
    
    
    @IBAction func buEight(_ sender: Any) {
        addNumberToInput(number: "8")
    }
    
    @IBAction func buNine(_ sender: Any) {
        addNumberToInput(number: "9")
    }
    
    
    
}

