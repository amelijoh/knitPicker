//
//  AddNeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit
import Parse

class AddNeedleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let newNeedle = Needle(needleSize: 0.0, needleType: "", needleLength: 0.0, needleParseID: "")
    var needleParseObjectID = ""
    

    @IBOutlet weak var needleSizeInput: UITextField!
    
    @IBOutlet weak var needleLengthInput: UITextField!
    
    @IBOutlet weak var needleTypePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNeedleButtonPressed(sender: UIButton) {
        addNeedle()
        saveNeedleData()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newNeedle.needleTypeArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return newNeedle.needleTypeArray[row]
    }
    
    func addNeedle() {
        newNeedle.needleSize = Double(needleSizeInput.text!)
        let row = needleTypePicker.selectedRowInComponent(0)
        let selected = newNeedle.needleTypeArray[row]
        newNeedle.needleType = newNeedle.needleTypeArray[row]
        newNeedle.needleLength = Double(needleLengthInput.text!)
        newNeedle.needleParseID = needleParseObjectID
        print("\(newNeedle.needleSize!), \(newNeedle.needleType!)")
    }
    
    func saveNeedleData() {
        let addedNeedle = PFObject(className:"AddedNeedle")
        addedNeedle["size"] = newNeedle.needleSize
        addedNeedle["type"] = newNeedle.needleType
        addedNeedle["length"] = newNeedle.needleLength
        addedNeedle.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("The needle has been saved")
                self.needleParseObjectID = addedNeedle.objectId!
                print(self.needleParseObjectID)
                //self.addNeedle()
            } else {
                print("There was a problem with the needle")
            }
        }
    }
    
}

