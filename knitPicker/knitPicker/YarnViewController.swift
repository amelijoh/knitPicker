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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.yarnTableView.reloadData()
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
        cell.textLabel?.text = yarnStash[indexPath.row].brandName!
        cell.detailTextLabel?.text = String(yarnStash[indexPath.row].yarnWeightType!)
        
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
            var deletedNeedle = yarnStash.removeAtIndex(indexPath.row)
            // let query = PFQuery(className: "AddedNeedle")
            
            
            //            let query = PFQuery(className: "AddedNeedle")
            //            query.whereKey("columnName", equalTo: "abcd")
            //            query.findObjectsInBackgroundWithBlock {
            //                (objects: [AnyObject]?, error: NSError?) -> Void in
            //                for object in objects! {
            //                    object.deleteEventually()
            //                }
            //            }
            self.yarnTableView.reloadData()
        }
    }

    
    @IBAction func unwindToYarnVC(segue:UIStoryboardSegue) {
        if (segue.sourceViewController .isKindOfClass(AddYarnViewController))
        {
            let sourceVC = segue.sourceViewController as! AddYarnViewController
            yarnStash.append(sourceVC.newSkein)
            print(yarnStash.count)
            
        }
        
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
                    //self.yarnTableView.reloadData()
                    
                    for object in savedSkeins {
                        let brandName = object["brandName"] as! String
                        let yarnWeightType = object["yarnWeight"] as! String
                        let skeinLength = object["skeinLength"] as! Double
                        let skeinNumber = object["skeinNumber"] as! Int
                        let skein = Yarn(brandName: brandName, yarnWeightType: yarnWeightType, lengthPerSkein: skeinLength, numberOfSkeins: skeinNumber)
                        self.yarnStash.append(skein)
                        print("Size: \(brandName) + \(yarnWeightType) weight")
                    }
                    self.yarnTableView.reloadData()
                    
                    print("****************************************")
                    print("The skein count is \(self.yarnStash.count)")
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
            
        }
        
    }
    
}


