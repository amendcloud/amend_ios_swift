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



struct UIFitState : OptionSet {
    let rawValue: Int
    static let FIT_XY  = UIFitState(rawValue: 0)
    static let FIT_WIDTH = UIFitState(rawValue: 1 )
    static let FIT_HEIGHT  = UIFitState(rawValue: 2)
    static let FIT_FILL  = UIFitState(rawValue: 3)
    static let FIT_INSIDE  = UIFitState(rawValue: 4)
}

struct UIAlignHeightState : OptionSet {
    let rawValue: Int
    static let H_ALIGN_LEFT  = UIAlignHeightState(rawValue: 0)
    static let H_ALIGN_RIGHT = UIAlignHeightState(rawValue: 1 )
    static let H_ALIGN_CENTER  = UIAlignHeightState(rawValue: 2)
    
}

struct UIAlignWidthState : OptionSet {
    let rawValue: Int
    static let W_ALIGN_TOP  = UIAlignWidthState(rawValue: 0)
    static let W_ALIGN_BOTTOM = UIAlignWidthState(rawValue: 1 )
    static let W_ALIGN_CENTER  = UIAlignWidthState(rawValue: 2)
}
struct UIAlignInsideState : OptionSet {
    let rawValue: Int
    static let I__ALIGN_TOP  = UIAlignInsideState(rawValue: 0)
    static let I_ALIGN_BOTTOM = UIAlignInsideState(rawValue: 1 )
    static let I_ALIGN_LEFT  = UIAlignInsideState(rawValue: 2)
    static let I_ALIGN_RIGHT  = UIAlignInsideState(rawValue: 3)
    static let I_ALIGN_CENTER  = UIAlignInsideState(rawValue: 4)
}



struct UIFlipState : OptionSet {
    let rawValue: Int
    static let FLIP_X  = UIFlipState(rawValue: 0)
    static let FLIP_Y = UIFlipState(rawValue: 1 )
    static let FLIP_XY  = UIFlipState(rawValue: 2)
}



struct UIFONTSTYLE : OptionSet {
    let rawValue: Int
    static let NORMAL  = UIFONTSTYLE(rawValue: 0)
    static let BOLD = UIFONTSTYLE(rawValue: 1 )
    static let ITELIC  = UIFONTSTYLE(rawValue: 2)
    static let UNDERLINE  = UIFONTSTYLE(rawValue: 3)
}


struct UICOLORLIST : OptionSet {
    let rawValue: Int
    static let WHITE  = UICOLORLIST(rawValue: 0)
    static let SILVER = UICOLORLIST(rawValue: 1 )
    static let GRAY  = UICOLORLIST(rawValue: 2)
    static let BLACK  = UICOLORLIST(rawValue: 3)
    static let RED  = UICOLORLIST(rawValue: 4)
    static let MAROON = UICOLORLIST(rawValue: 5 )
    static let YELLOW  = UICOLORLIST(rawValue: 6)
    static let OLIVE  = UICOLORLIST(rawValue: 7)
    static let LIME  = UICOLORLIST(rawValue: 8)
    static let GREEN = UICOLORLIST(rawValue: 9 )
    static let AQUA  = UICOLORLIST(rawValue: 10)
    static let TEAL  = UICOLORLIST(rawValue: 11)
    static let BLUE  = UICOLORLIST(rawValue: 12)
    static let NAVY = UICOLORLIST(rawValue: 13 )
    static let FUCHSIA  = UICOLORLIST(rawValue: 14)
    static let PURPLE  = UICOLORLIST(rawValue: 15)
}




class AmendOption: NSObject {
    
