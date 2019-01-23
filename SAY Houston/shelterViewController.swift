//
//  shelterViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 6/8/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth

final class shelterAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D;
    var title: String?
    var subtitle: String?
    
    // format for information of each point initializing
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
        
    }
    
    // how much the initial map view will cover
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 1.6, longitudeDelta: 1.6)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class shelterViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // defining points and adding text
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let nrgcenterCoordinate = CLLocationCoordinate2DMake(29.6847, -95.4107)
        let nrgcenterAnnotation = shelterAnnotation(coordinate: nrgcenterCoordinate, title: "NRG Center", subtitle: "NRG Pkwy, Houston, TX 77054" + "\n" + "CLOSED")
        
        let lakewoodchurchCoordinate = CLLocationCoordinate2DMake(29.724135, -95.3936)
        let lakewoodchurchAnnotation = shelterAnnotation(coordinate: lakewoodchurchCoordinate, title: "Lakewood Church", subtitle: "3700 Southwest Fwy, Houston, TX 77027" + "\n" + "CLOSED")
        
        let georgerbrownconventioncenterCoordinate = CLLocationCoordinate2DMake( 29.752142, -95.357836)
        let georgerbrownconventioncenterAnnotation = shelterAnnotation(coordinate: georgerbrownconventioncenterCoordinate, title: "George R. Brown Convention Center", subtitle: "1001 Avenida De Las Americas, Houston, TX 77010" + "\n" + "CLOSED")
        
        let toyotacenterCoordinate = CLLocationCoordinate2DMake( 29.750760, -95.3621)
        let toyotacenterAnnotation = shelterAnnotation(coordinate: toyotacenterCoordinate, title: "Toyota Center", subtitle: "1510 Polk St, Houston, TX 77002" + "\n" + "CLOSED")
        
        let alieftaylorhighschoolCoordinate = CLLocationCoordinate2DMake( 29.695043, -95.632903)
        let alieftaylorhighschoolAnnotation = shelterAnnotation(coordinate: alieftaylorhighschoolCoordinate, title: "Alief Taylor High School", subtitle: "7555 Howell Sugar Land Rd, Houston, TX 77083" + "\n" + "CLOSED")
        
        let trinimendenhallcommunitycenterCoordinate = CLLocationCoordinate2DMake( 29.795777, -95.484173)
        let trinimendenhallcommunitycenterAnnotation = shelterAnnotation(coordinate: trinimendenhallcommunitycenterCoordinate, title: "Trini Menden Hall Community Center", subtitle: "1414 Wirt Road Houston, TX 77055" + "\n" + "CLOSED")
        
        let christtheincarnatewordcatholicchurchCoordinate = CLLocationCoordinate2DMake( 29.686401, -95.586490)
        let christtheincarnatewordcatholicchurchAnnotation = shelterAnnotation(coordinate: christtheincarnatewordcatholicchurchCoordinate, title: "Christ The Incarnate Word Catholic Church", subtitle: "8503 S Kirkwood Houston TX 77099" + "\n" + "CLOSED")
        
        let calvarycommunitychurchCoordinate = CLLocationCoordinate2DMake( 29.887669, -95.639625)
        let calvarycommunitychurchAnnotation = shelterAnnotation(coordinate: calvarycommunitychurchCoordinate, title: "Calvary Community Church", subtitle: "7550 Cherry Park Dr, Houston, TX 77095" + "\n" + "CLOSED")
        
        let primroseschoolofkelliwoodCoordinate = CLLocationCoordinate2DMake( 29.749224, -95.734262)
        let primroseschoolofkelliwodAnnotation = shelterAnnotation(coordinate: primroseschoolofkelliwoodCoordinate, title: "Primrose School of Kelliwood", subtitle: "2402 Westgreen Blvd, Katy, TX 77450" + "\n" + "CLOSED")
        
        let themetchurchCoordinate = CLLocationCoordinate2DMake( 29.962072, -95.584457)
        let themetchurchAnnotation = shelterAnnotation(coordinate: themetchurchCoordinate, title: "The MET Church", subtitle: "13000 Jones Road, Houston TX 77070" + "\n" + "CLOSED")
        
        
        let lienhoatempleCoordinate = CLLocationCoordinate2DMake( 29.705423, -95.632615)
        let lienhoatempleAnnotation = shelterAnnotation(coordinate: lienhoatempleCoordinate, title: "Lien Hoa Temple", subtitle: "6709 Sugarland Howell Rd, Houston, TX 77083" + "\n" + "CLOSED")
        
        let lifepathchurchCoordinate = CLLocationCoordinate2DMake( 29.864791, -95.680598)
        let lifepathchurchAnnotation = shelterAnnotation(coordinate: lifepathchurchCoordinate, title: "Lifepath Church", subtitle: "17703 W Little York Rd, Houston, TX 77084" + "\n" + "CLOSED")
        
        let houstonskylinejuniorvolleyballfacilityCoordinate = CLLocationCoordinate2DMake( 29.791967, -95.556314)
        let houstonskylinejuniorvolleyballfacilityAnnotation = shelterAnnotation(coordinate: houstonskylinejuniorvolleyballfacilityCoordinate, title: "Houston Skyline Junior Volleyball Facility", subtitle: "10510 Westview Drive Houston TX 77043" + "\n" + "CLOSED")
        
        let redcrossshelteratmocampbelledcenterCoordinate = CLLocationCoordinate2DMake( 29.932391, -95.359926)
        let redcrossshelteratmocampbelledcenterAnnotation = shelterAnnotation(coordinate: redcrossshelteratmocampbelledcenterCoordinate, title: "Red Cross Shelter at M.O. Campbell Ed Center", subtitle: "1865 Aldine Bender Rd, Houston, TX" + "\n" + "CLOSED")
        
        let islamiccentermasjidalmustafaCoordinate = CLLocationCoordinate2DMake( 29.863304, -95.671145)
        let islamiccentermasjidalmustafaAnnotation = shelterAnnotation(coordinate: islamiccentermasjidalmustafaCoordinate, title: "Islamic Center/Masjid Al-Mustafa", subtitle: "17250 Coventry Park Dr, Houston, TX" + "\n" + "CLOSED")
        
        let islamiccentermasjidalsabireenCoordinate = CLLocationCoordinate2DMake( 29.618818, -95.579410)
        let islamiccentermasjidalsabireenAnnotation = shelterAnnotation(coordinate: islamiccentermasjidalsabireenCoordinate, title: "Islamic Center/Masjid Al-Sabireen", subtitle: "610 Brand Lane, Stafford TX" + "\n" + "CLOSED")
        
        let islamiccentermasjidabubakrCoordinate = CLLocationCoordinate2DMake(29.631725, -95.207515)
        let islamiccentermasjidabubakrAnnotation = shelterAnnotation(coordinate: islamiccentermasjidabubakrCoordinate, title: "Islamic Center/Masjid Abu-Bakr", subtitle: "8830 Old Galveston Rd, Houston TX" + "\n" + "CLOSED")
        
        let iglesiabautistadelredentorCoordinate = CLLocationCoordinate2DMake( 29.8314428, -95.488850)
        let iglesiabautistadelredentorAnnotation = shelterAnnotation(coordinate: iglesiabautistadelredentorCoordinate, title: "Iglesia Bautista del Redentor", subtitle: "4218 Lang Road Houston TX" + "\n" + "CLOSED")
        
        let vietnamesemartyschurchCoordinate = CLLocationCoordinate2DMake( 29.616900, -95.230124)
        let vietnamesemartyschurchAnnotation = shelterAnnotation(coordinate: vietnamesemartyschurchCoordinate, title: "Vietnamese Martys Church", subtitle: "10610 Kingspoint Road, Houston, TX" + "\n" + "CLOSED")
        
        let smaximiliankolbecatholiccommunityCoordinate = CLLocationCoordinate2DMake( 29.908491, -95.568765)
        let smaximiliankolbecatholiccommunityAnnotation = shelterAnnotation(coordinate: smaximiliankolbecatholiccommunityCoordinate, title: "St. Maximilian Kolbe Catholic Community", subtitle: "10135 West Rd, Houston, TX 77064" + "\n" + "CLOSED")
        
        let stchristophercatholicchurchCoordinate = CLLocationCoordinate2DMake( 29.686401, -95.275097)
        let stchristophercatholicchurchAnnotation = shelterAnnotation(coordinate: stchristophercatholicchurchCoordinate, title: "St. Christopher Catholic Church", subtitle: "8150 Park Pl Blvd, Houston, TX 77017" + "\n" + "CLOSED")
        
        let stthomaspresbyterianchurchCoordinate = CLLocationCoordinate2DMake( 29.771641, -95.590575)
        let stthomaspresbyterianchurchAnnotation = shelterAnnotation(coordinate: stthomaspresbyterianchurchCoordinate, title: "St. Thomas Presbyterian Church", subtitle: "14100 Memorial Drive, near Memorial and Kirkwood" + "\n" + "CLOSED")
        
        let beyondwallsoutreachcenterCoordinate = CLLocationCoordinate2DMake( 29.656791, -95.542842)
        let beyondwallsoutreachcenterAnnotation = shelterAnnotation(coordinate: beyondwallsoutreachcenterCoordinate, title: "Beyond Walls Outreach Center", subtitle: "11214 Plainsfields Street, Houston, TX" + "\n" + "CLOSED")
        
        let northshorehighschoolCoordinate = CLLocationCoordinate2DMake( 29.790733, -95.182285)
        let northshorehighschoolAnnotation = shelterAnnotation(coordinate: northshorehighschoolCoordinate, title: "North Shore High School", subtitle: "13501 Hollypark Drive" + "\n" + "CLOSED")
        
        let mocampbellcenterCoordinate = CLLocationCoordinate2DMake( 29.932391, -95.359926)
        let mocampbellcenterAnnotation = shelterAnnotation(coordinate: mocampbellcenterCoordinate, title: "M.O. Campbell Center", subtitle: "1865 Aldine Bender Road" + "\n" + "CLOSED")
        
        let pasadenahighschoolCoordinate = CLLocationCoordinate2DMake( 29.708953, -95.210826)
        let pasadenahighschoolAnnotation = shelterAnnotation(coordinate: pasadenahighschoolCoordinate, title: "Pasadena High School", subtitle: "206 South Shaver, Pasadena, TX 77506" + "\n" + "CLOSED")
        
        let goldenacresbaptistchurchCoordinate = CLLocationCoordinate2DMake( 29.669787, -95.162635)
        let goldenacresbaptistchurchAnnotation = shelterAnnotation(coordinate: goldenacresbaptistchurchCoordinate, title: "Golden Acres Baptist Church", subtitle: "2812 Pansy St, Pasadena, TX" + "\n" + "CLOSED")
        
        let dobiehighschoolCoordinate = CLLocationCoordinate2DMake( 29.591558, -95.250432)
        let dobiehighschoolAnnotation = shelterAnnotation(coordinate: dobiehighschoolCoordinate, title: "Dobie High School", subtitle: "10220 Blackhawk Boulevard" + "\n" + "CLOSED")
        
        let thecommunityoffaithchurchCoordinate = CLLocationCoordinate2DMake( 29.842873, -95.42233)
        let thecommunityoffaithchurchAnnotation = shelterAnnotation(coordinate: thecommunityoffaithchurchCoordinate, title: "The Community of Faith Church", subtitle: "1024 Pinemont Drive" + "\n" + "CLOSED")
        
        let lindaleassemblyofgodCoordinate = CLLocationCoordinate2DMake( 29.815313, -95.365127)
        let lindaleassemblyofgodAnnotation = shelterAnnotation(coordinate: lindaleassemblyofgodCoordinate, title: "Lindale Assembly of God", subtitle: "503 Reid Street" + "\n" + "CLOSED")
        
        let trinitykleinlutheranchurchCoordinate = CLLocationCoordinate2DMake( 30.045337, -95.500075)
        let trinitykleinlutheranchurchAnnotation = shelterAnnotation(coordinate: trinitykleinlutheranchurchCoordinate, title: "Trinity Klein Lutheran Church", subtitle: "5201 Spring Cypress Rd, Spring, TX 77379" + "\n" + "CLOSED")
        
        let redcrossshelteratforgeforfamiliesCoordinate = CLLocationCoordinate2DMake( 29.704359, -95.367811)
        let redcrossshelteratforgeforfamiliesAnnotation = shelterAnnotation(coordinate: redcrossshelteratforgeforfamiliesCoordinate, title: "Red Cross Shelter at Forge For Families", subtitle: "3435 Dixie Drive" + "\n" + "CLOSED")
        
        let firstbaptistchurchofporterCoordinate = CLLocationCoordinate2DMake( 30.102976, -95.239045)
        let firstbaptistchurchofporterAnnotation = shelterAnnotation(coordinate: firstbaptistchurchofporterCoordinate, title: "First Baptist Church of Porter", subtitle: "24570 FM 1314 Porter, TX 77365" + "\n" + "CLOSED")
        
        let mocampbellcentershelterCoordinate = CLLocationCoordinate2DMake( 29.932391, -95.359926)
        let mocampbellcentershelterAnnotation = shelterAnnotation(coordinate: mocampbellcentershelterCoordinate, title: "MO Campbell Center Shelter", subtitle: "1865 Aldine Bender in District 2" + "\n" + "CLOSED")
        
        let mortonranchhighschoolCoordinate = CLLocationCoordinate2DMake( 29.803861, -95.744971)
        let mortonranchhighschoolAnnotation = shelterAnnotation(coordinate: mortonranchhighschoolCoordinate, title: "Morton Ranch High School", subtitle: "21000 Franz Rd., Katy, TX 77449" + "\n" + "CLOSED")
        
        let richardeberryeducationalsupportcenterCoordinate = CLLocationCoordinate2DMake( 29.905162, -95.688550)
        let richardeberryeducationalsupportcenterAnnotation = shelterAnnotation(coordinate: richardeberryeducationalsupportcenterCoordinate, title: "Richard E. Berry Educational Support Center", subtitle: "8877 Barker Cypress Road, Cypress, TX 77433" + "\n" + "CLOSED")
        
        let lonestarcollegecyfairCoordinate = CLLocationCoordinate2DMake( 29.910625, -95.692560)
        let lonestarcollegecyfairAnnotation = shelterAnnotation(coordinate: lonestarcollegecyfairCoordinate, title: "Lone Star College–CyFair", subtitle: "9191 Barker Cypress Rd, Cypress, TX 77433" + "\n" + "CLOSED")
        
        let humbleciviccenterCoordinate = CLLocationCoordinate2DMake( 29.980127, -95.258894)
        let humbleciviccenterAnnotation = shelterAnnotation(coordinate: humbleciviccenterCoordinate, title: "Humble Civic Center", subtitle: "8233 Will Clayton Pkwy, Humble, TX 77338" + "\n" + "CLOSED")
        
        let communityoffaithCoordinate = CLLocationCoordinate2DMake( 30.005973, -95.794321)
        let communityoffaithAnnotation = shelterAnnotation(coordinate: communityoffaithCoordinate, title: "Community of Faith", subtitle: "16124 Becker Road, Hockley" + "\n" + "CLOSED")
        
        let goodsheperdgmcCoordinate = CLLocationCoordinate2DMake( 29.989027, -95.734742)
        let goodsheperdgmcAnnotation = shelterAnnotation(coordinate: goodsheperdgmcCoordinate, title: "Good Sheperd GMC", subtitle: "20155 Cypresswood Drive, Cypress" + "\n" + "CLOSED")
        
        let cityofarcolacommunitycenterCoordinate = CLLocationCoordinate2DMake( 29.509011, -95.466894)
        let cityofarcolacommunitycenterAnnotation = shelterAnnotation(coordinate: cityofarcolacommunitycenterCoordinate, title: "City of Arcola Community Center", subtitle: "13222 Highway 6, Arcola, TX" + "\n" + "CLOSED")
        
        let fulshearhighschoolCoordinate = CLLocationCoordinate2DMake(29.691171, -95.888136)
        let fulshearhighschoolAnnotation = shelterAnnotation(coordinate: fulshearhighschoolCoordinate, title: "Fulshear High School", subtitle: "9302 Bois D’Arc Lane, Fulshear, TX" + "\n" + "CLOSED")
        
        let thefellowshipchurchCoordinate = CLLocationCoordinate2DMake( 29.733881, -95.763025)
        let thefellowshipchurchAnnotation = shelterAnnotation(coordinate: thefellowshipchurchCoordinate, title: "The Fellowship Church", subtitle: "22765 Westheimer Pkwy., Katy, TX" + "\n" + "CLOSED")
        
        let cincoranchjuniorhighCoordinate = CLLocationCoordinate2DMake( 29.743309, -95.779120)
        let cincoranchjuniorhighAnnotation = shelterAnnotation(coordinate: cincoranchjuniorhighCoordinate, title: "Cinco Ranch Junior High School", subtitle: "23420 Cinco Ranch Blvd., Katy, TX" + "\n" + "CLOSED")
        
        let kendeltonchurchofgodCoordinate = CLLocationCoordinate2DMake( 29.450831, -96.004020)
        let kendeltonchurchofgodAnnotation = shelterAnnotation(coordinate: kendeltonchurchofgodCoordinate, title: "Kendelton Church of God", subtitle: "619 FM 2919, Kendleton, TX" + "\n" + "CLOSED")
        
        let eagleheightschurchCoordinate = CLLocationCoordinate2DMake( 29.667331, -95.681543)
        let eagleheightschurchAnnotation = shelterAnnotation(coordinate: eagleheightschurchCoordinate, title: "Eagle Heights Church", subtitle: "16718 W Bellfort Blvd, Richmond, TX 77407" + "\n" + "CLOSED")
        
        let phatgiactempleCoordinate = CLLocationCoordinate2DMake( 29.669374, -95.657996)
        let phatgiactempleAnnotation = shelterAnnotation(coordinate: phatgiactempleCoordinate, title: "Phat Giac Temple", subtitle: "10022 Gaines Road, Sugar land, TX" + "\n" + "CLOSED")
        
        let staffordhighschoolCoordinate = CLLocationCoordinate2DMake( 29.601370, -95.543313)
        let staffordhighschoolAnnotation = shelterAnnotation(coordinate: staffordhighschoolCoordinate, title: "Stafford High School", subtitle: "1625 Staffordshire Road, Stafford, TX" + "\n" + "CLOSED")
        
        let lamarstatecollegeCoordinate = CLLocationCoordinate2DMake(29.879528 ,-93.927445)
        let lamarstatecollegeAnnotation = shelterAnnotation(coordinate:  lamarstatecollegeCoordinate, title: "Lamar State College", subtitle: "1500 Proctor St, Port Arthur, TX 77640" + "\n" + "CLOSED")
        
        
        let holyfamilycatholicchurchCoordinate = CLLocationCoordinate2DMake(29.309757 ,-96.081249)
        let holyfamilycatholicchurchAnnotation = shelterAnnotation(coordinate:   holyfamilycatholicchurchCoordinate, title: "Holy Family Catholic Church", subtitle: "2011 Briar Ln, Wharton TX 77488" + "\n" + "CLOSED")
        
        
        let carlparkercenterCoordinate = CLLocationCoordinate2DMake(29.880619, -93.923718)
        let carlparkercenterAnnotation = shelterAnnotation(coordinate: carlparkercenterCoordinate, title: "Carl Parker Center", subtitle: "1800 Lakeshore Dr, Port Arthur, TX 77640" + "\n" + "CLOSED")
        
        let tonyburgeractivitycenterCoordinate = CLLocationCoordinate2DMake( 30.229686,-97.808758)
        let tonyburgeractivitycenterAnnotation = shelterAnnotation(coordinate: tonyburgeractivitycenterCoordinate, title: "Tony Burger Activity Center", subtitle: "3200 Jones Rd, Austin, TX 78745" + "\n" + "CLOSED")
        
        let lbjohnsonhighschoolCoordinate = CLLocationCoordinate2DMake( 30.313495, -97.656667)
        let lbjohnsonhighschoolAnnotation = shelterAnnotation(coordinate:  lbjohnsonhighschoolCoordinate, title: "LB Johnson High School", subtitle: "LB Johnson High School: 7309 Lazy Creek Dr, Austin, TX 78724" + "\n" + "CLOSED")
        
        
        let shepherdcommunitycenterCoordinate = CLLocationCoordinate2DMake( 39.767242,-86.097307)
        let shepherdcommunitycenterAnnotation = shelterAnnotation(coordinate:   shepherdcommunitycenterCoordinate, title: "Shepherd Community Center", subtitle: "1025 FM 150 East, Sherpherd, Tx 7737" + "\n" + "CLOSED")
        
        
        let coldspringisdjonescampusCoordinate = CLLocationCoordinate2DMake(30.594588, -95.126324)
        let coldspringisdjonescampusAnnotation = shelterAnnotation(coordinate: coldspringisdjonescampusCoordinate, title: "Coldspring I.S.D. Jones Campus", subtitle: "125 FM 1514, Coldspring, Tx 77331" + "\n" + "CLOSED")
        
        let livingstoneschurchCoordinate = CLLocationCoordinate2DMake(29.452925, -95.228549)
        let livingstoneschurchAnnotation = shelterAnnotation(coordinate:  livingstoneschurchCoordinate, title: "Living Stones Church", subtitle: "1407 Victory Lane Alvin, TX" + "\n" + "CLOSED")
        
        let cityofarcolacommunitycenter2Coordinate = CLLocationCoordinate2DMake( 29.509011,-95.466894)
        let cityofarcolacommunitycenter2Annotation = shelterAnnotation(coordinate:  cityofarcolacommunitycenter2Coordinate, title: "City of Arcola Community Center", subtitle: "13222 Highway 6, Rosharon, TX" + "\n" + "CLOSED")
        
        let redcrossshelteratlivingstonechurchCoordinate = CLLocationCoordinate2DMake( 29.452925, -95.228549)
        let redcrossshelteratlivingstonechurchAnnotation = shelterAnnotation(coordinate:  redcrossshelteratlivingstonechurchCoordinate, title: "Red Cross Shelter At Living Stone Church", subtitle: "1401 Victory Lane, Alvin, TX" + "\n" + "CLOSED")
        
        
        let angletonisdCoordinate = CLLocationCoordinate2DMake( 29.177859, -95.418526)
        let angletonisdAnnotation = shelterAnnotation(coordinate: angletonisdCoordinate, title: "Angelton ISD", subtitle: "1900 N. Downing, Angleton, TX" + "\n" + "CLOSED")
        
        let firstunitedmethodistchurchshelterCoordinate = CLLocationCoordinate2DMake(30.112904,-97.319677)
        let firstunitedmethodistchurchshelterAnnotation = shelterAnnotation(coordinate:  firstunitedmethodistchurchshelterCoordinate, title: "First United Methodist Church Shelter", subtitle: "1201 Main St., Bastrop City, TX" + "\n" + "CLOSED")
        
        
        let thecityactivitiesbuildingCoordinate = CLLocationCoordinate2DMake(29.529896, -95.199204)
        let thecityactivitiesbuildingAnnotation = shelterAnnotation(coordinate: thecityactivitiesbuildingCoordinate, title: "The City Activities Building", subtitle: "416 Morningside Drive, Friendswood, TX" + "\n" + "CLOSED")
        
        let mortonranchhsCoordinate = CLLocationCoordinate2DMake( 29.803807, -95.744994)
        let mortonranchhsAnnotation = shelterAnnotation(coordinate: mortonranchhsCoordinate, title: "Morton Ranch HS", subtitle: "21000 Franz Rd, Katy, TX 77449" + "\n" + "CLOSED")
        
        
        
        
        
        let underoverfellowshipCoordinate = CLLocationCoordinate2DMake( 30.307717, -95.458658)
        let underoverfellowshipAnnotation = shelterAnnotation(coordinate:  underoverfellowshipCoordinate, title: "Underover Fellowship", subtitle: "600 South Frasier Street, Conroe, TX 77301" + "\n" + "CLOSED")
        
        let stsimonandjudeCoordinate = CLLocationCoordinate2DMake( 30.148925, -95.491168)
        let stsimonandjudeAnnotation = shelterAnnotation(coordinate: stsimonandjudeCoordinate, title: "St. Simon and Jude", subtitle: "26777 Glen Loch Road, Spring, TX 77381" + "\n" + "CLOSED")
        
        let lonestarconventioncenterCoordinate = CLLocationCoordinate2DMake( 30.344208,-95.429794)
        let lonestarconventioncenterAnnotation = shelterAnnotation(coordinate:  lonestarconventioncenterCoordinate, title: "Lone Star Convention Center", subtitle: "9055 Airport Rd., Conroe, TX 77303" + "\n" + "CLOSED")
        
        let collegeparkhighCoordinate = CLLocationCoordinate2DMake( 30.204567,-95.471759)
        let collegeparkhighAnnotation = shelterAnnotation(coordinate: collegeparkhighCoordinate, title: "College Park High", subtitle: "3701 College Park Drive, The Woodlands, TX" + "\n" + "CLOSED")
        
        
        let bullsalasparkCoordinate = CLLocationCoordinate2DMake(30.144326,-95.240485)
        let bullsalasparkAnnotation = shelterAnnotation(coordinate:  bullsalasparkCoordinate, title: "Bull Salas Park", subtitle: "21679 McCleskey Road, New Caney, TX 77357" + "\n" + "CLOSED")
        
        
        let georgejuniorhighschoolCoordinate = CLLocationCoordinate2DMake( 29.543827, -95.779569)
        let georgejuniorhighschoolAnnotation = shelterAnnotation(coordinate:   georgejuniorhighschoolCoordinate, title: "George Junior High School", subtitle: "4601 Airport Avenue, Rosenberg, TX" + "\n" + "CLOSED")
        
        
        let creeksidechristianfellowshipCoordinate = CLLocationCoordinate2DMake(29.367972,-95.802496)
        let creeksidechristianfellowshipAnnotation = shelterAnnotation(coordinate: creeksidechristianfellowshipCoordinate, title: "Creekside Christian Fellowship", subtitle: "16628 TX-36, Needville, TX" + "\n" + "CLOSED")
        
        
        let christunitedmethodistchurchCoordinate = CLLocationCoordinate2DMake( 29.572944, -95.602902)
        let christunitedmethodistchurchAnnotation = shelterAnnotation(coordinate:  christunitedmethodistchurchCoordinate, title: "Christ United Methodist Church", subtitle: "3300 Austin Pkwy., Sugar land, TX" + "\n" + "CLOSED")
        
        
        let sttheresacatholicchurchCoordinate = CLLocationCoordinate2DMake( 29.628749, -95.632600)
        let sttheresacatholicchurchAnnotation = shelterAnnotation(coordinate:  sttheresacatholicchurchCoordinate, title: "St. Theresa Catholic Church", subtitle: "705 St. Theresa Blvd., Sugar Land, TX " + "\n" + "CLOSED")
        
        
        let marshallhighschoolemergencyshelterCoordinate = CLLocationCoordinate2DMake(29.611256, -95.522717)
        let marshallhighschoolemergencyshelterAnnotation = shelterAnnotation(coordinate:  marshallhighschoolemergencyshelterCoordinate, title: "Marshall High School Emergency Shelter", subtitle: "1220 Buffalo Run, Missouri City, TX 77489" + "\n" + "CLOSED")
        
        
        
        let redcrossshelteratbfterryhighschoolCoordinate = CLLocationCoordinate2DMake(29.545873,-95.771331)
        let redcrossshelteratbfterryhighschoolAnnotation = shelterAnnotation(coordinate:  redcrossshelteratbfterryhighschoolCoordinate, title: "Red Cross Shelter at B.F. Terry High School", subtitle: "5500 Avenue N., Rosenberg" + "\n" + "CLOSED")
        
        
        
        let kempnerhighschoolCoordinate = CLLocationCoordinate2DMake( 29.644030, -95.646030)
        let kempnerhighschoolAnnotation = shelterAnnotation(coordinate:  kempnerhighschoolCoordinate, title: "Kempner High School", subtitle: "14777 Voss Rd, Sugar Land, TX" + "\n" + "CLOSED")
        
        
        // adding points to map
        
        mapView.addAnnotation(nrgcenterAnnotation)
        mapView.addAnnotation(lakewoodchurchAnnotation)
        mapView.addAnnotation(georgerbrownconventioncenterAnnotation)
        mapView.addAnnotation(toyotacenterAnnotation)
        mapView.addAnnotation(alieftaylorhighschoolAnnotation)
        mapView.addAnnotation(trinimendenhallcommunitycenterAnnotation)
        mapView.addAnnotation(christtheincarnatewordcatholicchurchAnnotation)
        mapView.addAnnotation(calvarycommunitychurchAnnotation)
        mapView.addAnnotation(primroseschoolofkelliwodAnnotation)
        mapView.addAnnotation(themetchurchAnnotation)
        mapView.addAnnotation(lienhoatempleAnnotation)
        mapView.addAnnotation(lifepathchurchAnnotation)
        mapView.addAnnotation(houstonskylinejuniorvolleyballfacilityAnnotation)
        mapView.addAnnotation(redcrossshelteratmocampbelledcenterAnnotation)
        mapView.addAnnotation(islamiccentermasjidalmustafaAnnotation)
        mapView.addAnnotation(islamiccentermasjidalsabireenAnnotation)
        mapView.addAnnotation(islamiccentermasjidabubakrAnnotation)
        mapView.addAnnotation(iglesiabautistadelredentorAnnotation)
        mapView.addAnnotation(vietnamesemartyschurchAnnotation)
        mapView.addAnnotation(smaximiliankolbecatholiccommunityAnnotation)
        mapView.addAnnotation(stchristophercatholicchurchAnnotation)
        mapView.addAnnotation(stthomaspresbyterianchurchAnnotation)
        mapView.addAnnotation(beyondwallsoutreachcenterAnnotation)
        mapView.addAnnotation(northshorehighschoolAnnotation)
        mapView.addAnnotation(mocampbellcenterAnnotation)
        mapView.addAnnotation(pasadenahighschoolAnnotation)
        mapView.addAnnotation(goldenacresbaptistchurchAnnotation)
        mapView.addAnnotation(dobiehighschoolAnnotation)
        mapView.addAnnotation(thecommunityoffaithchurchAnnotation)
        mapView.addAnnotation(lindaleassemblyofgodAnnotation)
        mapView.addAnnotation(trinitykleinlutheranchurchAnnotation)
        mapView.addAnnotation(redcrossshelteratforgeforfamiliesAnnotation)
        mapView.addAnnotation(firstbaptistchurchofporterAnnotation)
        mapView.addAnnotation(mocampbellcentershelterAnnotation)
        mapView.addAnnotation(mortonranchhighschoolAnnotation)
        mapView.addAnnotation(richardeberryeducationalsupportcenterAnnotation)
        mapView.addAnnotation(lonestarcollegecyfairAnnotation)
        mapView.addAnnotation(humbleciviccenterAnnotation)
        mapView.addAnnotation(communityoffaithAnnotation)
        mapView.addAnnotation(goodsheperdgmcAnnotation)
        mapView.addAnnotation(cityofarcolacommunitycenterAnnotation)
        mapView.addAnnotation(fulshearhighschoolAnnotation)
        mapView.addAnnotation(thefellowshipchurchAnnotation)
        mapView.addAnnotation(cincoranchjuniorhighAnnotation)
        mapView.addAnnotation(kendeltonchurchofgodAnnotation)
        mapView.addAnnotation(eagleheightschurchAnnotation)
        mapView.addAnnotation(phatgiactempleAnnotation)
        mapView.addAnnotation(staffordhighschoolAnnotation)
        mapView.addAnnotation(lamarstatecollegeAnnotation)
        mapView.addAnnotation(holyfamilycatholicchurchAnnotation)
        mapView.addAnnotation(carlparkercenterAnnotation)
        mapView.addAnnotation(tonyburgeractivitycenterAnnotation)
        mapView.addAnnotation(lbjohnsonhighschoolAnnotation)
        mapView.addAnnotation(coldspringisdjonescampusAnnotation)
        mapView.addAnnotation(shepherdcommunitycenterAnnotation)
        mapView.addAnnotation(livingstoneschurchAnnotation)
        mapView.addAnnotation(cityofarcolacommunitycenter2Annotation)
        mapView.addAnnotation(redcrossshelteratlivingstonechurchAnnotation)
        mapView.addAnnotation(angletonisdAnnotation)
        mapView.addAnnotation(firstunitedmethodistchurchshelterAnnotation)
        mapView.addAnnotation(thecityactivitiesbuildingAnnotation)
        mapView.addAnnotation(mortonranchhsAnnotation)
        mapView.addAnnotation(underoverfellowshipAnnotation)
        mapView.addAnnotation(stsimonandjudeAnnotation)
        mapView.addAnnotation(lonestarconventioncenterAnnotation)
        mapView.addAnnotation(collegeparkhighAnnotation)
        mapView.addAnnotation(bullsalasparkAnnotation)
        mapView.addAnnotation(georgejuniorhighschoolAnnotation)
        mapView.addAnnotation(creeksidechristianfellowshipAnnotation)
        mapView.addAnnotation(christunitedmethodistchurchAnnotation)
        mapView.addAnnotation(sttheresacatholicchurchAnnotation)
        mapView.addAnnotation(marshallhighschoolemergencyshelterAnnotation)
        mapView.addAnnotation(redcrossshelteratbfterryhighschoolAnnotation)
        mapView.addAnnotation(kempnerhighschoolAnnotation)

        
        // where the map is centered around
        mapView.setRegion(nrgcenterAnnotation.region, animated: true)
        
        
        
       
        

    
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


    
    
    extension shelterViewController: MKMapViewDelegate {
        func mapView(_mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let shelterAnnotationView = _mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as?
                MKMarkerAnnotationView {
                shelterAnnotationView
                    .animatesWhenAdded = true
                shelterAnnotationView
                    .titleVisibility = .adaptive
                shelterAnnotationView
                    .titleVisibility = .adaptive
                
                return shelterAnnotationView
                
                // let btn = UIButton(type: .detailDisclosure)
                // shelterAnnotationView.rightCalloutAccessoryView = btn
                
            }
            
            
            
            
        return nil
    }

}
