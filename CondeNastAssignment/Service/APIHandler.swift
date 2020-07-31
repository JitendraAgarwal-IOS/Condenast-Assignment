//
//  APIHandler.swift
//  NavaAssignment
//
//  Created by Jitendra Kumar Agarwal on 21/02/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class APIHandler: NSObject {

    static let handler = APIHandler()
    fileprivate override init() { }
    
    func getUserProfileList(_ success: @escaping (_ response: [String:AnyObject]?) -> (), failure: @escaping (_ error: NSError?) -> ()) {
        Requester.handler.request({ (feedData) in
            success(feedData)
        }) { (error) in
            failure(error)
            
        }
    }
}