    var allValue : NSString = ""
    
    
    func getAccountID() -> String {
               guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
               let myDict = NSDictionary(contentsOfFile: path) else {
                print("Please enter AmendID in info.Plist")
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
    
    
    func getDefaultImage(imageID : NSString) -> NSString {
        let accountName : NSString = "demo"
        //        return String(format: "http://socialorm.cloudapp.net/ammend.cloud/image/%@/%@",accountName,imageID) as NSString
        return String(format: "http://socialorm.cloudapp.net/amend.cloud/image/%@/",accountName,imageID) as NSString
        
    }
    
    
    
    func transformWidth(Width : Int) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "w_%d", Width) as NSString)
        
        
        return self
    }
    
    
    func transformHeight(Height : Int) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "h_%d", Height) as NSString)
        
        return self
    }
    
    func transform(Width : Int ,Height : Int) -> AnyObject {
        
        
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d",Width,Height) as NSString)
        
        return self
    }
    
    
    
    
    
    func transform(Width : Int , Height : Int , Fit : UIFitState) -> AnyObject {
        
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,%@",Width,Height,getUIFitState(FITType: Fit.rawValue)) as NSString)
        
        return self
    }
    
    
    
    func transform(Height : Int ,Width : Int , Align : UIAlignInsideState) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,%@",Width,Height,getUIalighmentInsideStyle(Align: Align.rawValue)) as NSString)
        
        
        
        return self
    }
    
    
    
    func transform(Width : Int ,Height : Int , Align : UIAlignWidthState) -> AnyObject {
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,%@",Width,Height,getUIAlignmentWidth(Aligh: Align.rawValue)) as NSString)
        
        return self
    }
    
    
    func transform(Height : Int ,Width : Int , FIT_INSIDE_andAlign : UIAlignInsideState) -> AnyObject {
        
        
        let fitType :  String  = "fit_inside";
        
        self.appendString(Value: String(format: "w_%d,h_%d,,%@,%@",Width,Height,fitType,getUIalighmentInsideStyle(Align: FIT_INSIDE_andAlign.rawValue)) as NSString)
        
        
        return self
    }
    
    
    func transformFitFace(Height : Int ,Width : Int ) -> AnyObject {
        
        
        let fitType :  String  = "fit_face";
        
        self.appendString(Value: String(format: "w_%d,h_%d,%@",Width,Height,fitType) as NSString)
        
        
        return self
    }
    
    
    func transform(Height : Int ,Width : Int , FIT_HEIGHT_andAlign : UIAlignHeightState) -> AnyObject {
        
        
        let fitType :  String  = "fit_height";
        
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,,%@,%@",Width,Height,fitType,getUIalighmentHeightStyle(Align: FIT_HEIGHT_andAlign.rawValue)) as NSString)
        
        
        return self
    }
    
    
    
    func transform(Height : Int ,Width : Int , FIT_WIDTH_andAlign : UIAlignWidthState) -> AnyObject {
        
        
        let fitType :  String  = "fit_width";
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,,%@,%@",Width,Height,fitType,getUIAlignmentWidth(Aligh: FIT_WIDTH_andAlign.rawValue)) as NSString)
        
        
        return self
    }
    
    
    
    
    func transform(Height : Int ,Width : Int , OriginX : Int , OriginY : Int) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,x_%d,y_%d",Width,Height,OriginX,OriginY) as NSString)
        
        return self
    }
    
    
    
    
    
    func transform(Height : Int ,Width : Int , OriginX : Int ) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,x_%d,y_%d",Width,Height,OriginX) as NSString)
        
        return self
    }
    
    
    
    
    func transform(Height : Int ,Width : Int , OriginY : Int ) -> AnyObject {
        
        
        self.appendString(Value: String(format: "%%5Cw_%d,x_%d,y_%d",Width,Height,OriginY) as NSString)
        
        
        return self
    }
    
    
    func transform(Height : Int ,Width : Int , Fit : UIFitState , BackGroundColour :  UICOLORLIST) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "w_%d,h_%d,,%@,c_%@",Width,Height,getUIFitState(FITType: Fit.rawValue),getColorValue(ColorCode: BackGroundColour.rawValue)) as NSString)
        
        
        
        return self
    }
    
    func transform(Height : Int ,Width : Int , Fit : UIFitState , BackGroundColour : UICOLORLIST, Align : UIAlignInsideState ) -> AnyObject {
        
        self.appendString(Value: String(format: "w_%d,h_%d,,%@,c_%@,%@",Width,Height,getUIFitState(FITType: Fit.rawValue),getColorValue(ColorCode: BackGroundColour.rawValue), getUIalighmentInsideStyle(Align: Align.rawValue)) as NSString)
        
        return self
    }
    
    //        func transform(Height : Int ,Width : Int , Fit : UIFitState , ColorHexCode : NSString) -> AnyObject
    
    
    func crop(value : Int) -> AnyObject {
        self.appendString(Value: String(format: "r_%d", value) as NSString)
        return self
    }
    
    func cropMax() -> AnyObject {
        self.appendString(Value: String(format: "r_max") as NSString)
        
        return self
    }
    
    
    
    
    func quality(value : Int) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "%%5Cquality_%d",value) as NSString)
        
        return self
    }
    
    
    func grayScale() -> AnyObject {
        
        self.appendString(Value: String(format: "grayscale") as NSString)
        
        return self
    }
    
    func invert() -> AnyObject {
        
        self.appendString(Value: String(format: "invert") as NSString)
        
        return self
    }
    
    func brightness(value : Int) -> AnyObject {
        
        
        self.appendString(Value: String(format: "bright_%d", value) as NSString)
        
        return self
    }
    
    
    func contrast(value : Int) -> AnyObject {
        
        
        self.appendString(Value: String(format: "contrast_%d", value) as NSString)
        
        return self
    }
    
    
    func BrightnessAndContrast(Brightness : Int ,Contrast : Int) -> AnyObject {
        
        self.appendString(Value: String(format: "bright_%d,contrast_%d",Brightness,Contrast) as NSString)
        
        return self
    }
    //
    //    func flip(value : Int) -> AnyObject {
    //        self.appendString(Value: String(format: "flip_%d", value) as NSString)
    //        return self
    //    }
    //
    
    func flip(value : UIFlipState) -> AnyObject {
        
        
        
        self.appendString(Value: String(format: "%@", getFlipState(FlipStypeCode: value.rawValue)) as NSString)
        return self
    }
    
    
    
    
    
    func rotate(value : Int) -> AnyObject {
        
        self.appendString(Value: String(format: "rotate_%d", value) as NSString)
        return self
        
    }
    
    
    func insertImage(ImageUrl : NSString ) -> AnyObject {
        
        
        
        
        self.appendString(Value: String(format: "oi-%@",ImageUrl) as NSString)
        return self
        
        
    }
    
    
    
    
    func insertImage(ImageUrl : NSString , OriginX : Int , OriginY : Int ) -> AnyObject {
        
        
        self.appendString(Value: String(format: "oi-%@,x_%d,y_%d",ImageUrl,OriginX,OriginY) as NSString)
        return self
        
        
    }
    
    
    
    func insertText( InsertText : NSString , OriginX : Int , OriginY : Int , Size : Int , Style : UIFONTSTYLE , Color : UICOLORLIST ) -> AnyObject {
        //        self.appendString(Value: String(format: "inserttext_%@,x_%d,y_%d,size_%d,style_%@,c_%@",InsertText,OriginX,OriginY,Size,self.getFontStyle(FontStypeCode: Style.rawValue),getColorValue(ColorCode: Color.rawValue)) as NSString)
        self.appendString(Value: String(format: "ot-%@,x_%d,y_%d,size_%d,style_%@,c_%@",InsertText,OriginX,OriginY,Size,self.getFontStyle(FontStypeCode: Style.rawValue),getColorValue(ColorCode: Color.rawValue)) as NSString)
        return self
    }
    
    
    func appendString(Value : NSString)  {
        
        
        if(self.allValue.length == 0 ){
            self.allValue =   String(format: "%@",Value) as NSString
        }else{
            self.allValue =   String(format: "%@%%5C%@",self.allValue,Value) as NSString
            
        }
    }
    
    
    func getImage(ImageId : NSString) -> NSString {
        
        let accountName : NSString = self.getAccountID() as NSString
        
        return String(format: "http://amend.cloud/%@/image/%@/%@",accountName,self.allValue,ImageId) as NSString
        
        
    }
    
    func getImageByURL(Imageurl : NSString) -> NSString {
        
        let accountName : NSString = self.getAccountID() as NSString
        
        return String(format: "http://amend.cloud/%@/fetch/%@/%@",accountName,self.allValue,Imageurl) as NSString
        
        
    }
    
    
    
    
    func getFlipState( FlipStypeCode : Int) -> NSString {
        var StyleType :  NSString  = "";
        if(FlipStypeCode==0){
            StyleType = "flip_x";
        }else if(FlipStypeCode == 1){
            StyleType = "flip_y";
        }else if(FlipStypeCode == 2){
            StyleType = "flip_xy";
        }
        
        
        return StyleType as NSString
    }
    
    
    
    func getFontStyle( FontStypeCode : Int) -> NSString {
        var StyleType :  NSString  = "";
        if(FontStypeCode==0){
            StyleType = "normal";
        }else if(FontStypeCode == 1){
            StyleType = "bold";
        }else if(FontStypeCode == 2){
            StyleType = "italic";
        }else if(FontStypeCode == 3){
            StyleType = "underline";
        }else{
            StyleType = "normal";
        }
        return StyleType as NSString
    }
    
    func getColorValue(ColorCode : Int) -> NSString {
        var colorType :  NSString  = "";
        if(ColorCode==0){
            colorType = "white";
        }else if(ColorCode == 1){
            colorType = "silver";
        }else if(ColorCode == 2){
            colorType = "gray";
        }else if(ColorCode == 3){
            colorType = "black";
        }else if(ColorCode==4){
            colorType = "red";
        }else if(ColorCode == 5){
            colorType = "maroon";
        }else if(ColorCode == 6){
            colorType = "yellow";
        }else if(ColorCode == 7){
            colorType = "olive";
        }else if(ColorCode==8){
            colorType = "lime";
        }else if(ColorCode == 9){
            colorType = "green";
        }else if(ColorCode == 10){
            colorType = "aqua";
        }else if(ColorCode == 11){
            colorType = "teal";
        }else if(ColorCode==12){
            colorType = "blue";
        }else if(ColorCode == 13){
            colorType = "navy";
        }else if(ColorCode == 14){
            colorType = "fuchsia";
        }else if(ColorCode == 15){
            colorType = "purple";
        }else{
            colorType = "black";
        }
        return colorType
    }
    func getUIFitState(FITType : Int) -> NSString {
        var fitType :  String  = "";
        if(FITType==0){
            fitType = "fit_xy";
        }else if(FITType == 1){
            
            
            fitType = "fit_width";
            
        }else if(FITType == 2){
            
            fitType = "fit_height";
            
            
        }else if(FITType == 3){
            
            fitType = "fit_fill";
            
            
        }else if(FITType == 4){
            
            
            fitType = "fit_inside";
            
        }
        
        return fitType as NSString
    }
    func getUIalighmentInsideStyle(Align : Int) -> NSString {
        
        var alignType :  NSString = "";
        if(Align==0){
            alignType = "align_top";
        }else if(Align == 1){
            alignType =  "align_bottom";
        }else if(Align == 2){
            alignType =  "align_left";
        }else if(Align == 3){
            alignType =  "align_right";
        }else if(Align == 4){
            alignType =  "align_center";
        }
        
        
        return alignType as NSString
    }
    

    
    func getUIalighmentHeightStyle(Align : Int) -> NSString {
        
        var alignType :  String  = "";
        if(Align == 0){
            alignType = "align_left";
        }else if(Align == 1){
            alignType =  "align_right";
        }else if(Align == 2){
            alignType =  "align_center";
        }
        
        return alignType as NSString
    }
    
    
    func getUIAlignmentWidth(Aligh : Int) -> NSString {
        
        var alignType :  String  = "";
        
        if(Aligh == 0){
            alignType = "align_top";
        }else if(Aligh == 1){
            alignType =  "align_bottom";
        }else if(Aligh == 2){
            alignType =  "align_center";
        }
        return alignType as NSString
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


