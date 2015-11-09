//
//  YarnModel.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation

class Yarn {
    
    var brand: String?
    var yarnWeight: WeightType?
    var lengthPerSkein: Double?
    var numberOfSkeins: Int?
    
    init(brand: String, yarnWeight: WeightType, lengthPerSkein: Double, numberOfSkeins: Int) {
        self.brand = brand
        self.yarnWeight = yarnWeight
        self.lengthPerSkein = lengthPerSkein
        self.numberOfSkeins = numberOfSkeins
    }
}



enum WeightType: Int, CustomStringConvertible {
    case Lace = 0
    case SuperFine = 1
    case Fine = 2
    case Light = 3
    case Medium = 4
    case Bulky = 5
    case SuperBulky = 6
    static var count: Int { return SuperBulky.hashValue + 1 }
    
    var description: String {
        switch self {
        case .Lace: return "Lace"
        case .SuperFine: return "Super fine/fingering"
        case .Fine: return "Fine/Sport-weight"
        case .Light: return "Light/DK"
        case .Medium: return "Medium/Worsted"
        case .Bulky: return "Bulky/Chunky"
        case .SuperBulky: return "Super bulky"
        }
    }
}