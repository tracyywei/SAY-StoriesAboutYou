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
            let houstonfoodbankCoordinate = CLLocationCoordinate2DMake(29.7810, -95.2748)
            let houstonfoodbankAnnotation = donationAnnotation(coordinate: houstonfoodbankCoordinate, title: "Houston Food Bank", subtitle: "535 Portwall St, Houston, TX 77029" + "\n" + "OPEN")
            
            let himfoodbankCoordinate = CLLocationCoordinate2DMake(29.789700 , -95.374450)
            let himfoodbankAnnotation = donationAnnotation(coordinate: himfoodbankCoordinate, title: "Heights Interfaith Ministries Food Pantry", subtitle: "3523 Beauchamp St, Houston, TX 77009 " + "\n" + "OPEN")
            
            let andersonCoordinate = CLLocationCoordinate2DMake(29.774610,-95.335550 )
            let andersonAnnotation = donationAnnotation(coordinate: andersonCoordinate, title: "Anderson Food Pantry", subtitle: "1508 Gregg St, Houston, TX 77020" + "\n" + "OPEN")
            
            
            donationMap.addAnnotation(houstonfoodbankAnnotation)
            donationMap.addAnnotation(himfoodbankAnnotation)
            donationMap.addAnnotation(andersonAnnotation)
            
            
            donationMap.setRegion(houstonfoodbankAnnotation.region, animated: true)
        }
            
        else if finalCategory == "Water"{
            
            let bakerripleyCoordinate = CLLocationCoordinate2DMake(29.716460,-95.452160)
            let bakerripleyAnnotation = donationAnnotation(coordinate:bakerripleyCoordinate, title: "Baker Ripley", subtitle: "4450 Harrisburg, Suite 200 Houston, TX 77011 (713) 667 9400" + "\n" + "OPEN")
            let emergencyaidcoalitionCoordinate = CLLocationCoordinate2DMake(41.564809,-71.466557 )
            let emergencyaidcoalitionAnnotation = donationAnnotation(coordinate: emergencyaidcoalitionCoordinate, title: "Emergency Aid Coalition", subtitle: "5401 Fannin St, Houston, TX 77004 (713) 528-FOOD (3663)" + "\n" + "OPEN")
            let houstonfoodbankCoordinate = CLLocationCoordinate2DMake(38.198390 , -79.004900)
            let houstonfoodbankAnnotation = donationAnnotation(coordinate: houstonfoodbankCoordinate, title: "Houston Food Bank", subtitle: "535 Portwall St, Houston, TX 77029 (713) 223 3700" + "\n" + "OPEN")
            
            // Interfaith ministries
            let interfaithCoordinate = CLLocationCoordinate2DMake(29.740390 , -95.377400)
            let interfaithAnnotation = donationAnnotation(coordinate: interfaithCoordinate, title: "Interfaith Ministries for Greater Houston", subtitle: "3303 Main St. Houston, TX (713) 533-4900" + "\n" + "OPEN")
            let himfoodbankCoordinate = CLLocationCoordinate2DMake(29.789700 , -95.374450)
            let himfoodbankAnnotation = donationAnnotation(coordinate: himfoodbankCoordinate, title: "Heights Interfaith Ministries Food Pantry", subtitle: "3523 Beauchamp St, Houston, TX 77009 " + "\n" + "OPEN")
            let braesinterfaithCoordinate = CLLocationCoordinate2DMake(29.789700 , -95.374450)
            let braesinterfaithAnnotation = donationAnnotation(coordinate: braesinterfaithCoordinate, title: "Braes Interfaith Ministries", subtitle: "4300 W Bellfort Blvd, Houston, TX 77035 " + "\n" + "OPEN")
            
            donationMap.addAnnotation(bakerripleyAnnotation)
            donationMap.addAnnotation(emergencyaidcoalitionAnnotation)
            donationMap.addAnnotation(houstonfoodbankAnnotation)
            donationMap.addAnnotation(himfoodbankAnnotation)
            donationMap.addAnnotation(interfaithAnnotation)
            donationMap.addAnnotation(braesinterfaithAnnotation)
            donationMap.setRegion(bakerripleyAnnotation.region, animated: true)
            
        }
            
        else if finalCategory == "Baby Supplies"{
            let houstondiaperbankCoordinate = CLLocationCoordinate2DMake(29.711670 ,-95.512370 )
            let houstondiaperbankAnnotation = donationAnnotation(coordinate: houstondiaperbankCoordinate, title: "Houston Diaper Bank", subtitle: "6201 Bonhomme Rd Suite 250N, Houston, TX 77036 Contact Information on Website" + "\n" + "OPEN")
            let lifehoustonCoordinate = CLLocationCoordinate2DMake( 29.742640, -95.318090)
            let lifehoustonAnnotation = donationAnnotation(coordinate: lifehoustonCoordinate, title: "LIFE Houston", subtitle: "204 Clifton, Houston, TX 77011 (713) 528 6044" + "\n" + "OPEN")
            let childadvocatesCoordinate = CLLocationCoordinate2DMake(29.733120 , -95.418050)
            let childadvocatesAnnotation = donationAnnotation(coordinate: childadvocatesCoordinate, title: "Child Advocates", subtitle: "3701 Kirby Dr. Suite 400, Houston TX 77098 (713) 529 1396" + "\n" + "OPEN")
            
            donationMap.addAnnotation(houstondiaperbankAnnotation)
            donationMap.addAnnotation(lifehoustonAnnotation)
            donationMap.addAnnotation(childadvocatesAnnotation)
            donationMap.setRegion(houstondiaperbankAnnotation.region, animated: true)
            
        }
            
        else if finalCategory == "Women Supplies"{
            let pennywiseCoordinate = CLLocationCoordinate2DMake(29.580020, -95.581840)
            let pennywiseAnnotation = donationAnnotation(coordinate: pennywiseCoordinate, title: "Penny Wise", subtitle: "4737 Hwy 6, Missouri City, TX 77459" + "\n" + "OPEN")
            let DressForSuccessCoordinate = CLLocationCoordinate2DMake(29.735970, -95.425040)
            let DressForSuccessAnnotation = donationAnnotation(coordinate:DressForSuccessCoordinate, title: "Dress For Success ", subtitle: "3310 Eastside St, Houston, TX 77098" + "\n" + "OPEN")
            let yahwehCoordinate = CLLocationCoordinate2DMake(29.845060, -95.547190)
            let yahwehAnnotation = donationAnnotation(coordinate: yahwehCoordinate, title: "Mission of Yahweh", subtitle: "10247 Algiers Rd, Houston, TX 77041" + "\n" + "OPEN")
            
            donationMap.addAnnotation(pennywiseAnnotation)
            donationMap.addAnnotation(DressForSuccessAnnotation)
            donationMap.addAnnotation(yahwehAnnotation)
            donationMap.setRegion(yahwehAnnotation.region, animated: true)
        }
        else if finalCategory == "Clothes"{
            let salvationCoordinate = CLLocationCoordinate2DMake(29.696760,-95.490220)
            let salvationAnnotation = donationAnnotation(coordinate: salvationCoordinate, title: "Salvation Army ", subtitle: "6150 Bissonnet St, Houston, TX 77081" + "\n" + "OPEN")
            let bakerripleyCoordinate = CLLocationCoordinate2DMake(29.716460,-95.452160)
            let bakerripleyAnnotation = donationAnnotation(coordinate:bakerripleyCoordinate, title: "Baker Ripley", subtitle: "4450 Harrisburg, Suite 200 Houston, TX 77011 (713) 667 9400" + "\n" + "OPEN")
            let houstonfoodbankCoordinate = CLLocationCoordinate2DMake(29.7810, -95.2748)
            let houstonfoodbankAnnotation = donationAnnotation(coordinate: houstonfoodbankCoordinate, title: "Houston Food Bank", subtitle: "535 Portwall St, Houston, TX 77029" + "\n" + "OPEN")
            let DressForSuccessCoordinate = CLLocationCoordinate2DMake(29.735970, -95.425040)
            let DressForSuccessAnnotation = donationAnnotation(coordinate:DressForSuccessCoordinate, title: "Dress For Success ", subtitle: "3310 Eastside St, Houston, TX 77098" + "\n" + "OPEN")
            let goodwillCoordinate = CLLocationCoordinate2DMake(29.550470, -95.698270)
            let goodwillAnnotation = donationAnnotation(coordinate: goodwillCoordinate, title: "Goodwill Donation Center", subtitle: "1025 Crabb River Rd #110, Richmond, TX 77469" + "\n" + "OPEN")
            let goodwill2Coordinate = CLLocationCoordinate2DMake(29.549670, -95.587100)
            let goodwill2Annotation = donationAnnotation(coordinate: goodwill2Coordinate, title: "Goodwill Donation Center", subtitle: "18721 University Blvd #120, Sugar Land, TX 77479" + "\n" + "OPEN")
            let goodwill3Coordinate = CLLocationCoordinate2DMake(29.561790, -95.691090)
            let goodwill3Annotation = donationAnnotation(coordinate: goodwill3Coordinate, title: "Goodwill Donation Center", subtitle: "20400 Southwest Fwy #110, Richmond, TX 77469" + "\n" + "OPEN")
            let goodwill4Coordinate = CLLocationCoordinate2DMake(29.594530, -95.627550)
            let goodwill4Annotation = donationAnnotation(coordinate: goodwill4Coordinate, title: "Goodwill Donation Center", subtitle: "13503 Southwest Fwy, Sugar Land, TX 77478" + "\n" + "OPEN")
            let goodwill5Coordinate = CLLocationCoordinate2DMake(29.587710, -95.623580)
            let goodwill5Annotation = donationAnnotation(coordinate: goodwill5Coordinate, title: "Goodwill Donation Center", subtitle: "16525 Lexington Blvd, Sugar Land, TX 77479" + "\n" + "OPEN")
            let HoustonChildrensCharityCoordinate = CLLocationCoordinate2DMake(29.751340, -95.457050)
            let HoustonChildrensCharityAnnotation = donationAnnotation(coordinate: HoustonChildrensCharityCoordinate, title: " Houston Childrens Charity", subtitle: "1600 W Loop S #610, Houston, TX 77027" + "\n" + "OPEN")
            donationMap.addAnnotation(salvationAnnotation)
            donationMap.addAnnotation(goodwillAnnotation)
            donationMap.addAnnotation(goodwill2Annotation)
            donationMap.addAnnotation(goodwill3Annotation)
            donationMap.addAnnotation(goodwill4Annotation)
            donationMap.addAnnotation(goodwill5Annotation)
            donationMap.addAnnotation(DressForSuccessAnnotation)
            donationMap.addAnnotation(bakerripleyAnnotation)
            donationMap.addAnnotation(houstonfoodbankAnnotation)
            donationMap.addAnnotation(HoustonChildrensCharityAnnotation)
            donationMap.setRegion(goodwill5Annotation.region, animated: true)        }
        else if finalCategory == "Money"{
           
            
        }
        else if finalCategory == "Medical Supplies"{
            let HHHCoordinate = CLLocationCoordinate2DMake(29.748250, -95.368390)
            let HHHAnnotation = donationAnnotation(coordinate: HHHCoordinate, title: "Healthcare for the Homeless", subtitle: " 1934 Caroline St, Houston, TX 77002" + "\n" + "OPEN")
            let CURECoordinate = CLLocationCoordinate2DMake(29.817800,-95.491330)
            let CUREAnnotation = donationAnnotation(coordinate: CURECoordinate, title: "Project Cure", subtitle: "8303 Kempwood Dr, Houston, TX 77055" + "\n" + "OPEN")
            let sugarlanddonorCoordinate = CLLocationCoordinate2DMake(29.586820, -95.632670)
            let sugarlanddonorAnnotation = donationAnnotation(coordinate: sugarlanddonorCoordinate, title: "Sugarland Neighborhood Donor Center", subtitle: "4949 Sweetwater Blvd, Sugar Land, TX 77479" + "\n" + "OPEN")
            
            donationMap.addAnnotation(HHHAnnotation)
            donationMap.addAnnotation(CUREAnnotation)
            donationMap.addAnnotation(sugarlanddonorAnnotation)
            donationMap.setRegion(sugarlanddonorAnnotation.region, animated: true)
            
        }
        else if finalCategory == "Pet Supplies"{
            let humanesocietyCoordinate = CLLocationCoordinate2DMake(29.591170,-95.430320)
            let humanesocietyAnnotation = donationAnnotation(coordinate: humanesocietyCoordinate, title: "Houston Humane Society", subtitle: "14700 Almeda Rd, Houston, TX 77053" + "\n" + "OPEN")
            let mealsonwheelsCoordinate = CLLocationCoordinate2DMake(29.565510, -95.284740)
            let mealsonwheelsAnnotation = donationAnnotation(coordinate: mealsonwheelsCoordinate, title: "Meals on Wheels", subtitle: "2314 N Grand Blvd, Pearland, TX 77581" + "\n" + "OPEN")
            let BARCCoordinate = CLLocationCoordinate2DMake(29.788510, -95.345290)
            let BARCAnnotation = donationAnnotation(coordinate: BARCCoordinate, title: "BARC", subtitle: "3200 Carr St, Houston, TX 77026" + "\n" + "OPEN")
            
            donationMap.addAnnotation(BARCAnnotation)
            donationMap.addAnnotation(mealsonwheelsAnnotation)
            donationMap.addAnnotation(humanesocietyAnnotation)
            donationMap.setRegion(BARCAnnotation.region, animated: true)
        }
        else if finalCategory == "Household Items"{
            let houstonfurniturebankCoordinate = CLLocationCoordinate2DMake(29.649960, -95.254910)
            let houstonfurniturebankAnnotation = donationAnnotation(coordinate: houstonfurniturebankCoordinate, title: "Houston Furniture Bank", subtitle: "8220 Mosley Rd, Houston, TX 77075" + "\n" + "OPEN")
            let harborCoordinate = CLLocationCoordinate2DMake( 29.670330, -95.211900)
            let harborAnnotation = donationAnnotation(coordinate: harborCoordinate, title: "Harbor Ministries", subtitle: "4642, 2715 Perez Rd, Pasadena, TX 77502" + "\n" + "OPEN")
            let purpleheartCoordinate = CLLocationCoordinate2DMake(29.822990, -95.479660)
            let purpleheartAnnotation = donationAnnotation(coordinate: purpleheartCoordinate, title: "Purple Heart", subtitle: "6116 Milwee St, Houston, TX 77092" + "\n" + "OPEN")
            let purpleheart1Coordinate = CLLocationCoordinate2DMake(30.046260, -95.249540 )
            let purpleheart1Annotation = donationAnnotation(coordinate: purpleheart1Coordinate, title: "Purple Heart", subtitle: "22845 TX-494 Loop, Humble, TX 77339" + "\n" + "OPEN")
            donationMap.addAnnotation(houstonfurniturebankAnnotation)
            donationMap.addAnnotation(harborAnnotation)
            donationMap.addAnnotation(purpleheartAnnotation)
            donationMap.addAnnotation(purpleheart1Annotation)
            donationMap.setRegion(purpleheart1Annotation.region, animated: true)        }

        else if finalCategory == "Volunteer Opportunities"{
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


