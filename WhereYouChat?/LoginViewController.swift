//
//  LoginViewController.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/16/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let permissions = ["public_profile"]
        //PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions: [AnyObject]?)
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions, block: {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                } else {
                    println("User logged in through Facebook!")
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(emailLabel.text, password:passwordLabel.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
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
        //user["location"] = CLLocation()
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                let alert = UIAlertView(title: "Error", message: errorString! as String, delegate: nil, cancelButtonTitle: "Ok")
                alert.show()
                
            } else {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
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
