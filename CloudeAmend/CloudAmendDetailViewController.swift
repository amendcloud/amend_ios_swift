//
//  CloudAmendDetailViewController.swift
//  CloudAmend
//
//  Created by admin on 28/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import Foundation


class CloudAmendDetailViewController: UIViewController ,UITextFieldDelegate ,UIActionSheetDelegate, JSImagePickerViewControllerDelegate, ImageneryDelegate{
    
    @IBOutlet weak var lbLabel1Outlet: UILabel!
    @IBOutlet weak var lbLabel2Outlet: UILabel!
    @IBOutlet weak var lbLabel3Outlet: UILabel!
    @IBOutlet weak var lbLabel4Outlet: UILabel!
    @IBOutlet weak var lbLabel5Outlet: UILabel!
    @IBOutlet weak var lbLabel6Outlet: UILabel!
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var textfield5: UITextField!
    @IBOutlet weak var textfield6: UITextField!
    

    @IBOutlet weak var ivResultImageView: UIImageView!
    
    @IBOutlet weak var btOutlet: UIButton!
    
    var rowValue : String = ""
    var fieldCount : Int = 0
    var fieldArray : NSArray = []
    var imageId : String = ""
    var convertedString : String = ""
    
    let baseUrl :String = "http://socialorm.cloudapp.net/amend.cloud/image/demo/"
    var colorArray : NSArray = []
    var colorIndex : Int = 0
    var styleArray : NSArray = []
    var styleIndex : Int = 0
    var button : UIButton = UIButton()
    var button2 : UIButton = UIButton()
    var sheetValue : Int = 0
    var textUrl : String = ""

override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    

    
    colorArray = ["WHITE","SILVER","GREY","BLACK","RED","MAROON","YELLOW","OLIVE","LIME","GREEN","AQUA","TEAL","BLUE","NAVY","FUCHSIA","PURPLE"]
    styleArray = ["normal","bold","italic","underline"]
    
    
    self.textfield1.delegate=self
    self.textfield2.delegate=self
    self.textfield3.delegate=self
    self.textfield4.delegate=self
    self.textfield5.delegate=self
    self.textfield6.delegate=self
    
    let defaults = UserDefaults.standard
    imageId = defaults.string(forKey: "imageId")!
//    imageId = "ayush23"
//
//    print("hahah",imageId)
    
    self.title = "CloudAmend"
    
    if(fieldCount==0){
        self.lbLabel1Outlet.isHidden = true
        self.lbLabel2Outlet.isHidden = true
        self.lbLabel3Outlet.isHidden = true
        self.lbLabel4Outlet.isHidden = true
        self.lbLabel5Outlet.isHidden = true
        self.lbLabel6Outlet.isHidden = true
        
        self.textfield1.isHidden = true
        self.textfield2.isHidden = true
        self.textfield3.isHidden = true
        self.textfield4.isHidden = true
        self.textfield5.isHidden = true
        self.textfield6.isHidden = true
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 100, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
        
    }
    else if(fieldCount == 1)
    {

        self.lbLabel1Outlet.text = fieldArray[0] as? String
       
            
        self.lbLabel2Outlet.isHidden = true
        self.lbLabel3Outlet.isHidden = true
        self.lbLabel4Outlet.isHidden = true
        self.lbLabel5Outlet.isHidden = true
        self.lbLabel6Outlet.isHidden = true
        
        self.textfield2.isHidden = true
        self.textfield3.isHidden = true
        self.textfield4.isHidden = true
        self.textfield5.isHidden = true
        self.textfield6.isHidden = true
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 140, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
        
    }
    else if(fieldCount == 2)
    {
        self.lbLabel1Outlet.text = fieldArray[0] as? String
        self.lbLabel2Outlet.text = fieldArray[1] as? String

        
        self.lbLabel3Outlet.isHidden = true
        self.lbLabel4Outlet.isHidden = true
        self.lbLabel5Outlet.isHidden = true
        self.lbLabel6Outlet.isHidden = true
        
        
        self.textfield3.isHidden = true
        self.textfield4.isHidden = true
        self.textfield5.isHidden = true
        self.textfield6.isHidden = true
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 180, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
    }
    else if(fieldCount == 3)
    {
        self.lbLabel1Outlet.text = fieldArray[0] as? String
        self.lbLabel2Outlet.text = fieldArray[1] as? String
        self.lbLabel3Outlet.text = fieldArray[2] as? String
        
        self.lbLabel4Outlet.isHidden = true
        self.lbLabel5Outlet.isHidden = true
        self.lbLabel6Outlet.isHidden = true
        
        self.textfield4.isHidden = true
        self.textfield5.isHidden = true
        self.textfield6.isHidden = true
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 220, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
    }
    else if(fieldCount == 4)
    {
        
        self.lbLabel1Outlet.text = fieldArray[0] as? String
        self.lbLabel2Outlet.text = fieldArray[1] as? String
        self.lbLabel3Outlet.text = fieldArray[2] as? String
        self.lbLabel4Outlet.text = fieldArray[3] as? String
        
        self.lbLabel5Outlet.isHidden = true
        self.lbLabel6Outlet.isHidden = true
        
        self.textfield5.isHidden = true
        self.textfield6.isHidden = true
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 260, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
    }
    else if(fieldCount == 5)
    {
        self.lbLabel1Outlet.text = fieldArray[0] as? String
        self.lbLabel2Outlet.text = fieldArray[1] as? String
        self.lbLabel3Outlet.text = fieldArray[2] as? String
        self.lbLabel4Outlet.text = fieldArray[3] as? String
        self.lbLabel5Outlet.text = fieldArray[4] as? String
        
        self.lbLabel6Outlet.isHidden = true
        
       self.textfield6.isHidden = true
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 300, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
    }
    else{
        self.lbLabel1Outlet.text = fieldArray[0] as? String
        self.lbLabel2Outlet.text = fieldArray[1] as? String
        self.lbLabel3Outlet.text = fieldArray[2] as? String
        self.lbLabel4Outlet.text = fieldArray[3] as? String
        self.lbLabel5Outlet.text = fieldArray[4] as? String
        self.lbLabel6Outlet.text = fieldArray[5] as? String
        
        self.btOutlet.frame = CGRect(x: self.btOutlet.frame.origin.x , y: 340, width: self.btOutlet.frame.size.width, height: self.btOutlet.frame.size.height)
    }
    
