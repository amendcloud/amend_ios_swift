//
//  GlobalClass.swift
//  Imagetact
//
//  Created by admin on 22/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

protocol ImageneryDelegate
{
    func didReceiveData(ImageId : NSString,RequestCode : Int)
    func didfailedWithError(errorMessage : NSString,RequestCode : Int)
}
//
//struct UIFitState : OptionSet {
//    let rawValue: Int
//    static let FIT_XY  = UIFitState(rawValue: 0)
//    static let FIT_WIDTH = UIFitState(rawValue: 1 )
//    static let FIT_HEIGHT  = UIFitState(rawValue: 2)
//    static let FIT_FILL  = UIFitState(rawValue: 3)
//    static let FIT_INSIDE  = UIFitState(rawValue: 4)
//}
//
//struct UIAlignHeightState : OptionSet {
//    let rawValue: Int
//    static let H_ALIGN_LEFT  = UIAlignHeightState(rawValue: 0)
//    static let H_ALIGN_RIGHT = UIAlignHeightState(rawValue: 1 )
//    static let H_ALIGN_CENTER  = UIAlignHeightState(rawValue: 2)
//    
//}
//
//struct UIAlignWidthState : OptionSet {
//    let rawValue: Int
//    static let W_ALIGN_TOP  = UIAlignWidthState(rawValue: 0)
//    static let W_ALIGN_BOTTOM = UIAlignWidthState(rawValue: 1 )
//    static let W_ALIGN_CENTER  = UIAlignWidthState(rawValue: 2)
//}
//struct UIAlignInsideState : OptionSet {
//    let rawValue: Int
//    static let I__ALIGN_TOP  = UIAlignInsideState(rawValue: 0)
//    static let I_ALIGN_BOTTOM = UIAlignInsideState(rawValue: 1 )
//    static let I_ALIGN_LEFT  = UIAlignInsideState(rawValue: 2)
//    static let I_ALIGN_RIGHT  = UIAlignInsideState(rawValue: 3)
//    static let I_ALIGN_CENTER  = UIAlignInsideState(rawValue: 4)
//}
//
//
//
//struct UIFlipState : OptionSet {
//    let rawValue: Int
//    static let FLIP_X  = UIFlipState(rawValue: 0)
//    static let FLIP_Y = UIFlipState(rawValue: 1 )
//    static let FLIP_XY  = UIFlipState(rawValue: 2)
//}
//
//
//
//struct UIFONTSTYLE : OptionSet {
//    let rawValue: Int
//    static let NORMAL  = UIFONTSTYLE(rawValue: 0)
//    static let BOLD = UIFONTSTYLE(rawValue: 1 )
//    static let ITELIC  = UIFONTSTYLE(rawValue: 2)
//    static let UNDERLINE  = UIFONTSTYLE(rawValue: 3)
//}
//
//
//struct UICOLORLIST : OptionSet {
//    let rawValue: Int
//    static let WHITE  = UICOLORLIST(rawValue: 0)
//    static let SILVER = UICOLORLIST(rawValue: 1 )
//    static let GRAY  = UICOLORLIST(rawValue: 2)
//    static let BLACK  = UICOLORLIST(rawValue: 3)
//    static let RED  = UICOLORLIST(rawValue: 4)
//    static let MAROON = UICOLORLIST(rawValue: 5 )
//    static let YELLOW  = UICOLORLIST(rawValue: 6)
//    static let OLIVE  = UICOLORLIST(rawValue: 7)
//    static let LIME  = UICOLORLIST(rawValue: 8)
//    static let GREEN = UICOLORLIST(rawValue: 9 )
//    static let AQUA  = UICOLORLIST(rawValue: 10)
//    static let TEAL  = UICOLORLIST(rawValue: 11)
//    static let BLUE  = UICOLORLIST(rawValue: 12)
//    static let NAVY = UICOLORLIST(rawValue: 13 )
//    static let FUCHSIA  = UICOLORLIST(rawValue: 14)
//    static let PURPLE  = UICOLORLIST(rawValue: 15)
//}
//
//


class Amend: NSObject {
    
    
    var image :  UIImage?
    var delegate:ImageneryDelegate?
    var reqCode : Int = 0
    var imageData: NSString = ""
     var accessKey : String = ""
    var accessSecret : String = ""
    var ImageName : String = ""
    
    
    
    
    func  initWithDelegate(Delegate: AnyObject? , Image : UIImage? , RequestCode : Int ) -> AnyObject? {
        self.image = Image;
        self.delegate = Delegate as! ImageneryDelegate?;
        self.reqCode = RequestCode;
    
        
        
        return self
    }
    func upload() {
        if self.isConnectedToNetwork() == true {
            print("Internet connection OK")
            self.imageData = ConvertImageintoBase64(Image: self.image!)
            execute()
            
        } else {
            print("Internet connection FAILED")
            self.delegate?.didfailedWithError(errorMessage: "Internet connection Failed.", RequestCode: self.reqCode)
        }
    }
    
