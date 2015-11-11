//
//  NeedleModel.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation
import Parse

class Needle {
    
    var needleSize: Double?
    var type: NeedleType?
    var needleLength: Double?
    
    init(needleSize: Double, type: NeedleType, needleLength: Double) {
        self.needleSize = needleSize
        self.type = type
        self.needleLength = needleLength
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