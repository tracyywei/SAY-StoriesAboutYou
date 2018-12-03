//
//  createaccountViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/8/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import FirebaseAuth

class createaccountViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordTextCreate: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var verify: UITextView!
    
    func resetForm(){
        passwordTextCreate.text = ""
        passwordConfirm.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verify.text = "DISCLAIMER: Your email is being used for login purposes only."
        self.hideKeyboardWhenTappedAround()
        resetForm()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: Any) {
        handleSignUp()
        
    }
    
    @objc func handleSignUp() {
        guard let username = usernameText.text else {return}
        guard let email = emailText.text else {return}
        guard let password = passwordTextCreate.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil && self.passwordTextCreate == self.passwordConfirm {
                    print("User is created!")
                let user = Auth.auth().currentUser
                user!.delete()
                self.performSegue(withIdentifier: "NewUserLoggedIn", sender: self)
            }
            else{
                print("Error")
                self.verify.text = "Error creating an account"
                self.resetForm()
            }
        }
    
    
    
    
   
}
    
    
    
    @IBAction func closeCreate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func accountLogin(_ sender: Any) {
        performSegue(withIdentifier: "accountLogin", sender: self)
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
