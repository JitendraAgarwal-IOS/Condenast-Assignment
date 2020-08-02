//
//  NewHeadLineViewModel.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import KRProgressHUD
protocol NewsArticlesModelDelegate {
    func updateUI(articles: [Articles])
}
class NewsArticlesModel {
    var articles =  [Articles]()
    var delegate: NewsArticlesModelDelegate?
   
  
    init(articles:[Articles]) {
        self.articles =  articles
    }
}


