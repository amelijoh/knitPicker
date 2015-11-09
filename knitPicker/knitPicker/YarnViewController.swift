//
//  YarnViewController.swift
//  knitPicker
//
//  Created by Amelia Johnston on 11/4/15.
//  Copyright © 2015 Amelia. All rights reserved.
//

import UIKit

class YarnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var yarnTableView: UITableView!
    
    var yarnStash = [Yarn]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        cell.detailTextLabel?.text = String(yarnStash[indexPath.row].yarnWeight!)
        return cell
    }
    
    @IBAction func unwindToYarnVC(segue:UIStoryboardSegue) {
        if (segue.sourceViewController .isKindOfClass(AddYarnViewController))
        {
            let sourceVC = segue.sourceViewController as! AddYarnViewController
            yarnStash.append(sourceVC.newSkein)
            print(yarnStash.count)
            
        }
        
    }
    

   }

