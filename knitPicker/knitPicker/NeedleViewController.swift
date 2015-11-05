//
//  NeedleViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class NeedleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        needlesCheck()
        
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
    
    var needles = [Double]()
    
    let needleTableIdentifier = "NeedleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return needles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(needleTableIdentifier) as UITableViewCell!
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: needleTableIdentifier)
        }
        cell.textLabel?.text = String(needles[indexPath.row])
        needlesCheck()
        print(needles.count)
        needlesCheck()
        return cell
    }
    
    func needlesCheck() {
        if needles.isEmpty {
            print("Array is empty")
        }
        else {
            needles.sortInPlace()
            print("needles sorted")
        }
    }

}
