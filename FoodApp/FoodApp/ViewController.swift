//
//  ViewController.swift
//  FoodApp
//
//  Created by mona zheng on 1/24/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var ListOfFoods = [Food]()
    @IBOutlet weak var cvListOfFoods: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadFoodsFromPropertyList()
        
        cvListOfFoods.delegate = self
        cvListOfFoods.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListOfFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let FoodCell:CVCellFood = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! CVCellFood
        FoodCell.setFood(food: ListOfFoods[indexPath.row])
        return FoodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFoodDetails", sender: ListOfFoods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if the segue is the correct one if there is more than one segue
        if segue.identifier == "showFoodDetails" {
            // connects to that specific view controller
            if let des = segue.destination as? VCFoodDetail {
                // check sender to be Food instance
                if let food = sender as? Food {
                    des.food = food
                }
            }
        }
     
    }
    
    func loadFoodsFromPropertyList(){
        // get data from properties list
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        let url = URL(fileURLWithPath: path)
//        print("path:", path , "and url:", url)
        
        do {
            
            let data = try Data(contentsOf: url)
//            print("data:", data)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
//            print("plist:", plist)
            let itemsArray = plist as! [[String:String]]
//            print("items arr:", itemsArray)
            for item in itemsArray {
                // error if item.name! etc
                ListOfFoods.append(Food(name: item["name"]!, des: item["des"]!, image: item["image"]!))
//                print(food.name!)
            }
        } catch {
            print("Data couldn't be retrieved...")
        }
        
        // append each item --> object Food to the listOfFoods
    }

}

