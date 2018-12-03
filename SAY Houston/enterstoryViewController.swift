//
//  enterstoryViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 11/3/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class enterstoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        disasterPicker.delegate = self
        disasterPicker.dataSource = self
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
    }
   
    @IBAction func cancelLeave(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var story: UITextView!
    

    
    @IBOutlet weak var disasterPicker: UIPickerView!
    let options = ["* Choose a disaster *", "Hurricane Harvey", "Hurricane Florence"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    // save the disaster string
    var disaster = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 1){
            disaster = options[1]
        }
        else if(row == 2){
            disaster = options[2]
        }
        else if (row == 0){
            disaster = options[0]
        }
    }
    
    
    
    
    @IBAction func saveStory(_ sender: Any) {
        
        if disaster != options[0] {
            
        // Firebase code
        var ref: DatabaseReference!
        
        ref = Database.database().reference()

        let storyRef = ref.child("stories").childByAutoId()
        
        // what information is saved
        let storyObject = [
            "story": story.text,
            "zipcode": zipcode.text as Any,
            "disaster": disaster,
            "hearts": 0,
            "timestamp": [".sv":"timestamp"]
        ] as [String:Any]
        
        storyRef.setValue(storyObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
            
        })
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
