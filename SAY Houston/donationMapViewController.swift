//
//  donationMapViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/31/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import MapKit

final class donationAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D;
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
        
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class donationMapViewController: UIViewController {
    @IBOutlet weak var donationMap: MKMapView!
    @IBAction func backDonate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var finalCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        donationMap.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        
        if finalCategory == "Food"{
            errorPt1.text = ""
            errorPt2.text = ""
            let nrgcenterCoordinate = CLLocationCoordinate2DMake(29.724135, -95.3936)
            let nrgcenterAnnotation = donationAnnotation(coordinate: nrgcenterCoordinate, title: "NRG Center", subtitle: "NRG Pkwy, Houston, TX 77054" + "\n" + "CLOSED")
            
            donationMap.addAnnotation(nrgcenterAnnotation)
            donationMap.setRegion(nrgcenterAnnotation.region, animated: true)
        }
        else if finalCategory == "Water"{
            errorPt1.text = ""
            errorPt2.text = ""
            let lakewoodchurchCoordinate = CLLocationCoordinate2DMake(29.724135, -95.3936)
            let lakewoodchurchAnnotation = donationAnnotation(coordinate: lakewoodchurchCoordinate, title: "Lakewood Church", subtitle: "3700 Southwest Fwy, Houston, TX 77027" + "\n" + "CLOSED")
            donationMap.addAnnotation(lakewoodchurchAnnotation)
        }
        else if finalCategory == "Baby Supplies"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Women Supplies"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Clothes"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Money"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Medical Supplies"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Pet Supplies"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Household Items"{
            errorPt1.text = ""
            errorPt2.text = ""
        }
        else if finalCategory == "Volunteer Opportunities"{
            errorPt1.text = ""
            errorPt2.text = ""
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func mapErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)*/
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
