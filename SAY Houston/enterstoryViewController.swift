//
//  enterstoryViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/27/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import Firebase

class enterstoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var storyField: UITextView!
    
    
    let options = ["Hurricane Harvey", "Hurricane Irma"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
   var currentUsername = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        DataService.dataService.CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
            
            let currentUser = snapshot.value.objectForKey("username") as! String
            
            print("Username: \(currentUser)")
            self.currentUsername = currentUser
        }, withCancelBlock: { error in
            print(error.description)
        })
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backStories(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveStory(_ sender: Any) {
        let storyText = storyField.text
        
        if storyText != "" {
            
            // Build the new Joke.
            // AnyObject is needed because of the votes of type Int.
            
            let newStory: Dictionary<String, AnyObject> = [
                "storyText": storyText!,
                "likes": 0,
                "author": currentUsername
            ]
            
            // Send it over to DataService to seal the deal.
            
            DataService.dataService.createNewStory(newStory)
            
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
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
