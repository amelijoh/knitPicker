//
//  NeedleModel.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation

class Needle {
    
    var needleSize: Double?
    var needleTypeArray: [String] = ["Circular", "Doublepointed", "Straight"]
    var needleType: String?
    var needleLength: Double?
    
    init(needleSize: Double, needleType: String, needleLength: Double) {
        self.needleSize = needleSize
        self.needleType = needleType
        self.needleLength = needleLength
   
    }
}

//enum NeedleType: Int, CustomStringConvertible {
//    case Circular = 0
//    case Doublepointed = 1
//    case Straight = 2
//    static var count: Int { return NeedleType.Straight.hashValue + 1 }
//    
//    var description: String {
//        switch self {
//        case .Circular: return "Circular"
//        case .Doublepointed: return "Doublepointed"
//        case .Straight: return "Straight"
//        }
//    }
//}

//var needleType = [String]()
//needleType = ["Circular", "Doublepointed", "Straight"]
