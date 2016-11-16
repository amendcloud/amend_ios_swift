//
//  TableViewController.swift
//  CloudAmend
//
//  Created by admin on 25/10/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.tableView.dataSource = myDataSource

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let myDataSource = MyTableViewDataSource( cellIdentifier: "MyCustomCell")
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
//        self.performSegue(withIdentifier: "segueone", sender: self)
    }


}
