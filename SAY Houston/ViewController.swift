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
   
    
// Segues performed for each button
    @IBAction func goLogin(_ sender: Any) {   // enter button
        performSegue(withIdentifier: "enterHome", sender: self)
    }
    
    @IBAction func goCar(_ sender: Any) {
        performSegue(withIdentifier: "entercar", sender: self)
    }
    
    @IBAction func goSuper(_ sender: Any) {
        performSegue(withIdentifier: "entersuper", sender: self)
    }
    @IBAction func goDonate(_ sender: Any) {
        performSegue(withIdentifier: "enterdonations", sender: self)
    }
}

// When you tap outside of the keyboard, it disappears
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
