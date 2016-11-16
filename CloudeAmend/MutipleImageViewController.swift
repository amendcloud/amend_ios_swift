//
//  MutipleImageViewController.swift
//  CloudAmend
//
//  Created by admin on 26/10/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import UIKit

class MutipleImageViewController: UIViewController ,ImageneryDelegate {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    var imageId = [] as NSMutableArray
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btGenerateAction(_ sender: AnyObject) {
        self.showLoader()
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let myDict = NSDictionary(contentsOfFile: path!)
        
        let accessKey = myDict?.value(forKey: "AccessKey") as! String?
        let accessSecret = myDict?.value(forKey: "AccessSecret") as! String?
        
        
        let amendObj1 = Amend()
        amendObj1.initWithDelegate(Delegate: self, Image: self.imageView1.image!, RequestCode: 1)
        amendObj1.upload()
       
        let amendObj2 = Amend()
        amendObj2.initWithDelegate(Delegate: self, Image: self.imageView2.image!, RequestCode: 2 )
        amendObj2.upload()
        
        let amendObj3 = Amend()
        amendObj3.initWithDelegate(Delegate: self, Image: self.imageView3.image!, RequestCode: 3 )
        amendObj3.upload()
        
        let amendObj4 = Amend()
        amendObj4.initWithDelegate(Delegate: self, Image: self.imageView4.image!, RequestCode: 4 )
        amendObj4.upload()
    }

    
    func didReceiveData(ImageId : NSString,RequestCode : Int)
    {
        if(RequestCode==1){
            
            imageId.add(ImageId)
            
            let tactLab = AmendOption()

            tactLab.invert()
            let amendObj1 = Amend()
            amendObj1.getImage(ImageId: ImageId as NSString, ImageView: self.imageView1 , Option : tactLab )
            
            
            
            
            
//            self.imageView1.imageneryURL = urlString as URL!
            
//            let amendObj = Amend()
//            amendObj.initWithDelegate(Delegate: self, Image: self.imageView2.image!, RequestCode: 2)
//            amendObj.executeWithBase64()

        }
        else if(RequestCode==2){
            imageId.add(ImageId)
            

            
            let tactLab = AmendOption()
            
            tactLab.invert()
            let amendObj2 = Amend()
            amendObj2.getImage(ImageId: ImageId as NSString, ImageView: self.imageView2 , Option : tactLab )
            
            
        }
        else if(RequestCode==3){
            imageId.add(ImageId)
            
            
            
            let tactLab = AmendOption()
            
            tactLab.invert()
            let amendObj3 = Amend()
            amendObj3.getImage(ImageId: ImageId as NSString, ImageView: self.imageView3 , Option : tactLab )
            
          
        }
        else if(RequestCode==4){
            imageId.add(ImageId)
            
            
            let tactLab = AmendOption()
            
            tactLab.invert()
            let amendObj4 = Amend()
            amendObj4.getImage(ImageId: ImageId as NSString, ImageView: self.imageView4 , Option : tactLab )
            
            
             self.hideLoader()

        }
        print("hey",imageId)
       
        
    }
    func didfailedWithError(errorMessage : NSString,RequestCode : Int)
    {
        
        let alert = UIAlertController(title: "Alert", message: "Unable to upload!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        print(errorMessage)
        self.hideLoader()
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
