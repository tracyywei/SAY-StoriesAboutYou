//
//  ViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/4/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func goLogin(_ sender: Any) {
        performSegue(withIdentifier: "enterlog", sender: self)
    }
    
    @IBAction func goCar(_ sender: Any) {
        performSegue(withIdentifier: "entercar", sender: self)
    }
    
    @IBAction func goCreate(_ sender: Any) {
        performSegue(withIdentifier: "entercreate", sender: self)
    }
    @IBAction func goSuper(_ sender: Any) {
        performSegue(withIdentifier: "entersuper", sender: self)
    }
    @IBAction func goDonate(_ sender: Any) {
        performSegue(withIdentifier: "enterdonations", sender: self)
    }
}

