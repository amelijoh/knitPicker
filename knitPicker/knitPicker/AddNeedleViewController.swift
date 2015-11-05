//
//  AddNeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class AddNeedleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let newNeedle = Needle(size: 10.0, type: NeedleType.Circular, length: 30.0)
    let newNType = NeedleType.Circular

    
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
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func addNeedleButtonPressed(sender: UIButton) {
//    addNeedle()
    
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NeedleType.count.hashValue
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return NeedleType(rawValue: row)?.description;
    }

}
