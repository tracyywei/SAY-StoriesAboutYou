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
        cancelConsent.isHidden = true
    }
   
    @IBAction func cancelLeave(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var story: UITextView!
    @IBOutlet weak var consentButton: UIButton!
    
    @IBOutlet weak var cancelConsent: UIButton!
    
    // picking a disaster
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
    
    var consent = "No"
    
    // user taps box giving permission
    @IBAction func consentTapped(_ sender: Any) {
        let alert2 = UIAlertController(title: "Notification", message: "We have your permission to use your story for data purposes for Children At Risk. To cancel this, press the X button located on the right of the Save Story button. Thank you for sharing your story!", preferredStyle: UIAlertControllerStyle.alert)
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
        consentButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        consentButton.setTitle("You have agreed to let Children At Risk use this information", for: .normal)
        consent = "Yes"
        cancelConsent.isHidden = false
    }
    
    // cancelling consent (tapping X), then gives notification informing user of cancelling permission
    @IBAction func consentCancelled(_ sender: Any) {
        let alert2 = UIAlertController(title: "Notification", message: "You are taking back your permission to use your story for data purposes for Children At Risk. To give permission, simply tap the box again. Thank you for sharing your story!", preferredStyle: UIAlertControllerStyle.alert)
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
        consentButton.backgroundColor = #colorLiteral(red: 0.7244122028, green: 0.8288078904, blue: 0.8972782493, alpha: 1)
        consentButton.setTitle(" Please tap on this box if you allow your story to be used by Children At Risk", for: .normal)
        consent = "No"
        cancelConsent.isHidden = true
    }
    
    // question mark is tapped, notification gives disclaimer
    
    @IBAction func helpTapped(_ sender: Any) {
        let alert2 = UIAlertController(title: "Disclaimer", message: "We are asking for your permission to use your story for data purposes for Children At Risk. Additionally, this could entail the possibility of sharing your story with other non-profit organizations or projects that focus on disasters and research. No personal information like your name or contact information will be shared, and your zipcode will not be directly linked backed to you. Your story can still be published in our app without tapping this box. Thank you for sharing your story!", preferredStyle: UIAlertControllerStyle.alert)
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
    
    
    
    @IBAction func saveStory(_ sender: Any) {
        
        // disaster is not selected
        
        if disaster == options[0] {
            let alert2 = UIAlertController(title: "Error", message: "Please select a disaster.", preferredStyle: UIAlertControllerStyle.alert)
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
        
        else {
            
        // Firebase code
        var ref: DatabaseReference!
        
        ref = Database.database().reference()

        let storyRef = ref.child("stories").childByAutoId()
            
        
        
        // what information is saved
        let storyObject = [
            "story": story.text,
            "zipcode": zipcode.text as Any,
            "disaster": disaster,
            // "hearts": 0,
            "timestamp": [".sv":"timestamp"],
            "consent": consent
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
