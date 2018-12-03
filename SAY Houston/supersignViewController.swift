//
//  supersignViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/19/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit

class supersignViewController: UIViewController {
    @IBOutlet weak var superUser: UITextField!
    @IBOutlet weak var superPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeSuper(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goSuperSee(_ sender: Any) {
        
        if(superUser.text == "gamechangers" && superPass.text == "gamechangers"){
        performSegue(withIdentifier: "entersupersee", sender: self)
        }
        else{
            let alert2 = UIAlertController(title: "ERROR", message: "Incorrect username or password. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert2, animated: true, completion: nil)
        }
    }
    
    @IBAction func goBackLogin(_ sender: Any) {
        performSegue(withIdentifier: "superGoLogin", sender: self)
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
