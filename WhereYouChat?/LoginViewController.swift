//
//  LoginViewController.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/16/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit
import CoreLocation

let currentUserKey = "kCurrentUser"

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(emailLabel.text, password: passwordLabel.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    //var data = NSJSONSerialization.dataWithJSONObject(user!, options: nil, error: nil)
                    //NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                    self.performSegueWithIdentifier("loginToMapSegue", sender: self)
                })
            } else {
                // The login failed. Check error to see why.
                let alert = UIAlertView(title: "Error", message: error?.description, delegate: nil, cancelButtonTitle: "Ok")
                alert.show()
            }
        }
        
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        var user = PFUser()
        user.username = emailLabel.text
        user.password = passwordLabel.text
        user.email = user.username
        // other fields can be set just like with PFObject
        //user["location"] = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        user["latitude"] = 0
        user["longitude"] = 0
        user["profileImageUrl"] = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTrpLMDviofj2H6qiq7ywujMLKJ_5pqCmPruNnmN1XczRh6OYxK7Q"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                let alert = UIAlertView(title: "Error", message: errorString! as String, delegate: nil, cancelButtonTitle: "Ok")
                alert.show()
                
            } else {                
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    //var data = NSJSONSerialization.dataWithJSONObject(user, options: nil, error: nil)
                    //NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                    self.performSegueWithIdentifier("loginToMapSegue", sender: self)
                })
            }
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
