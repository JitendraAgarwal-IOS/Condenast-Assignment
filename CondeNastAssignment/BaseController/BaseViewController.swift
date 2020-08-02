//
//  BaseViewController.swift
//  CondeNastAssignment
//
//  Created by Jitendra Kumar Agarwal on 3/08/19.
//  Copyright © 2019 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
 var datasource : AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  UIColor(hexFromString: "#25282A")
        
        // Do any additional setup after loading the view.
    }
   
}
