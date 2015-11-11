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
        cell.textLabel?.text = "Size: " + String(needlePincushion[indexPath.row].needleSize!)
        cell.detailTextLabel?.text = String(needlePincushion[indexPath.row].type!) + " Needles"
//        print(needlePincushion.description)
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
        let query: PFQuery = PFQuery(className:"AddedNeedle")
        query.findObjectsInBackgroundWithBlock{
        (objects, error) -> Void in
        if error == nil {
            
            //PFObject.pinAllInBackground(objects, block: nil)

            if let savedNeedles = objects as [PFObject]! {
                for object in savedNeedles {
                    let needleSize = object["size"] as! Double
                    //needleSizes
                    let needleLength = object["length"] as! Double
                    let needle = Needle(needleSize: needleSize, type: NeedleType.Circular, needleLength: needleLength)
                    self.needlePincushion.append(needle)
                    print("Size: \(needleSize) + \(needleLength) inches")
                }
                print("The needle count is \(self.needlePincushion.count)")
            }
        } else {
            print("Error: \(error!) \(error!.userInfo)")
        }
        
        }

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

