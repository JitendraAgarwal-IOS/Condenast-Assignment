//
//  APIHandler.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class APIHandler: NSObject {

    static let handler = APIHandler()
    fileprivate override init() { }
    
    func getNewArticles(_ success: @escaping (_ response: NewsArticles?) -> (), failure: @escaping (_ error: NSError?) -> ()) {
        Requester.handler.request({ (feedData) in
            success(feedData)
        }) { (error) in
            failure(error)
            
        }
    }
}