    func executeWithImageName(ImageName : String) {
        if self.isConnectedToNetwork() == true {
            print("Internet connection OK")
            self.imageData = ConvertImageintoBase64(Image: self.image!)
           
            self.ImageName = ImageName
            execute()
            
        } else {
            print("Internet connection FAILED")
            self.delegate?.didfailedWithError(errorMessage: "Internet connection Failed.", RequestCode: self.reqCode)
        }
    }
    func executeWithByteArray() {
    }
    func ConvertImageintoBase64(Image : UIImage) -> NSString {
        let imageData = UIImagePNGRepresentation(Image)
        let base64String = imageData?.base64EncodedString()
        return base64String! as NSString
    }
    
    
    func getAccountID() -> String {
        //        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        //        let dict = NSDictionary(contentsOfFile: path!)
        //        let amendID : String = dict!.object(forKey: "AmendID") as! String
        
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let myDict = NSDictionary(contentsOfFile: path) else {
                print("Please enter AmendID in info.Plist")               //                return nil
                return "Demo"
        }
        
        let amendDic = myDict.value(forKey: "Amend") as! NSDictionary?
        let amendName = amendDic?.value(forKey: "AmendName") as! String?
        
        return amendName!
    }
    
    
    func getAmendKey() -> String {

        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let myDict = NSDictionary(contentsOfFile: path) else {
                print("Please enter AmendID in info.Plist")               //                return nil
                return "Demo"
        }
        
        let amendDic = myDict.value(forKey: "Amend") as! NSDictionary?
        let AmendKey = amendDic?.value(forKey: "AmendKey") as! String?
        
        return AmendKey!
    }

    
    
    func getAmendSecret() -> String {

        
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let myDict = NSDictionary(contentsOfFile: path) else {
                print("Please enter AmendID in info.Plist")               //                return nil
                return "Demo"
        }
        
        let amendDic = myDict.value(forKey: "Amend") as! NSDictionary?
        let AmendSecret = amendDic?.value(forKey: "AmendSecret") as! String?
        
        return AmendSecret!
    }

    func execute(){
        
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "AccessKey": self.getAmendKey(),
            "AccessSecret": self.getAmendSecret(),
            ]
        
        
        var postData = Data()
            var parameterDictionary = [String: String]()
        if(self.ImageName.characters.count == 0 ){
          
            postData  = NSData(data: "{'ImageBase64': '\(self.imageData)' }".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!) as Data
        }else{
           
            

          postData  = NSData(data: "{'ImageBase64': '\(self.imageData)' , 'ImageName' : '\(self.ImageName as String)'}".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!) as Data
        }
        
 
        print(parameterDictionary)
        print(self.ImageName)
        let request = NSMutableURLRequest(url: URL(string: "http://amend.cloud/\(self.getAccountID())/upload")!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.async {
                do {
                    
                    if self.isConnectedToNetwork() == false {
                        print("Internet connection FAILED")
                        self.delegate?.didfailedWithError(errorMessage: "Internet connection Failed.", RequestCode: self.reqCode)
                        return
                    }
                    if(data == nil){
                        print("Internet connection FAILED")
                        self.delegate?.didfailedWithError(errorMessage: "Internet connection Failed.", RequestCode: self.reqCode)
                        return
                    }
                    
                    let object = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                    guard let JSONDictionary :NSDictionary = object as? NSDictionary else {
                        self.delegate?.didfailedWithError(errorMessage: "Something went Wrong.", RequestCode: self.reqCode)
                        return
                    }
                    if (error != nil) {
                        print(error)
                    } else {
                        
                        let httpResponse = response as? HTTPURLResponse
                        let statusCode : Int = (httpResponse?.statusCode)! as Int;
                        print(httpResponse)
                        if(statusCode == 200){
                            print("object..",object)
                            
                            let imageId = JSONDictionary["ImageName"]
                            self.delegate?.didReceiveData(ImageId: imageId as! NSString , RequestCode: self.reqCode)
                        }else{
                            self.delegate?.didfailedWithError(errorMessage: "Something went Wrong.", RequestCode: self.reqCode)
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
                catch let JSONError as NSError {
                    print("Error is \(JSONError)")
                    self.delegate?.didfailedWithError(errorMessage: "Something went Wrong.", RequestCode: self.reqCode)
                    
                }
                
            }
            
        })
        
        dataTask.resume()
        
        
    }
    

    
    
    func getImage(ImageId : NSString , ImageView : UIImageView )  {
        
        let accountName : NSString = self.getAccountID() as NSString
        
 
        
           let urlString = NSURL(string: String(format: "http://amend.cloud/%@/image/%@",accountName,ImageId) as String)
        
      
        ImageView.amendURL = urlString as URL!
    }
    
    func getImageByURL(Imageurl : NSString , ImageView : UIImageView )  {
        
        let accountName : NSString = self.getAccountID() as NSString
        
        
        let urlString = NSURL(string: String(format: "http://amend.cloud/%@/fetch/%@",accountName,Imageurl)  as String)
        
        
        ImageView.amendURL = urlString as URL!
        
        
        
        
        
    }
    
    
    func getImage(ImageId : NSString , ImageView : UIImageView , Option : AmendOption)  {
        
        let accountName : NSString = self.getAccountID() as NSString
        
  
        let urlString = NSURL(string: String(format: "http://amend.cloud/%@/image/%@/%@",accountName,Option.allValue,ImageId)  as String)
        
        
        ImageView.amendURL = urlString as URL!
        
    }
    
    func getImageByURL(Imageurl : NSString , ImageView : UIImageView , Option : AmendOption)  {
        
        let accountName : NSString = self.getAccountID() as NSString
        
        
//         String(format: "http://amend.cloud/%@/fetch/%@/%@",accountName,Option.allValue,Imageurl)
        
        let urlString = NSURL(string: String(format: "http://amend.cloud/%@/fetch/%@/%@",accountName,Option.allValue,Imageurl)  as String)
        
        
        ImageView.amendURL = urlString as URL!
//        return String(format: "http://amend.cloud/%@/fetch/%@/%@",accountName,Option.allValue,Imageurl) as NSString
        
        
    }

        func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    
}


