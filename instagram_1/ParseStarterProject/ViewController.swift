/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupActive = true
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var mainButton: UIButton!
    
    
    @IBOutlet var registeredText: UILabel!
    
    @IBOutlet var loginButton: UIButton!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        
        
        if #available(iOS 8.0, *) {
            var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }

        
    }

    @IBAction func signUp(sender: AnyObject) {
        
        
        if username.text == "" || password.text == "" {
            
            displayAlert("Error in Form", message: "Please enter a username and password")
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            var errorMessage = "Please try again later"
            
            if signupActive == true {
                
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            

            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    self.performSegueWithIdentifier("login", sender: self)
                    
                }else {
                    //unsuccessful
                    if let errorString = error!.userInfo["error"] as? String {
                        
                        errorMessage = errorString
                    }
                    
                    self.displayAlert("Failed Login", message: errorMessage)
                }
            })
                
            } else {
                
                PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block:
                    { (user, error) -> Void in
                        
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        if user != nil {
                            
                            self.performSegueWithIdentifier("login", sender: self)
                            
                        }else {
                            
                            if let errorString = error!.userInfo["error"] as? String {
                                
                                errorMessage = errorString
                                
                                
                            }
                            
                            self.displayAlert("Failed Sign Up", message: errorMessage)

                            
                            
                        }
                    })
                }
            }
        }
        


    @IBAction func login(sender: AnyObject) {
        
        if signupActive == true {
            
            mainButton.setTitle("Log in", forState: UIControlState.Normal)
            registeredText.text = "Not Registered?"
            loginButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            signupActive = false
            
        } else {
            
            mainButton.setTitle("Sign Up", forState: UIControlState.Normal)
            registeredText.text = "Already Registered?"
            loginButton.setTitle("Log In", forState: UIControlState.Normal)
            
            signupActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success, error) -> Void in
//            print("Object has been saved.")
//        }

    }
    
    override func viewDidAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            
            self.performSegueWithIdentifier("login", sender: self)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
