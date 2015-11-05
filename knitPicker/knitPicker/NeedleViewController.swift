//
//  NeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class NeedleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var needleTableView: UITableView!
    
    var needlePincushion = [Needle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    let needleTableIdentifier = "NeedleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return needlePincushion.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(needleTableIdentifier) as UITableViewCell!
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: needleTableIdentifier)
        }
        cell.textLabel?.text = String(needlePincushion[indexPath.row].size)
        print(needlePincushion.count)
        return cell
    }
    
    
    @IBAction func unwindToNeedleVC(segue:UIStoryboardSegue) {
        if (segue.sourceViewController .isKindOfClass(AddNeedleViewController))
        {
            let sourceVC = segue.sourceViewController as! AddNeedleViewController
            self.needlePincushion = sourceVC.needlePincushion
            needleTableView.reloadData()
        }
    }

}
