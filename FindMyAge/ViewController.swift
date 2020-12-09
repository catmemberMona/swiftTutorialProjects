//
//  ViewController.swift
//  FindMyAge
//
//  Created by mona zheng on 12/8/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var hasPassed: Bool? = true
    @IBOutlet weak var txtYearOfBirth: UITextField!
    @IBOutlet weak var showAge: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func swHasBirthdayPassed(_ sender: UISwitch) {
        if sender.isOn{
           hasPassed = true
        } else {
            hasPassed = false
        }
    }
    
    @IBAction func buFindAge(_ sender: Any) {
        // on click
       getAge()
    }
    
    func getAge(){
        // if input is valid
        if let yearOfBirth = Int(txtYearOfBirth.text!) {
            // get current year
            let date = Date()
            let calender = Calendar.current
            let year = calender.component(.year, from: date)
            
            // if input is neg or over 2020
            if yearOfBirth < 0 || yearOfBirth > year {
                showAge.text = "Please input a valid birth year"
            } else {
                var personsAge: Int?
                if hasPassed! {
                    personsAge = year - yearOfBirth
                } else {
                    personsAge = year - yearOfBirth - 1
                }
                   
                showAge.text = "You are \(personsAge!) years old!"
            }

        } else {
            showAge.text = "Please input a valid birth year"
        }
        txtYearOfBirth.text = ""
    }
    
    // close keyboard view when nonkeyboard area is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // closes keyboard and calculates age when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getAge()
        self.view.endEditing(true)
        return true
    }
    
}