    if(self.lbLabel1Outlet.text == "Colour")
    {
        self.textfield1.isHidden = true
        button = UIButton(frame: CGRect(x: 150, y: 75, width: UIScreen.main.bounds.size.width - 170, height: 30))
        button.backgroundColor = UIColor .white
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.setTitle("White", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.tag=1
        
        self.view.addSubview(button)
    }
    else if(rowValue == "Insert Text")
    {
        
         self.textfield1.keyboardType = UIKeyboardType.default
        
        self.textfield6.isHidden = true
        button = UIButton(frame: CGRect(x: 150, y: 265, width: UIScreen.main.bounds.size.width - 170 , height: 30))
        button.backgroundColor = UIColor .white
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.setTitle("White", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.tag=1
        
        
        self.textfield5.isHidden = true
        button2 = UIButton(frame: CGRect(x: 150, y: 225, width: UIScreen.main.bounds.size.width - 170, height: 30))
        button2.backgroundColor = UIColor .white
        button2.setTitleColor(UIColor.black, for: UIControlState.normal)
        button2.layer.cornerRadius = 5
        button2.setTitle("normal", for: .normal)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.tag=2
        
        
        self.view.addSubview(button)
        self.view.addSubview(button2)
    }
    else if(rowValue == "Flip X" || rowValue == "Flip Y" || rowValue == "Flip XY")
    {
        self.textfield1.isHidden = true
    }
    
    else if(rowValue == "Insert Image")
    {
//        self.textfield1.isHidden = true
//        button = UIButton(frame: CGRect(x: 160, y: 70, width: 140, height: 30))
//        button.backgroundColor = UIColor .gray
//        button.setTitle("Choose Image", for: .normal)
//        button.addTarget(self, action: #selector(allImages), for: .touchUpInside)
//        
//        self.view.addSubview(button)
        
        self.textfield1.keyboardType = UIKeyboardType.default
    }

}
    
    func allImages(sender: UIButton!){
        let actionSheetController: UIAlertController = UIAlertController(title: "Action Sheet", message: "Swiftly Now! Choose an option!", preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let fromDevice: UIAlertAction = UIAlertAction(title: "From Device", style: .default) { action -> Void in
            
//            self.hideImageView()
            let imagePicker = JSImagePickerViewController()
            
            imagePicker.delegate = self
            
            imagePicker.showImagePicker(in: self)
            
        }
        actionSheetController.addAction(fromDevice)
        
//        self.hideImageView()
        //Create and add a second option action
        let fromWeb: UIAlertAction = UIAlertAction(title: "From web", style: .default) { action -> Void in
            
            let alertController = UIAlertController(title: "Enter Image Url", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            let saveAction = UIAlertAction(title: "Get Image", style: UIAlertActionStyle.default, handler: {
                alert -> Void in
                
                let firstTextField = alertController.textFields![0] as UITextField
                //                let secondTextField = alertController.textFields![1] as UITextField
                
                self.textUrl = firstTextField.text! as String
                print("ddd",self.textUrl)
                
                //for getting imageUrl and set on image view
                
                let urlString = NSURL(string: self.textUrl as String)
                self.ivResultImageView.amendURL = urlString as! URL
                
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
        

        
        //Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)

    }
    
    
    func buttonAction(sender: UIButton!) {
        
        if(sender.tag == 1){
            sheetValue = 0
        
        let actionSheet = UIActionSheet(title: "Choose Colour", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        
        for value in colorArray{
            //add a button
            actionSheet.addButton(withTitle: value as! String)
        }
        
        actionSheet.show(in: self.view)
        }
            
        else{
            sheetValue = 1
            let actionSheet = UIActionSheet(title: "Choose Style", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
            
            for value in styleArray{
                //add a button
                actionSheet.addButton(withTitle: value as! String)
            }
            
            actionSheet.show(in: self.view)
        }
    }
    
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        
        if(sheetValue == 0){
        print("\(buttonIndex)")
        if(buttonIndex == 0)
        {
            
        }
        else{
            colorIndex = buttonIndex-1
            button.setTitle(colorArray[colorIndex] as! String, for: .normal)
        }
            
        }else if(sheetValue == 1)
        {
            
            if(buttonIndex == 0)
            {
                
            }
            else{
                styleIndex = buttonIndex-1
                button2.setTitle(styleArray[styleIndex] as! String, for: .normal)
            }
            
        }
        
    
            
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
    
    @IBAction func btGenerateAction(_ sender: AnyObject) {
        

        
        self.textfield1.resignFirstResponder()
        self.textfield2.resignFirstResponder()
        self.textfield3.resignFirstResponder()
        self.textfield4.resignFirstResponder()
        self.textfield5.resignFirstResponder()
        self.textfield6.resignFirstResponder()
        
        let amend = Amend()
        let amendOption = AmendOption()
        
        if(fieldCount==0){
            if(rowValue == "Invert")
            {
                amendOption.invert()
            }
            else if(rowValue == "For circle")
            {
                amendOption.cropMax()
            }
            else if(rowValue == "Grayscale")
            {
                amendOption.grayScale()
            }
            else if(rowValue == "Flip X")
            {
                amendOption.flip(value: UIFlipState.FLIP_X)
            }
            else if(rowValue == "Flip Y")
            {
                amendOption.flip(value: UIFlipState.FLIP_Y)
            }
            else if(rowValue == "Flip XY")
            {
                amendOption.flip(value: UIFlipState.FLIP_XY)
            }
        }
        
        else if(fieldCount==1){
            if(self.lbLabel1Outlet.text == "Colour")
            {
                amendOption.transform(Height: 200, Width: 200, Fit: UIFitState.FIT_INSIDE, BackGroundColour: UICOLORLIST(rawValue: Int(colorIndex)))
            }

            else if(self.textfield1.text == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please fill the values.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
            
            if (self.lbLabel1Outlet.text == "Width")
            {
               
                let widthInt : Int = Int(self.textfield1.text! as String)!
                
                amendOption.transformWidth(Width: widthInt as Int)
                
                
                let rect = CGRect(x: self.ivResultImageView.frame.origin.x , y: self.ivResultImageView.frame.origin.y, width: CGFloat(widthInt), height: self.ivResultImageView.frame.size.height)
                self.ivResultImageView.contentMode = .left
                self.ivResultImageView.frame = rect
                
            }
            
            else if(self.lbLabel1Outlet.text == "Height")
            {
                let heightInt : Int = Int(self.textfield1.text! as String)!
                
                amendOption.transformHeight(Height: Int(self.textfield1.text!)!)
                
                let rect = CGRect(x: self.ivResultImageView.frame.origin.x , y: self.ivResultImageView.frame.origin.y, width: self.ivResultImageView.frame.size.width, height: CGFloat(heightInt))
                self.ivResultImageView.contentMode = .top
                self.ivResultImageView.frame = rect
                
            }
            
            else if(self.lbLabel1Outlet.text == "Rotate")
            {
                amendOption.rotate(value: Int(self.textfield1.text!)!)
            }
            else if(self.lbLabel1Outlet.text == "Quality")
            {
                amendOption.quality(value: Int(self.textfield1.text!)!)
            }
            else if(self.lbLabel1Outlet.text == "Brightness")
            {
                amendOption.brightness(value: Int(self.textfield1.text!)!)
            }
            else if(self.lbLabel1Outlet.text == "Contrast")
            {
                amendOption.contrast(value: Int(self.textfield1.text!)!)
            }
            
            else if(self.lbLabel1Outlet.text == "Radius")
            {
                amendOption.crop(value: Int(self.textfield1.text!)!)
            }
                
              else  if(rowValue == "Insert Image")
                {
                    
                    
                    amendOption.insertImage(ImageUrl: self.textfield1.text! as NSString)
                    
                }


            }
        }
        else if(fieldCount==2){
            if(self.textfield1.text == "" || self.textfield2.text == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please fill the values.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                
            if(rowValue == "Set image size - Width & Height")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!)
            }
            else if(rowValue == "Fit Image - Fit XY")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_XY)
            }
            else if(rowValue == "Fit Image - Fit Width")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_WIDTH)
            }
            else if(rowValue == "Fit Image - Fit Height")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_HEIGHT)
            }
            else if(rowValue == "Fit Image - Fit Fill")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_FILL)
            }
            else if(rowValue == "Fit Image - Fit Inside")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_INSIDE)
            }
            else if(rowValue == "Fit Image - Fit Inside")
            {
                amendOption.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_INSIDE)
            }
            else if(rowValue == "Align Image - Align Left")
            {
                amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_LEFT)
            }
            else if(rowValue == "Align Image - Align Right")
            {
                amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_RIGHT)
            }
            else if(rowValue == "Align Image - Align Center")
            {
                amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_CENTER)
            }
            else if(rowValue == "Align Image - Align Top")
            {
                amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_WIDTH_andAlign: UIAlignWidthState.W_ALIGN_TOP)
            }
            else if(rowValue == "Align Image - Align Bottom")
            {
               amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_WIDTH_andAlign: UIAlignWidthState.W_ALIGN_BOTTOM)
            }
            else if(rowValue == "Brightness & Contrast")
            {
                amendOption.BrightnessAndContrast(Brightness: Int(self.textfield1.text!)!, Contrast: Int(self.textfield2.text!)!)
            }
            else if(rowValue == "Fit Face")
            {
                amendOption.transformFitFace(Height: Int(self.textfield1.text!)!, Width: Int(self.textfield2.text!)!)
                }
            }
        }
        else if(fieldCount==3){
            if( self.textfield2.text == "" || self.textfield3.text == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please fill the values.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                
            if(rowValue == "Insert Image")
            {
                
                
                amendOption.insertImage(ImageUrl: self.textfield1.text! as NSString, OriginX: Int(self.textfield2.text!)!, OriginY: Int(self.textfield3.text!)!)
                
            }
            }
        }
        else if(fieldCount==4){
            if(self.textfield1.text == "" || self.textfield2.text == "" || self.textfield3.text == "" || self.textfield4.text == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please fill the values.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{

            if(rowValue == "Origin")
            {
                amendOption.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield2.text!)!, OriginX: Int(self.textfield3.text!)!, OriginY: Int(self.textfield4.text!)!)
            }
            }
        }
        else if(fieldCount==6){
            if(self.textfield1.text == "" || self.textfield2.text == "" || self.textfield3.text == "" || self.textfield4.text == "")
            {
                let alert = UIAlertController(title: "Alert", message: "Please fill the values.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{

            if(rowValue == "Insert Text")
            {
                amendOption.insertText(InsertText: self.textfield1.text! as NSString, OriginX: Int(self.textfield2.text!)!, OriginY: Int(self.textfield3.text!)!, Size: Int(self.textfield4.text!)!, Style: UIFONTSTYLE(rawValue: Int(styleIndex)), Color: UICOLORLIST(rawValue: Int(colorIndex)))
            }
            }
        }
        
        let defaults = UserDefaults.standard
        let urlStatus = defaults.integer(forKey: "imageUrlStatus")
        let imageUrl = defaults.string(forKey: "imageUrl")
     
        
        
        if(rowValue == "Default Image")
        {
            if(urlStatus == 1){
                
                 amend.getImage(ImageId: imageId as NSString, ImageView: self.ivResultImageView)
            }
            else{
                amend.getImage(ImageId: imageId as NSString, ImageView: self.ivResultImageView)
          }
        }else{
            if(urlStatus == 1){
                
                amend.getImage(ImageId: imageId as NSString, ImageView: self.ivResultImageView , Option : amendOption )
            }
            else{
                amend.getImage(ImageId: imageId as NSString, ImageView: self.ivResultImageView , Option : amendOption)
            }
        }
    }
    
    func didReceiveData(ImageId : NSString,RequestCode : Int)
    {
//        if(RequestCode==1){
//    
//            
//            print("hello",ImageId)
//            let tactLab = Amend()
//            
//    
//            
////            print("lllll",tactLab.allValue)
//            let urlString = NSURL(string: tactLab.allValue as String)
//            self.ivResultImageView.imageneryURL = urlString as URL!
//        }
        
    }
    func didfailedWithError(errorMessage : NSString,RequestCode : Int)
    {
        
//        let alert = UIAlertController(title: "Alert", message: "Unable to upload!", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
        print(errorMessage)
    }

    
    @available(iOS 2.0, *)
    public func imagePicker(_ imagePicker: JSImagePickerViewController!, didSelect image: UIImage!) {
        self.ivResultImageView.image = image
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
