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
    
    
    var needlePincushion: NSMutableArray = NSMutableArray()
    
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
        cell.textLabel?.text = "Size: " + needlePincushion[indexPath.row].description
        print(needlePincushion.description)
            //"Size: " + String(needlePincushion[indexPath.row].needleSize)
        //cell.detailTextLabel?.text = String(needlePincushion[indexPath.row].needleLength) + " Needles"
        return cell
    }
    
    @IBAction func unwindToNeedleVC(segue:UIStoryboardSegue) {
                if (segue.sourceViewController .isKindOfClass(AddNeedleViewController))
                {
                    let sourceVC = segue.sourceViewController as! AddNeedleViewController
                    print(needlePincushion.count)
                }
        
            }

//pull saved object from Parse, parse data
    
func retrieveSavedNeedle() {
    
    PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
    var query: PFQuery = PFQuery(className:"AddedNeedle")
    query.findObjectsInBackgroundWithBlock{
        (objects, error) -> Void in
        if error == nil {
            
            let temp: NSArray = objects! as NSArray
            self.needlePincushion = temp.mutableCopy() as! NSMutableArray
            
            //PFObject.pinAllInBackground(objects, block: nil)

            if let savedNeedles = objects as [PFObject]! {
                    for object in savedNeedles {
                    var needleSize = object["size"]
                    //needleSizes
                    let needleLength = object["length"]
                    //print("Size: \(needleSize) + \(needleLength) inches")
                
                }

            }
            
        } else {
            print("Error: \(error!) \(error!.userInfo)")
            }
        
        }

    //print(self.needlePincushion.count)

    }

}

//                    needlePincushion.append(sourceVC.newNeedle)

//    func sortNeedlePincushion() {
//        if needlePincushion.isEmpty {
//            print("needle pincushion is empty!")
//        }
//        else {
//            needlePincushion.sortInPlace({$0.size < $1.size})
//            print("you have needles!")
//        }
//    }

