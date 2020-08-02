//
//  NewDetailsViewController.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    var artical: Articles!
    @IBOutlet weak var tableNewsDetails: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableNewsDetails.rowHeight = UITableView.automaticDimension
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title =   (String.isSafeString(artical.source?.name as AnyObject?)) ? artical.source?.name : ""
    }
  
    
    
}
// MARK:- User Define
extension NewsDetailsViewController {
    @objc func backAction(sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK:- Tableview Delagte and Datascource.
extension NewsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsHeaderCell") as! NewsDetailsHeaderCell
        cell.datasource =  artical as AnyObject
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return   UITableView.automaticDimension
    }
    
    }
