//
//  Pincushion.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import Foundation

class Pincushion {
    var needles = [Double: Needle]()
    var pincushion = String()
    
    init(pincushion: String) {
        self.pincushion = pincushion
    }
    
    
    func addNeedle(needleToAdd: Needle) {
        needles[needleToAdd.size!] = needleToAdd
    }
    
    func updateNeedle(needleToUpdate: Needle) {
        self.needles.updateValue(needleToUpdate, forKey: needleToUpdate.size!)
    }
    
}
