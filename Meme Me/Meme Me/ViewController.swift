//
//  ViewController.swift
//  Meme Me
//
//  Created by Josh on 3/7/16.
//  Copyright © 2016 Foomon Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var pickedImageView: UIImageView!
    
    @IBOutlet var shareButton: UIBarButtonItem!

    @IBOutlet var cameraButton: UIBarButtonItem!
    
    @IBOutlet var textField1: UITextField!
    
    @IBOutlet var textField2: UITextField!
    
    @IBOutlet var toolbar: UIToolbar!
    
    @IBOutlet var navbar: UIToolbar!
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -2.5
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //textfield1
        textField1.text = "TOP"
        textField1.defaultTextAttributes = memeTextAttributes
        textField1.textAlignment = NSTextAlignment.Center
        self.textField1.delegate = self
       
//        //textfield2
        textField2.text = "BOTTOM"
        textField2.defaultTextAttributes = memeTextAttributes
        textField2.textAlignment = NSTextAlignment.Center
        self.textField2.delegate = self
        
        shareButton.enabled = false

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    //////////////////////////
    //Image Picker Functions//
    //////////////////////////
    
    @IBAction func pickImageFromCamera(sender: UIBarButtonItem) {
        
        pickImage(UIImagePickerControllerSourceType.Camera)
    }

    
    @IBAction func pickImageFromAlbum(sender: UIBarButtonItem) {
        
        pickImage(UIImagePickerControllerSourceType.PhotoLibrary)
    }
    
    func pickImage(sourceType:UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate =  self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            pickedImageView.image = image
            shareButton.enabled = true
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //////////////////////
    //keyboard functions//
    //////////////////////
    
    func keyboardWillShow(notification: NSNotification) {
        if textField2.isFirstResponder(){
            
            self.view.frame.origin.y -= getKeyboardHeight(notification)
            
        }
    
    }
    
    func keyboardWillHide(notification: NSNotification) {

        if textField2.isFirstResponder() {
            
            self.view.frame.origin.y += getKeyboardHeight(notification)
        }
       
    }

    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    
    func subscribeToKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:" , name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    ////////////////////////
    //text field functions//
    ////////////////////////
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string.uppercaseString)
        textField.text = String(newText)
        return false
    }
    
    /////////////////////////////////
    //meme, save, & share functions//
    /////////////////////////////////
    
    func generateMemedImage() -> UIImage
    {
        
        toolbar.hidden = true
        navbar.hidden = true
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
        
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        toolbar.hidden = false
        navbar.hidden = false
        
        return memedImage
    }
    
    
    func save() {
        let memedImage = generateMemedImage()
        let meme = Meme( topText: textField1.text!, btmText: textField2.text!, image:
            pickedImageView.image!, memedImage: memedImage)
    }
    
    @IBAction func share(sender: AnyObject) {
        
          let theMemedImage = generateMemedImage()

        
          let memedImage = generateMemedImage()
          let ActivityVC = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
          self.presentViewController(ActivityVC, animated: true, completion: nil)
          save()
        
    
    }
    
}

