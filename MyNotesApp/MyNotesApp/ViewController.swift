//
//  ViewController.swift
//  MyNotesApp
//
//  Created by mona zheng on 2/3/21.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDes: UITextView!
    
    // Variables
    var EditingNote: MyNotes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // when editing a previous note
        if let note = EditingNote {
            txtTitle.text = note.title
            txtDes.text = note.details
        }
    }
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Actions
    @IBAction func buSave(_ sender: Any) {
        let newNote:MyNotes
        
        if let note = EditingNote {
            // editing an existing note
            newNote = note
        } else {
            // create a note object from core data entity
            newNote = MyNotes(context: context)
        }
        
        // add info to the object
        newNote.title = self.txtTitle.text!
        newNote.details = self.txtDes.text!
        newNote.date = Date()
        
        do {
            // app delegate saves the data
            AD.saveContext()
            self.txtTitle.text = ""
            self.txtDes.text! = ""
            
        } catch {
            print("Note was not saved.")
        }
        
   
    }
}

