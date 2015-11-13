//
//  YarnModel.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation

class Yarn {
    
    var brandName: String?
    var yarnWeightArray: [String] = ["Lace", "Super fine/Fingering", "Fine/Sport-weight", "Light/DK", "Medium/Worsted", "Bulky/Chunky", "Super bulky"]
    var yarnWeightType: String?
    var lengthPerSkein: Int?
    var numberOfSkeins: Int?
    
    init(brandName: String, yarnWeightType: String, lengthPerSkein: Int, numberOfSkeins: Int) {
        self.brandName = brandName
        self.yarnWeightType = yarnWeightType
        self.lengthPerSkein = lengthPerSkein
        self.numberOfSkeins = numberOfSkeins
    }
}
