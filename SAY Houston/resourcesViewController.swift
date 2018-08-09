//
//  resourcesViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/8/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit

class resourcesViewController: UIViewController {

    @IBAction func donorTapped(_ sender: Any) {
        guard let url = URL(string: "https://donorhouston.guidestar.org/") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func khouTapped(_ sender: Any) {
        guard let url = URL(string: "https://www.khou.com/article/news/local/shelter-list-nrg-and-grb-are-primary-shelters/285-468037262") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func muckmapTapped(_ sender: Any) {
        guard let url = URL(string: "http://www.texasrescuemap.com/muckmap") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* sketchTapped.addTarget(self, action: "didTapSketch", forControlEvents: .TouchUpInside)*/

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sketchTapped(_ sender: Any) {
        guard let url = URL(string: "https://sketch-city.github.io/harvey-needs/") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func didTapSketch( sender: AnyObject) {
        UIApplication.shared.open(URL(string: "https://sketch-city.github.io/harvey-needs/")!  as URL, options:[:], completionHandler:nil)
        
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
