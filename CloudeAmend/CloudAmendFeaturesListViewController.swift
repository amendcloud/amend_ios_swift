//
//  ViewController.swift
//  CloudAmend
//
//  Created by admin on 27/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import UIKit

import UIKit

class CloudAmendFeaturesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var ListName : String = ""
    
    var items: [AnyObject]? = []
    var dictionaryObj: NSDictionary?
    
    var rowValue : String = ""
    var textfieldCount : NSArray = []
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView .reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CloudAmend"

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        let globalFunction = GlobalFunction()

        let path = Bundle.main.path(forResource: "CloudAmend", ofType: "plist")
       
                
        dictionaryObj = NSDictionary(contentsOfFile: path!)
        
//      self.items  = globalFunction.getDictionary(ListName) as? [String : String]
       
        
        
        var arr = [String]()
        
        for (key, value) in dictionaryObj! {
            arr.append("\(value)")
        }
       
        self.items = globalFunction.getArray(ListName) as! [AnyObject]?
        
        print(self.items)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "subtitleCell")
        
        cell.textLabel?.text = self.items?[(indexPath as NSIndexPath).row]["Key"] as! String?
//        cell.detailTextLabel?.text =  self.items?[(indexPath as NSIndexPath).row]["Description"] as! String?
        
        let support = Support()
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = support .color(withHexString: "FFFFFF")
        }
        else{
            cell.backgroundColor = support .color(withHexString: "D9EDF6")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
         textfieldCount = self.items?[(indexPath as NSIndexPath).row]["TextFieldCount"] as! NSArray
        
        
        print("count",textfieldCount.count)
        print("textfieldCount",textfieldCount)
        
        rowValue = (self.items?[(indexPath as NSIndexPath).row]["Key"] as! String?)!
        
        if(self.items?[(indexPath as NSIndexPath).row]["Key"] as! String? == "Multiple Operations"){
            performSegue(withIdentifier: "multipleTableView", sender: self)
        }
        else if(self.items?[(indexPath as NSIndexPath).row]["Key"] as! String? == "Multiple Images"){
            performSegue(withIdentifier: "multipleImages", sender: self)
        }
        else{
        performSegue(withIdentifier: "detailPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailPage" {
        let viewController: CloudAmendDetailViewController = segue.destination as! CloudAmendDetailViewController
       
        viewController.rowValue = rowValue as String!
        viewController.fieldCount = textfieldCount.count
        viewController.fieldArray = textfieldCount
        }

    }
}
