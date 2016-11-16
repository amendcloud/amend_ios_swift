//
//  MyTableViewDatasource.swift
//  deegeu-swift-tableview-simple
//
//  Created by Daniel Spiess on 4/10/16.
//  Copyright © 2016 Daniel Spiess. All rights reserved.
//

import UIKit

class MyTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cellIdentifier: String
    let dateFormatter = DateFormatter()
   
    var operations : [String] = ["Grayscale","Invert","Flip X","Flip Y","Flip XY","Circle"]
    
    
    init(cellIdentifier: String!) {
        self.cellIdentifier = cellIdentifier
        dateFormatter.dateStyle = DateFormatter.Style.medium
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(self.operations.count)
        return self.operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyCustomCell
        
        // Configure Cell
//        cell.happyDate?.text = dateFormatter.string(from: item.date as Date)
       
        let defaults = UserDefaults.standard
        let imageId = defaults.string(forKey: "imageId")!
        
        let mycelllabel : String  =  self.operations[indexPath.row]
     
        cell.lbImageName.text = self.operations[indexPath.row];
        
        switch indexPath.row {
        case 0:
            
            
            let tactLab = AmendOption()
             tactLab.grayScale()
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
            
            break
        case 1:
            
            let tactLab = AmendOption()
            tactLab.invert()
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
            break
        case 2:
          
            
            
            let tactLab = AmendOption()
              tactLab.flip(value: UIFlipState.FLIP_X)
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
           
            break
        case 3:
           
            
            let tactLab = AmendOption()
            tactLab.flip(value: UIFlipState.FLIP_Y)
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
        
            break
            
        case 4:
            
            let tactLab = AmendOption()
            tactLab.flip(value: UIFlipState.FLIP_XY)
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
            
            
            
            
            break
        case 5:
            
            
            let tactLab = AmendOption()
            tactLab.cropMax()
            let urlString = NSURL(string: tactLab.getImage(ImageId: imageId as NSString) as String)
            let amendObj = Amend()
            amendObj.getImage(ImageId: imageId as NSString, ImageView: cell.ivResultImage , Option : tactLab )
            
            
           
            break
        
        default:
            break;
        }
        
        
       

        
////        cell.myView?.layer.borderWidth = 1
//        cell.myView?.layer.masksToBounds = false
////        cell.myView?.layer.borderColor = UIColor.black.cgColor
//        cell.myView?.layer.cornerRadius = (cell.myView?.frame.height)!/2
//        cell.myView?.clipsToBounds = true
        
//        self.myView?.layer.borderWidth = 3.0f
//        self.myView?.layer.borderColor = [UIColor whiteColor].CGColor;
       
        return cell
    }
    

}
