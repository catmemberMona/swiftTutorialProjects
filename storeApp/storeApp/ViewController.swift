//
//  ViewController.swift
//  storeApp
//
//  Created by mona zheng on 2/13/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtInputStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buSave(_ sender: Any) {
        let newStore = StoreType(context: context)
        newStore.name = txtInputStoreName.text
        do {
            ad.saveContext()
            txtInputStoreName.text = ""
        } catch {
            print("Did not save store name")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

