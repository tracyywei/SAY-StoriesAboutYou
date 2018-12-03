//
//  donationViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/8/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import FirebaseAuth

class donationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)    }
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var pickerDonate: UIPickerView!
    
    let options = ["* Pick a category *", "Food", "Water", "Clothes", "Baby Supplies", "Women Supplies", "Money", "Medical Supplies", "Pet Supplies", "Household Items", "Volunteer Opportunities"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    var selectedOption : Int = 0
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        let myView = UIView(frame: CGRect(x: 0, y: 350, width: 200, height: 21))
        self.view.addSubview(myView)
        
        
       /* let mylabel = UILabel()
        mylabel.frame = CGRect(x: 0, y: 350, width: 200, height: 21)*/
        
        
        /* let label2 = UILabel(frame: CGRect(x: 0, y: 350, width: 200, height: 21))
        let label3 = UILabel(frame: CGRect(x: 0, y: 350, width: 200, height: 21))
        let label4 = UILabel(frame: CGRect(x: 0, y: 350, width: 200, height: 21))
        let label5 = UILabel(frame: CGRect(x: 0, y: 350, width: 200, height: 21)) */
        
        
        if(row == 1){
            /*mylabel.center = CGPoint(x: 190, y: 350)
            mylabel.textAlignment = .center
            mylabel.text = "Food"
            mylabel.font = UIFont.systemFont(ofSize: 21)
            mylabel.isHidden = false
            /*label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true*/
            
            self.view.addSubview(mylabel)*/
            
           mylabel.text = "Food"
            label1.text = "- Houston Food Bank"
            label2.text = "- Interfaith Ministries Food Pantry"
            label3.text = "- Anderson Food Pantry"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 1
            
        }
        else if(row == 2){
            /*label2.isHidden = false
            label2.center = CGPoint(x: 190, y: 350)
            label2.textAlignment = .center
            label2.text = "Water"
            label2.font = UIFont.systemFont(ofSize: 21)
            label.isHidden = true
            label3.isHidden = true
            label4.isHidden = true*/
            /*mylabel.center = CGPoint(x: 190, y: 350)
            mylabel.textAlignment = .center
            mylabel.text = "Water"
            mylabel.font = UIFont.systemFont(ofSize: 21)
            
            self.view.addSubview(mylabel)*/
            
            mylabel.text = "Water"
            
            label1.text = "- Baker Ripley"
            label2.text = "- Emergency Aid Coalition"
            label3.text = "- Houston Food Bank"
            label4.text = "- Interfaith Ministries"
            label5.text = ""
            label6.text = ""
            
            selectedOption = 2
        }
        else if(row == 3){
            
            /*label3.center = CGPoint(x: 190, y: 350)
            label3.textAlignment = .center
            label3.text = "Clothes"
            label3.font = UIFont.systemFont(ofSize: 21)
            self.view.addSubview(label3)*/
            mylabel.text = "Clothes"
            label1.text = "- Baker Ripley"
            label2.text = "- Houston Children's Charity"
            label3.text = "- Goodwill"
            label4.text = "- Salvation Army"
            label5.text = "- Dress for Success"
            label6.text = "- Houston Food Bank"
            
            selectedOption = 3
        }
        else if(row == 4){
            
            /*label4.center = CGPoint(x: 190, y: 350)
            label4.textAlignment = .center
            label4.text = "Baby Supplies"
            label4.font = UIFont.systemFont(ofSize: 21)
            self.view.addSubview(label4)*/
            mylabel.text = "Baby Supplies"
            label1.text = "- Houston Diaper Bank"
            label2.text = "- LIFE Houston"
            label3.text = "- Child Advocates"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 4
        }
        else if(row == 5){
            
            /*label5.center = CGPoint(x: 190, y: 350)
            label5.textAlignment = .center
            label5.text = "Women Supplies"
            label5.font = UIFont.systemFont(ofSize: 21)
            self.view.addSubview(label5)*/
            mylabel.text = "Women Supplies"
            label1.text = "- PennyWise"
            label2.text = "- Dress for Success"
            label3.text = "- Mission of Yahweh"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            
            selectedOption = 5
        }
        else if(row == 6){
            mylabel.text = "Money"
            label1.text = "Click 'See Map'"
            label2.text = ""
            label3.text = ""
            label4.text = ""
            label5.text = ""
            label6.text = ""
           
            
            selectedOption = 6
        }
        else if(row == 7){
            mylabel.text = "Medical Supplies"
            label1.text = "- Sugar Land Neighborhood Donor Center"
            label2.text = "- Healthcare for the Homeless"
            label3.text = "- Project CURE"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 7
        }
        else if(row == 8){
            mylabel.text = "Pet Supplies"
            label1.text = "- Houston Humane Society"
            label2.text = "- Meals on Wheels"
            label3.text = "- BARC"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 8
        }
        else if(row == 9){
            mylabel.text = "Household Items"
            
            label1.text = "- Houston Furniture Bank"
            label2.text = "- Harbor Ministries"
            label3.text = "- Purple Heart"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 9
        }
        else if(row == 10){
            mylabel.text = "Volunteer Opportunities"
            label1.text = "Any one of the locations"
            label2.text = "listed on the donations page"
            label3.text = "would love to hear from you!"
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 10
        }
        else if(row == 0){
            mylabel.text = ""
            label1.text = ""
            label2.text = ""
            label3.text = ""
            label4.text = ""
            label5.text = ""
            label6.text = ""
            
            selectedOption = 11
        }
    
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerDonate.delegate = self
        pickerDonate.dataSource = self
        
        mylabel.text = ""
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var categoryName = ""
    @IBAction func seeMap(_ sender: UIButton) {
        
        let alert2 = UIAlertController(title: "ERROR", message: "Please make sure you have selected a category before viewing the map", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        
        if(self.selectedOption == 1){
            self.categoryName = "Food"
        }
        else if(self.selectedOption == 2){
            self.categoryName = "Water"
        }
        else if(self.selectedOption == 3){
            self.categoryName = "Clothes"
        }
        else if(self.selectedOption == 4){
            self.categoryName = "Baby Supplies"
        }
        else if(self.selectedOption == 5){
            self.categoryName = "Women Supplies"
        }
        else if(self.selectedOption == 6){
            self.categoryName = "Money"
            let alert2 = UIAlertController(title: "Children At Risk", message: "Donations at Children At Risk are greatly appreciated and help keep this app running. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert2, animated: true, completion: nil)        }
        else if(self.selectedOption == 7){
            self.categoryName = "Medical Supplies"
        }
        else if(self.selectedOption == 8){
            self.categoryName = "Pet Supplies"
        }
        else if(self.selectedOption == 9){
            self.categoryName = "Household Items"
        }
        else if(self.selectedOption == 10){
            self.categoryName = "Volunteer Opportunities"
            let alert2 = UIAlertController(title: "Volunteer!", message: "Any one of the locations listed on the donations page would love to hear from you!", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert2, animated: true, completion: nil)        }
        else if(self.selectedOption == 11){
            /*let alert = UIAlertController(title: "ERROR", message: "Please make sure you have selected a category before viewing the map", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil) {
                (action)in print("Ok") }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)*/
            
            
            self.present(alert2, animated: true, completion: nil)
        }
        else {
            self.present(alert2, animated: true, completion: nil)
        }
         performSegue(withIdentifier: "seeMap", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!)
    {
        let vc = segue.destination as! donationMapViewController
        vc.finalCategory = self.categoryName
    }
        
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any!)
    {
        if (segue.identifier == "seeMap"){
        
            let category = segue.destination as! donationMapViewController
            
            if(self.selectedOption == 1){
           
            category.title = "Food"
            }
            else if(self.selectedOption == 2){
                category.title = "Water"
            }
            else if(self.selectedOption == 3){
                category.title = "Clothes"
            }
            else if(self.selectedOption == 4){
                category.title = "Baby Supplies"
            }
            else if(self.selectedOption == 5){
                category.title = "Women Supplies"
            }
            else if(self.selectedOption == 6){
                category.title = "Money"
            }
            else if(self.selectedOption == 7){
                category.title = "Medical Supplies"
            }
            else if(self.selectedOption == 8){
                category.title = "Pet Supplies"
            }
            else if(self.selectedOption == 9){
                category.title = "Household Items"
            }
            else if(self.selectedOption == 10){
                category.title = "Volunteer Opportunities"
            }
        }
    }*/
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
