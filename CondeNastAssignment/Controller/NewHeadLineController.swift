//
//  ViewController.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import KRProgressHUD
class NewHeadLineController: BaseViewController {
    var model: NewsArticlesModel?
    var arrayArticles =  [Articles]()
    
    @IBOutlet weak var noDataLabel: UILabel!
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableNewsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNewsArticlesApiCall()
        self.addPullToRefresh()
    
        self.title = "HEADLINS"
        let textAttributes = [NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Bold", size: 18.0)!,NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        
    }
    private func addPullToRefresh() {
         refreshControl.backgroundColor = UIColor.gray
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
      if #available(iOS 10.0, *)
          {
              tableNewsList.refreshControl = refreshControl
          }
          else
          {
              tableNewsList.backgroundView = refreshControl
          }
      }
    @objc private func handleRefresh(_ sender: Any) {
        getNewsArticlesApiCall()
        refreshControl.endRefreshing()
    }
}

extension NewHeadLineController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (arrayArticles.count > 0) ? arrayArticles.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadLineTableViewCell") as! HeadLineTableViewCell
        cell.datasource =  arrayArticles[indexPath.row] as AnyObject
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC =  mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        detailsVC.artical =  self.arrayArticles[indexPath.row]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.pushViewController(detailsVC, animated: true)
      
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250
    }
    
    
}

// MARK:- API Call
extension NewHeadLineController {
   fileprivate func getNewsArticlesApiCall() {
     KRProgressHUD.show(withMessage: "Loading...")
        APIHandler.handler.getNewArticles({ (ArticlesFeed) in
           guard let feedResponse =  ArticlesFeed else {
                return
            }
     
        self.model =  NewsArticlesModel(articles: feedResponse.articles)
        self.updateUI(articles: self.model?.articles ?? [])
      
        }, failure: { (error) in
            print("eror")
             DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                KRProgressHUD.dismiss()
            }
        })
        
    }
    func updateUI(articles: [Articles]) {
        self.arrayArticles =  articles
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            KRProgressHUD.dismiss()
            self.tableNewsList.isHidden =  (self.arrayArticles.count>0) ?  false : true
            self.noDataLabel.isHidden =  (self.arrayArticles.count>0) ?  true : false
            self.tableNewsList.reloadData()
        }
      
    }
    
}


