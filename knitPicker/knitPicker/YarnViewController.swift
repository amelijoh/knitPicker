//
//  YarnViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit
import Parse

class YarnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var yarnTableView: UITableView!
    
    var yarnStash = [Yarn]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveSavedSkein()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        reloadTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let yarnTableIdentifier = "YarnTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yarnStash.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(yarnTableIdentifier) as UITableViewCell!
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: yarnTableIdentifier)
        }
        cell.backgroundColor = UIColor(colorLiteralRed: 181/255.0, green: 168/255.0, blue: 215/255.0, alpha: 1.0)
        cell.textLabel?.text = yarnStash[indexPath.row].brandName!
        cell.detailTextLabel?.text = String(yarnStash[indexPath.row].yarnWeightType!)
        sortYarnStash()
        return cell
    }
    
    //editing tableview rows enabled
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    //delete selected row in tableview
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            yarnStash.removeAtIndex(indexPath.row)
            self.yarnTableView.reloadData()
        }
    }


    
    @IBAction func unwindToYarnVC(segue:UIStoryboardSegue) {
        if (segue.sourceViewController .isKindOfClass(AddYarnViewController))
        {
            let sourceVC = segue.sourceViewController as! AddYarnViewController
            yarnStash.append(sourceVC.newSkein)
            reloadTableView()
            print(yarnStash.count)
            
        }
        
    }
    
    func sortYarnStash() {
        if yarnStash.isEmpty {
            print("needle pincushion is empty!")
        }
        else {
            yarnStash.sortInPlace({$0.brandName < $1.brandName})
        }
    }
    
    func reloadTableView() {
        sortYarnStash()
        self.yarnTableView.reloadData()
    }
    
    func retrieveSavedSkein() {
        yarnStash.removeAll()
        PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
        let query: PFQuery = PFQuery(className:"AddedYarn")
        query.findObjectsInBackgroundWithBlock{
            (objects, error) -> Void in
            if error == nil {
                
                //PFObject.pinAllInBackground(objects, block: nil)
                
                if let savedSkeins = objects as [PFObject]! {
                    
                    for object in savedSkeins {
                        let brandName = object["brandName"] as! String
                        let yarnWeightType = object["yarnWeight"] as! String
                        let skeinLength = object["skeinLength"] as! Double
                        let skeinNumber = object["skeinNumber"] as! Int
                        let skein = Yarn(brandName: brandName, yarnWeightType: yarnWeightType, lengthPerSkein: skeinLength, numberOfSkeins: skeinNumber)
                        self.yarnStash.append(skein)
                        print("Size: \(brandName) + \(yarnWeightType) weight")
                    }
                    self.reloadTableView()
                    
                    print("****************************************")
                    print("The skein count is \(self.yarnStash.count)")
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
            
        }
        
    }
    
}


