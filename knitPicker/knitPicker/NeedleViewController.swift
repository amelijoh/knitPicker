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
        reloadTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let needleTableIdentifier = "NeedleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return needlePincushion.count
    }
    
    //cell appearance and text
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(needleTableIdentifier) as UITableViewCell!
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: needleTableIdentifier)
        }
        cell.backgroundColor = UIColor(colorLiteralRed: 114/255.0, green: 205/255.0, blue: 178/255.0, alpha: 1.0)
        cell.textLabel?.text = "Size: " + String(needlePincushion[indexPath.row].needleSize!)
        cell.detailTextLabel?.text = (String(needlePincushion[indexPath.row].needleType!) + " Needles")
        sortNeedlePincushion()
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
            needlePincushion.removeAtIndex(indexPath.row)
            reloadTableView()
        }
    }

    // pass new Needle object from AddNeedleViewController
    
    @IBAction func unwindToNeedleVC(segue:UIStoryboardSegue) {
                if (segue.sourceViewController .isKindOfClass(AddNeedleViewController))
                {
                    let sourceVC = segue.sourceViewController as! AddNeedleViewController
                    needlePincushion.append(sourceVC.newNeedle)
                    print(needlePincushion.count)
                }
        
            }
    
    //organize needles by needle size
    
    func sortNeedlePincushion() {
        if needlePincushion.isEmpty {
            print("needle pincushion is empty!")
        }
        else {
            needlePincushion.sortInPlace({$0.needleSize < $1.needleSize})
        }
    }
    
    func reloadTableView() {
        sortNeedlePincushion()
        self.needleTableView.reloadData()
    }

//retrieve saved object from Parse, parse object as Needle object
    
    func retrieveSavedNeedle() {
        needlePincushion.removeAll()
        PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
        let query: PFQuery = PFQuery(className:"AddedNeedle")
        query.findObjectsInBackgroundWithBlock{
        (objects, error) -> Void in
        if error == nil {
            
            if let savedNeedles = objects as [PFObject]! {
                for object in savedNeedles {
                    let needleSize = object["size"] as! Double
                    let needleType = object["type"] as! String
                    let needleLength = object["length"] as! Double
                    let needleObjectID = object.objectId! as! String
                    let needle = Needle(needleSize: needleSize, needleType: needleType, needleLength: needleLength, needleParseID: needleObjectID)
                    self.needlePincushion.append(needle)
                    print("Size: \(needleSize) + \(needleLength) inches")
                }
                self.reloadTableView()

                print("****************************************")
                print("The needle count is \(self.needlePincushion.count)")
            }
        } else {
            print("Error: \(error!) \(error!.userInfo)")
            }
        
        }

    }

}


