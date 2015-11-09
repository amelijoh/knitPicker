//
//  NeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit
import Parse

class NeedleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var needleTableView: UITableView!
    
    var needlePincushion = [Needle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveSavedNeedle()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.needleTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let needleTableIdentifier = "NeedleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return needlePincushion.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        retrieveSavedNeedle()
        var cell = tableView.dequeueReusableCellWithIdentifier(needleTableIdentifier) as UITableViewCell!
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: needleTableIdentifier)
        }
        cell.textLabel?.text = "Size: " + String(needlePincushion[indexPath.row].size!)
        cell.detailTextLabel?.text = String(needlePincushion[indexPath.row].type!) + " Needles"
        sortNeedlePincushion()
        return cell
    }
    
    func sortNeedlePincushion() {
        if needlePincushion.isEmpty {
            print("needle pincushion is empty!")
        }
        else {
            //needlePincushion.sort()
            print("you have needles!")
        }
    }
    
    
    @IBAction func unwindToNeedleVC(segue:UIStoryboardSegue) {
                if (segue.sourceViewController .isKindOfClass(AddNeedleViewController))
                {
                    let sourceVC = segue.sourceViewController as! AddNeedleViewController
                    needlePincushion.append(sourceVC.newNeedle)
                    print(needlePincushion.count)
                }
        
            }

func retrieveSavedNeedle() {
    var query = PFQuery(className:"AddedNeedle")
    query.getObjectInBackgroundWithId("LYBnqhcryG") {
        (addedNeedle: PFObject?, error: NSError?) -> Void in
        if error == nil && addedNeedle != nil {
            print("Size: \(addedNeedle!["size"])", "Length: \(addedNeedle!["length"]) inches")
        } else {
            print(error)
        }
    }
}

}













