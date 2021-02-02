//
//  CVCellFood.swift
//  FoodApp
//
//  Created by mona zheng on 1/24/21.
//

import UIKit

class CVCellFood: UICollectionViewCell {
    @IBOutlet weak var iv_FoodImage: UIImageView!
    
    @IBOutlet weak var laFoodName: UILabel!
    
    func setFood(food:Food){
        iv_FoodImage.image = UIImage(named: food.image!)
        laFoodName.text = food.name!
    }
    
}
