//
//  TVCNote.swift
//  MyNotesApp
//
//  Created by mona zheng on 2/3/21.
//

import UIKit

class TVCNote: UITableViewCell {

    // Outlets variables 
    @IBOutlet weak var laTitle: UILabel!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var laDate: UILabel!
    @IBOutlet weak var buDelete: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setNotes(note: MyNotes){
        laTitle.text = note.title
        txtDetails.text = note.details
        
        let format = DateFormatter()
        format.dateFormat = "MM/DD/YY h:mm a"
        let date = format.string(from: note.date as! Date)
        laDate.text = date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
