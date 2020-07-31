//
//  ViewController.swift
//  Byju'sAssignment
//
//  Created by Jitendra Kumar Agarwal on 25/07/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class NewHeadLineController: BaseViewController {
    let model =  NewHeadLineViewModel()
    
    @IBOutlet weak var tableNewsList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableNewsList.isHidden = true
        model.delegate = self
        self.title = "HEADLINS"
        let textAttributes = [NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Bold", size: 18.0)!,NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        
    }
}
// NewsHeadLineListDelegate Delegate
extension NewHeadLineController: NewsHeadLineListDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            if self.model.numberOfRowInSection > 0{
                self.tableNewsList.isHidden = false
                self.tableNewsList.reloadData()
            }
            
        }
    }
}
extension NewHeadLineController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model.numberOfRowInSection > 0) ? model.numberOfRowInSection : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadLineTableViewCell") as! HeadLineTableViewCell
        cell.datasource =  model.getNewsHeadLine[indexPath.row] as AnyObject
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC =  mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        detailsVC.newsDetailsModel = model.getNewsHeadLine[indexPath.row] 
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.pushViewController(detailsVC, animated: true)
      
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250
    }
    
    
}
