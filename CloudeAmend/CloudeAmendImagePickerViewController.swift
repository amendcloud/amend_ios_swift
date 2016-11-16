//
//  CloudeAmendImagePickerViewController.swift
//  CloudAmend
//
//  Created by admin on 27/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import UIKit

class CloudeAmendImagePickerViewController: UIViewController , JSImagePickerViewControllerDelegate ,UIGestureRecognizerDelegate ,UITextFieldDelegate , ImageneryDelegate , UIActionSheetDelegate{
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var defaultImagesView: UIView!

    @IBOutlet weak var imageNameOutlet: UITextField!
    
    var imageIndex : Int = 0
    var textUrl : String = ""
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CloudAmend"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.defaultImagesView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 127)
        
        self.imageNameOutlet.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: "imageUrl")
        defaults.set(0, forKey: "imageUrlStatus")
    }

    
    @IBAction func image_First_Action(_ sender: AnyObject) {
        
        
        imageIndex = 1
        setDefaulytImage()
        
    }
    
    @IBAction func image_Second_Action(_ sender: AnyObject) {
        
        imageIndex = 2
        setDefaulytImage()
    }
    
    
    @IBAction func image_Third_Action(_ sender: AnyObject) {
        imageIndex = 3
        setDefaulytImage()
        
    }
    
    
    func setDefaulytImage(){
        
        if(imageIndex == 1){
            self.imageViewOutlet.image = UIImage (named: "salman.jpg")
        }else if(imageIndex == 2){
            self.imageViewOutlet.image = UIImage (named: "maxresdefault.jpg")
        }else if(imageIndex == 3){
            self.imageViewOutlet.image = UIImage (named: "salman.jpg")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btGetImageAction(_ sender: AnyObject) {
        

        
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "Choose an option", preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let fromDevice: UIAlertAction = UIAlertAction(title: "From Device", style: .default) { action -> Void in
            
            self.hideImageView()
            let imagePicker = JSImagePickerViewController()
            
            imagePicker.delegate = self
            
            imagePicker.showImagePicker(in: self)

        }
        actionSheetController.addAction(fromDevice)
        
        self.hideImageView()
        //Create and add a second option action
        let fromWeb: UIAlertAction = UIAlertAction(title: "From web", style: .default) { action -> Void in
            
            let alertController = UIAlertController(title: "Enter Image Url", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            let saveAction = UIAlertAction(title: "Get Image", style: UIAlertActionStyle.default, handler: {
                alert -> Void in
                
                let firstTextField = alertController.textFields![0] as UITextField
                //                let secondTextField = alertController.textFields![1] as UITextField
                
                self.textUrl = firstTextField.text! as String
                print("ddd",self.textUrl)
                
                if(self.textUrl == ""){
                    let alert = UIAlertController(title: "Alert", message: "Please enter Url", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    
                    let defaults = UserDefaults.standard
                    defaults.set(self.textUrl, forKey: "imageUrl")
                    defaults.set(1, forKey: "imageUrlStatus")
                    
                   self.performSegue(withIdentifier: "uploadImage", sender: self)
                }
                
                //for getting imageUrl and set on image view
//                if let url = NSURL(string: self.textUrl) {
//                    if let data = NSData(contentsOf: url as URL) {
//                        
//                        self.imageViewOutlet.image = UIImage(data: data as Data)
//                    }
//                }
                
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
                (action : UIAlertAction!) -> Void in
                
            })
            
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter Image Url"
            }
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        actionSheetController.addAction(fromWeb)
        
        let fromDefault: UIAlertAction = UIAlertAction(title: "From Default", style: .default) { action -> Void in
          
            UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
                self.defaultImagesView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 127, width: UIScreen.main.bounds.width, height: 127)
                }, completion: nil)
        }
        actionSheetController.addAction(fromDefault)
        
        //Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
  
    

    func hideImageView(){
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations: {
            self.defaultImagesView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 127)
            }, completion: nil)

    }
    
    
    func compareImage(image1: UIImage, isEqualTo image2: UIImage) -> Bool {
        let data1: NSData = UIImagePNGRepresentation(image1)! as NSData
        let data2: NSData = UIImagePNGRepresentation(image2)! as NSData
        return data1.isEqual(data2)
    }
    
    
    @IBAction func btStartImageProcessingAction(_ sender: AnyObject) {
        
        
        if(self.compareImage(image1: imageViewOutlet.image! , isEqualTo: UIImage (named: "placeholderamend")!)){
            
            let alert = UIAlertController(title: "Alert", message: "Please choose image", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        self.showLoader()
            
                       
            
        let amendObj = Amend()
        amendObj.initWithDelegate(Delegate: self, Image: self.imageViewOutlet.image!, RequestCode: 1 )

//            amendObj.executeWithBase64(ImageName: "abhishek1234")
            amendObj.executeWithImageName(ImageName: self.imageNameOutlet.text!)
            

        
//        performSegue(withIdentifier: "uploadImage", sender: self)
        }
    }
    
    func didReceiveData(ImageId : NSString,RequestCode : Int)
    {
        if(RequestCode==1){
            
            let defaults = UserDefaults.standard
           defaults.set(ImageId, forKey: "imageId")
            
            self.hideLoader()
            performSegue(withIdentifier: "uploadImage", sender: self)
        }
    
    }
    func didfailedWithError(errorMessage : NSString,RequestCode : Int)
    {
        
        let alert = UIAlertController(title: "Alert", message: "Unable to upload!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        print(errorMessage)
        self.hideLoader()
    }
    
    
    @available(iOS 2.0, *)
    public func imagePicker(_ imagePicker: JSImagePickerViewController!, didSelect image: UIImage!) {
        self.imageViewOutlet.image = image
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    func showLoader(){
        let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true);
        
        spinnerActivity.label.text = "Loading";
        
        spinnerActivity.detailsLabel.text = "Please Wait!!";
        
        spinnerActivity.isUserInteractionEnabled = false;
    }
    
    func hideLoader(){
        MBProgressHUD.hideAllHUDs(for: self.view, animated: true);
    }

    
}
