//
//  ViewController.swift
//  CloudAmend
//
//  Created by admin on 27/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import UIKit

import Foundation

class CloudAmendFeaturesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
 
    
    
    var items: [String] = [] ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CloudAmend"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        let globalFunction = GlobalFunction()
        
        self.items  = globalFunction.getKeysFromPlist() as! [String]
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView .reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "subtitleCell")
         cell.textLabel?.text = self.items[(indexPath as NSIndexPath).row]
//        cell.detailTextLabel?.text =  self.items[(indexPath as NSIndexPath).row]
        
        let support = Support()
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = support .color(withHexString: "FFFFFF")
        }
        else{
            cell.backgroundColor = support .color(withHexString: "D9EDF6")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        performSegue(withIdentifier: "CloudAmendFeaturetoList", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "CloudAmendFeaturetoList" {
            let viewController: CloudAmendFeaturesListViewController = segue.destination as! CloudAmendFeaturesListViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            viewController.ListName = self.items[(indexPath?.row)!]

            
        }

        
        
        
    }
}
