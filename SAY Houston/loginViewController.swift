//
//  loginViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/8/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import FirebaseAuth

class loginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        handleSignIn()
    }
    
    @IBOutlet weak var verify: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verify.text = ""
        resetForm()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @objc func handleSignIn() {
        guard let email = usernameText.text else { return }
        guard let pass = passwordText.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("Success")
                self.performSegue(withIdentifier: "enterHome", sender: UIButton())
            }
            else {
                print("Error logging in: \(error!.localizedDescription)")
                self.verify.text = "\(error!.localizedDescription)"
                self.resetForm()
            }
        }
    
    
    }
    

    func resetForm() {
        usernameText.text = ""
    }
    
    
    @IBAction func closeLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func accountCreate(_ sender: Any) {
        performSegue(withIdentifier: "accountCreate", sender: self)
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
