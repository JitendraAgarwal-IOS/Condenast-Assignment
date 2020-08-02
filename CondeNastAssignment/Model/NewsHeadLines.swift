//
//  NewsHeadLines.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

struct NewsArticles:Decodable {
    var status: String?
    var totalResults: Int?
    var articles : [Articles]
}

struct Articles: Decodable {
    var source : Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content:String?
   
}
struct Source: Decodable {
    var id: String?
    var name: String?
}

