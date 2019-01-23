//
//  superstoriesViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/20/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import WebKit

class superstoriesViewController: UIViewController {
    
    @IBOutlet var WebView: WKWebView!
    
    // webview loads
    override func loadView() {
        WebView = WKWebView()
        WebView.navigationDelegate = self as? WKNavigationDelegate
        view = WebView
    }
    @IBAction func logout(_ sender: Any) {
        performSegue(withIdentifier: "storyLogout", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        // 1
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1k1c_OQPb1fBTqzXOWTRhh40X2U5sUPXiJaMpEEveBUw/edit?usp=sharing")!
    WebView.load(URLRequest(url: url))
        
    }
    
    func WebView(_ WebView: WKWebView, didFinish navigation: WKNavigation!) {
        title = WebView.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

