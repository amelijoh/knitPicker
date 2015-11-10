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
    
    let newNeedle = Needle(size: 0.0, type: .Circular, length: 0.0)

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
    
    func addNeedle() {
        newNeedle.size = Double(needleSizeInput.text!)
        newNeedle.type = NeedleType(rawValue: needleTypePicker.selectedRowInComponent(0))!
        newNeedle.length = Double(needleLengthInput.text!)
        print("\(newNeedle.size!), \(newNeedle.type!)")
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NeedleType.count.hashValue
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NeedleType(rawValue: row)?.description
    }
    
    func saveNeedleData() {
        let addedNeedle = PFObject(className:"AddedNeedle")
        addedNeedle["size"] = newNeedle.size
        //addedNeedle["type"] = newNeedle.type as! PFObject
        addedNeedle["length"] = newNeedle.length
        addedNeedle.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("The needle has been saved")
            } else {
                print("There was a problem with the needle")
            }
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let vc = segue.destinationViewController as! NeedleViewController
    
        
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }

//let needleSize = addedNeedle["size"] as Double
////let playerName = gameScore["playerName"] as String
//let needleLength = addedNeedle["length"] as Double
