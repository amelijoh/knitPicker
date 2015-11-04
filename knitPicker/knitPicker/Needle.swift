//
//  NeedleModel.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation

class Needle {
    
    var size: Double?
    var type: needleType?
    var length: Double?
    
    init(size: Double, type: needleType, length: Double) {
        self.size = size
        self.type = type
        self.length = length
    }
}

enum needleType {
    
    case Doublepoint, Straight, Circular
}



//class Animal {
//    var name = String()
//    var gender = String()
//    var animalType = String()
//    
//    init(name: String, gender: String, animalType: String) {
//        self.name = name
//        self.gender = gender
//        self.animalType = animalType
//    }
//    
//}