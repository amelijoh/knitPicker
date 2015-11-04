//
//  AddNeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class AddNeedleViewController: UIViewController {

    let newNeedle = Needle(size: <#T##Double#>, type: <#T##needleType#>, length: <#T##Double#>)
    
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
    
    
    
    
    func addNeedle() {
        
    }

}
