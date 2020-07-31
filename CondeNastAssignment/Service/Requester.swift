//
//  Requester.swift
//  NavaAssignment
//
//  Created by Jitendra Kumar Agarwal on 21/02/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class Requester:NSObject,URLSessionDelegate,URLSessionDataDelegate {
    var responseData:((_ response: [String:AnyObject]?)->(),Error: (_ error: NSError?) -> ())?
    static let handler = Requester()
    fileprivate override init() { }
   
    
    func request(_ success: @escaping (_ response:[String:AnyObject]?) -> (),Error: @escaping (_ error: NSError?) -> ()) {
       
         let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3fcc3cdfdbc94d05a0c3d801d3ebbf96")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
          // your code here
            if let resData =  data {
                if let responseText = String(data: resData, encoding: .utf8) {
                           print(responseText)
                          //  self.responseData =  success
                    
                               do {
                                        
                                   let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                                        
                                   //  self.responseData!(json, nil)
                                    success(json)
                                

                                         do {
                                             let placesData = try NSKeyedArchiver.archivedData(withRootObject: json, requiringSecureCoding: false)
                                             
                                             SET_OBJ_FOR_KEY(placesData as AnyObject , key: kNewsHeadLineDetails)
                                         } catch {
                                             fatalError("Can't encode data: \(error)")
                                         }

                                 
                                     } catch let error as NSError {
                                        Error(error)
                                         print("Error parsing JSON: \(error.localizedDescription)")
                                     
                               }
                               
                           }
                       
            }
          Error(nil)
    })

    task.resume()

    }
    
    

    
    
}

