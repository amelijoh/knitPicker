//
//  AddYarnViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/9/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit
import Parse

class AddYarnViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let newSkein = Yarn(brandName: "", yarnWeightType: "", lengthPerSkein: 0.0, numberOfSkeins: 0)
    
    private var tableView: UITableView?
    
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newSkein.yarnWeightArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return newSkein.yarnWeightArray[row]
    }

    @IBAction func addYarnButtonPressed(sender: UIButton) {
        addSkein()
        saveYarnData()
    }
    
    func addSkein(){
        newSkein.brandName = yarnBrandInput.text!
        let row = yarnWeightPicker.selectedRowInComponent(0)
        let selected = newSkein.yarnWeightArray[row]
        newSkein.yarnWeightType = newSkein.yarnWeightArray[row]
        newSkein.numberOfSkeins = Int(numberOfSkeinsInput.text!)
        newSkein.lengthPerSkein = Double(skeinInfoInput.text!)
        print("\(newSkein.brandName!), \(newSkein.yarnWeightType!)")
    
}
    func saveYarnData() {
        let addedYarn = PFObject(className:"AddedYarn")
        addedYarn["brandName"] = newSkein.brandName
        addedYarn["yarnWeight"] = newSkein.yarnWeightType
        addedYarn["skeinLength"] = newSkein.lengthPerSkein
        addedYarn["skeinNumber"] = newSkein.numberOfSkeins
        addedYarn.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("The yarn has been saved")
                self.tableView?.reloadData()
                
            } else {
                print("There was a problem with the yarn")
            }
        }
    }

    func configureWithTable(table: UITableView) {
        self.tableView = table
    }
}
