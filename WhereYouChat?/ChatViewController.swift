//
//  ChatViewController.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/16/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messageField: UITextField!
    var messages: [String]?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sendMessage(sender: AnyObject) {
        var message = PFObject(className:"Message")
        message["text"] = messageField.text
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                println("Message saved!")
            } else {
                println("Doh!!")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        //TODO: Change this is to [Message]
        messages = [String]()
    }
    
    func onTimer() {
        //TODO: Modify this function to populate Message object with Parse message data including profile image and location
        var query = PFQuery(className:"Message")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                self.messages?.removeAll(keepCapacity: true)
                if let objects = objects as? [PFObject] {
                    
                    for object in objects {
                        var message = object["text"] as! String
                        self.messages?.append(message)
                    }
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as! MessageCell
        
        cell.message = messages?[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let messages = messages {
            return messages.count
        } else {
            return 0
        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
