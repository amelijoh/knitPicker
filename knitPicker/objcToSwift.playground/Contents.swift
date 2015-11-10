//: Playground - noun: a place where people can play

import UIKit
import Parse

PFQuery *query = [PFQuery queryWithClassName:@"tempClass"];
[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
if (!error) {
// The find succeeded. The first 100 objects are available in objects
} else {
// Log details of the failure
NSLog(@"Error: %@ %@", error, [error userInfo]);
}
}];

var query = PFQuery(className:"AddedNeedle")
query.findObjectsInBackgroundWithBlock{
    (objects: [PFObject]?, error: NSError?) -> Void in
    
    if error == nil {
        print("Successfully retrieved \(objects!.count) needles.")
        if let objects = objects as? [PFObject] {
            for object in objects {
                print(object.objectId)
            }
        }
    } else {
        print("Error: \(error!) \(error!.userInfo!)")
    }
}

func saveNeedleData() {
    let addedNeedle = PFObject(className:"AddedNeedle")
    addedNeedle["size"] = newNeedle.size
    //addedNeedle["type"] = newNeedle.type as! PFObject
    addedNeedle["length"] = newNeedle.length
    addedNeedle.saveInBackgroundWithBlock {
        (success: Bool, error: NSError?) -> Void in
        if (success) {
            print("The needle has been saved")
        } else {
            print("There was a problem with the needle")
        }
    }
}


var query = PFQuery(className:"GameScore")
query.whereKey("playerName", equalTo:"Sean Plott")
query.findObjectsInBackgroundWithBlock {
    (objects: [PFObject]?, error: NSError?) -> Void in
    
    if error == nil {
        // The find succeeded.
        print("Successfully retrieved \(objects!.count) scores.")
        // Do something with the found objects
        if let objects = objects as? [PFObject] {
            for object in objects {
                print(object.objectId)
            }
        }
    } else {
        // Log details of the failure
        print("Error: \(error!) \(error!.userInfo!)")
    }
}


