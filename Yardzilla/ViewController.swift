//
//  ViewController.swift
//  Yardzilla
//
//  Created by Allen Spicer on 5/25/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest( NSURLRequest(URL: NSURL(string: "https://duckduckgo.com")!))
        webView.delegate = self
    }
    
    @IBAction func backAction(sender: UIBarButtonItem) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    @IBAction func forwardAction(sender: UIBarButtonItem) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func stopAction(sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func refreshAction(sender: UIBarButtonItem) {
        webView.reload()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    extension ViewController : UIWebViewDelegate{
        func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool{
            if ((request.mainDocumentURL?.absoluteString.containsString("http://")) == true) {
                return false
            }
            
            return true
        }
        
    }




