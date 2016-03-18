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

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func pauseApp(sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,  0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
      //  UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
    }
    
    @IBAction func restoreApp(sender: AnyObject) {
        
        activityIndicator.stopAnimating()
       // UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        
    }
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("Image Selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        importedImage.image = image
    }
    
    
    @IBAction func `import`(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        
        if #available(iOS 8.0, *) {
            var alert = UIAlertController(title: "Hey there!", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
            // Fallback on earlier versions
        }
        
           }
    
    
    @IBOutlet var importedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //to send data to heroku
    /*    let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success, error) -> Void in
            print("Object has been saved.")
        }
        
        var product = PFObject(className: "Products")

        product["name"] = "Ice Cream"
        
        product["description"] = "Strawberry"
        
        product["price"] = 4.99
        
        product.saveInBackgroundWithBlock { (success, error) -> Void in
            
            if success == true {
                print("Successful. Object saved with ID \(product.objectId)")
            }else{
                print("Failed")
                print(error)
            }
        }
*/
        
        //to receive data from heroku
        
     /*   var query = PFQuery(className: "Products")
        
        query.getObjectInBackgroundWithId("Isagaww2q2") { (object: PFObject?, error: NSError?) -> Void in
            
            if error != nil {
                print(error)
            }else if let product = object {
                //print(object) //<-------------------to get name, description, and price of ice cream use this
                
                //to get a specific value in ice cream do this
               // print(object!.objectForKey("description"))
                
                
                product["description"] = "Rocky Road"
                
                product["price"] = 5.99

                product.saveInBackground()
                
                
                
                
            }
        } */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
