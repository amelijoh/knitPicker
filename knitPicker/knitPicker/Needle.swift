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
    var type: NeedleType?
    var length: Double?
    
    init(size: Double, type: NeedleType, length: Double) {
        self.size = size
        self.type = type
        self.length = length
    }
}



enum NeedleType: Int, CustomStringConvertible {
    case Circular = 0
    case Doublepointed = 1
    case Straight = 2
    static var count: Int { return NeedleType.Straight.hashValue + 1 }
    
    var description: String {
        switch self {
        case .Circular: return "Circular"
        case .Doublepointed: return "Doublepointed"
        case .Straight: return "Straight"
        }
    }
}


