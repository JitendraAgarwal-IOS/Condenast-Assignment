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
     @IBOutlet weak var imgNewsImage: UIImageView!
    @IBOutlet weak var tableNewsDetails: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let imageNewUrl = artical.urlToImage  {
            addImageTapGesture()
           self.imgNewsImage.sd_setImage(with: URL(string: imageNewUrl), placeholderImage: UIImage(named: "news-default"))
       }else{
        self.imgNewsImage.image = UIImage(named: "news-default")
        }
        self.tableNewsDetails.rowHeight = UITableView.automaticDimension
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title =   (String.isSafeString(artical.source?.name as AnyObject?)) ? artical.source?.name : ""
    }
    private func addImageTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgNewsImage.isUserInteractionEnabled = true
        imgNewsImage.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let webView =  mainStoryboard.instantiateViewController(withIdentifier: "NewWebViewViewController") as! NewWebViewViewController
        if let imageNewUrl = artical.url  {
            webView.imageURL = imageNewUrl
            self.navigationController?.pushViewController(webView, animated: true)
           
        }
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
