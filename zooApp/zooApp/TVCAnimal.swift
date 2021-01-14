//
//  TVCAnimal.swift
//  zooApp
//
//  Created by mona zheng on 1/13/21.
//

import UIKit

class TVCAnimal: UITableViewCell {

    @IBOutlet weak var iv_animalImage: UIImageView!
    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var laDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setAnimal(animal: Animal){
        self.laName.text = animal.name!
        self.laDescription.text = animal.des!
        self.iv_animalImage.image = UIImage(named: animal.image!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
