//
//  VCListNotes.swift
//  MyNotesApp
//
//  Created by mona zheng on 2/3/21.
//

import UIKit
import CoreData

class VCListNotes: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Outlets
    @IBOutlet weak var tvListNotes: UITableView!
    @IBAction func buBackToAdd(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Variables
    var listNotes = [MyNotes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadNotes()
        tvListNotes.delegate = self
        tvListNotes.dataSource = self
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    // add data to each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TVCNote = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TVCNote
        
        cell.setNotes(note: listNotes[indexPath.row])
        
        // functional delete button for individual notes
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buDeleteNote(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func buDeleteNote(_ sender: UIButton){
        // app delegate deletes note instance/object
        context.delete(listNotes[sender.tag])
        // need to save data
        AD.saveContext()
        // reload data again
        loadNotes()
    }
    
    // retrieve data from core data 
    func loadNotes(){
        // entity has a method that gives ref/id ??
        let fetchRequest: NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        do {
            // retrieves all the saved notes 
            listNotes = try context.fetch(fetchRequest)
            tvListNotes.reloadData()
        } catch {
            print("can not read from database")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
