//
//  VCAddItem.swift
//  storeApp
//
//  Created by mona zheng on 2/13/21.
//

import UIKit

class VCAddItem: UIViewController {
    
    // OUTLET VARIABLES
    @IBOutlet weak var txtInputItemName: UITextField!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var SelectStoreView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // OUTLET FUNCTIONS
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buSave(_ sender: Any) {
    }
    
    @IBAction func buSelectImage(_ sender: Any) {
        // TO DO: SELECT IMAGER FROM PHONE
        print("Image selected")
    }
    
    @IBAction func buAddStore(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
