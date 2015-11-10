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
        sortNeedlePincushion()
        cell.textLabel?.text = "Size: " + String(needleSize)
        cell.detailTextLabel?.text = String(needlePincushion[indexPath.row].type!) + " Needles"
        return cell
    }
    
    func sortNeedlePincushion() {
        if needlePincushion.isEmpty {
            print("needle pincushion is empty!")
        }
        else {
            needlePincushion.sortInPlace({$0.size < $1.size})
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
    query.findObjectsInBackgroundWithBlock{
        (objects: [PFObject]?, error: NSError?) -> Void in
        if error == nil {
            print("Successfully retrieved \(objects!.count) needles.")
            if let savedNeedles = objects as [PFObject]! {
                    for object in savedNeedles {
                    let needleSize = object["size"]
                    let needleLength = object["length"]
                    print("\(needleSize) + \(needleLength)")
                    }
                }
        } else {
            print("Error: \(error!) \(error!.userInfo)")
            }
        }

    }

}


//let needleSize = addedNeedle["size"] as Double
////let playerName = gameScore["playerName"] as String
//let needleLength = addedNeedle["length"] as Double


