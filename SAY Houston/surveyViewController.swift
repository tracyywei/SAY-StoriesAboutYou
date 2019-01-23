//
//  surveyViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/27/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import WebKit
import FirebaseAuth

class surveyViewController: UIViewController , WKNavigationDelegate {
    var webView: WKWebView!
    @IBOutlet weak var SurveyWebView: WKWebView!

    // loading WebView when screen initializes
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    // logs out user
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)    }
    
    
    // web page that will initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeAZf_aseae_n5kWm4G7jhArulFIyzpnsTk6v4wsjAwKxPhmA/viewform?usp=sf_link")
        webView.load(URLRequest(url: url!))
        
        // Do any additional setup after loading the view.
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

    
    
   
    


