//
//  ViewController.swift
//  zooApp
//
//  Created by mona zheng on 1/13/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listOfLargerAnimals = [Animal]()
    var listOfSmallerAnimals = [Animal]()
    var animalSize = ["Larger", "Smaller"]

    @IBOutlet weak var tvListAnimals: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // add each animal instance
        listOfSmallerAnimals.append(Animal(name: "Baboon", des: "Lives in high places and ..", image: "baboon"))
        listOfSmallerAnimals.append(Animal(name: "Bulldog", des: "What a cutie and ...", image: "bulldog"))
        listOfLargerAnimals.append(Animal(name: "Panda", des: "Black eye circles. Also rollable and ...", image: "panda"))
        listOfSmallerAnimals.append(Animal(name: "Swallow Bird", des: "A bird that swallows? Or maybe just a bird that flys and ...", image: "swallow_bird"))
        listOfLargerAnimals.append(Animal(name: "White Tiger", des: "Ahhhhhhhhh....", image: "white_tiger"))
        listOfLargerAnimals.append(Animal(name: "Zebra", des: "Is this another white tiger? Ahhhh...", image: "zebra"))
        
        // this view controller will be the table's delegate and data source 
        tvListAnimals.delegate = self
        tvListAnimals.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return listOfLargerAnimals.count
        } else {
            return listOfSmallerAnimals.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSize[section]
    }
    
    // called as many times as the length of the array ^^
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal: TVCAnimal = tableView.dequeueReusableCell(withIdentifier: "cellAnimal", for: indexPath) as! TVCAnimal
        
        if indexPath.section == 0 {
            cellAnimal.setAnimal(animal: listOfLargerAnimals[indexPath.row])
        } else {
            cellAnimal.setAnimal(animal: listOfSmallerAnimals[indexPath.row])
        }
        return cellAnimal
    }
    
    // removing cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
         
            // add the selected animal to the end of the section
            listOfLargerAnimals.append(listOfLargerAnimals[indexPath.row])
            // remove
            listOfLargerAnimals.remove(at: indexPath.row)
        } else {
        
            // add
            listOfSmallerAnimals.append(listOfSmallerAnimals[indexPath.row])
            // remove
            listOfSmallerAnimals.remove(at: indexPath.row)
        }
        
        tvListAnimals.reloadData()
    }


}

