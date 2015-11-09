//
//  AddYarnViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/9/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class AddYarnViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let newSkein = Yarn(brandName: "Malabrigo", yarnWeight: WeightType.Medium, lengthPerSkein: 0.0, numberOfSkeins: 0)
    
    @IBOutlet weak var yarnBrandInput: UITextField!
    @IBOutlet weak var numberOfSkeinsInput: UITextField!
    @IBOutlet weak var skeinInfoInput: UITextField!
    @IBOutlet weak var yarnWeightPicker: UIPickerView!
    
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WeightType.count.hashValue
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return WeightType(rawValue: row)?.description
    }

    @IBAction func addYarnButtonPressed(sender: UIButton) {
        addSkein()
    }
    
    func addSkein(){
        newSkein.brandName = yarnBrandInput.text!
        newSkein.yarnWeight = WeightType(rawValue: yarnWeightPicker.selectedRowInComponent(0))!
        newSkein.numberOfSkeins = Int(numberOfSkeinsInput.text!)
        newSkein.lengthPerSkein = Double(skeinInfoInput.text!)
        print("\(newSkein.brandName!), \(newSkein.yarnWeight!)")
    
}

}
