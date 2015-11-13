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
    var needleLength: Int?
    var needleParseID: String?
    
    init(needleSize: Double, needleType: String, needleLength: Int, needleParseID: String) {
        self.needleSize = needleSize
        self.needleType = needleType
        self.needleLength = needleLength
        self.needleParseID = needleParseID
   
    }
}

//class NeedleBinder {
//    var needleBinder: [Needle]
//    
//    init(needleBinder: [Needle])
//        self.needleBinder = needleBinder
//}