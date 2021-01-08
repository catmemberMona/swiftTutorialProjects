//
//  Pockemon.swift
//  pockemonGuidedProj
//
//  Created by mona zheng on 1/6/21.
//

import UIKit

class Pockemon {

    var latitiude: Double?
    var longitude: Double?
    var image: String?
    var name: String?
    var des: String?
    var power: Double?
    var isCatch: Bool?
    
    init(latitude:Double, longitude: Double, image: String,name: String,des: String,power: Double){
        self.latitiude=latitude
        self.longitude=longitude
        self.image=image
        self.name=name
        self.des=des
        self.power=power
        self.isCatch=false
}
    

}
