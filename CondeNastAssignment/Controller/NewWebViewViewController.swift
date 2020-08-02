//
//  NewWebViewViewController.swift
//  CondeNastAssignment
//
//  Created by Capgemini on 02/08/20.
//  Copyright © 2020 JItu. All rights reserved.
//

import UIKit
import WebKit
class NewWebViewViewController: BaseViewController {
    
    @IBOutlet weak var aActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var newsWebView: WKWebView!
    var imageURL: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        newsWebView.navigationDelegate = self
        self.loadImage(newURl: imageURL!)
        // Do any additional setup after loading the view.
    }

    func loadImage(newURl imageUrl:String) {
        let requestObj = URL(string: imageUrl)
        newsWebView.load(URLRequest(url: requestObj! as URL))
    }
}
extension NewWebViewViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.aActivityIndicator.stopAnimating()
        print("Finished loading")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
         self.aActivityIndicator.stopAnimating()
        print(error.localizedDescription)
    }
}
