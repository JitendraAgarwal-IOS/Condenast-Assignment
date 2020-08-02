//
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
extension  String {
    //To check String is not null/NULL/nil.
    static func isSafeString(_ strOpt: AnyObject?) -> Bool {
        var returnVar = true
        if let tempStr = strOpt as? String {
            if tempStr.lowercased() == "null" || tempStr.lowercased() == "<null>" {
                returnVar = false
            }
        }
        else {
            returnVar = false
        }
        return returnVar
    }
    // MARK:- Trimming the whitespace from a string and check empty of string
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    
}


