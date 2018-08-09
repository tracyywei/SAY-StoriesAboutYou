//
//  donateViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/19/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit

class donateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var pickerDonations: UIPickerView!
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
        }
        else if(row == 6){
            mylabel.text = "Money"
            label1.text = ""
            label2.text = ""
            label3.text = ""
            label4.text = ""
            label5.text = ""
            label6.text = ""
        }
        else if(row == 7){
            mylabel.text = "Medical Supplies"
            label1.text = "- Sugar Land Neighborhood Donor Center"
            label2.text = "- Healthcare for the Homeless"
            label3.text = "- Project CURE"
            label4.text = ""
            label5.text = ""
            label6.text = ""
        }
        else if(row == 8){
            mylabel.text = "Pet Supplies"
            label1.text = "- Houston Humane Society"
            label2.text = "- Meals on Wheels"
            label3.text = "- BARC"
            label4.text = ""
            label5.text = ""
            label6.text = ""
        }
        else if(row == 9){
            mylabel.text = "Household Items"
            
            label1.text = "- Houston Furniture Bank"
            label2.text = "- Harbor Ministries"
            label3.text = "- Purple Heart"
            label4.text = ""
            label5.text = ""
            label6.text = ""
        }
        else if(row == 10){
            mylabel.text = "Volunteer Opportunities"
            label1.text = ""
            label2.text = ""
            label3.text = ""
            label4.text = ""
            label5.text = ""
            label6.text = ""
        }
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDonations.delegate = self
        pickerDonations.dataSource = self
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
    @IBAction func closeDonate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
