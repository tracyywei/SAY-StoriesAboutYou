//
//  storyTableViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/27/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import Firebase

class storyTableViewController: UITableViewController {
    
    let ref = Database.database().reference(withPath: "stories")
    
    
    @IBAction func addStory(_ sender: Any) {
        performSegue(withIdentifier: "addsStory", sender: self)
    }
    
    
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    
    var stories = [Story]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "storyTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "storyTableViewCell")

        observeStories()
        
    }
    
    // grouping all of the stories to be reloaded and displayed
    func observeStories() {
        let storiesRef = Database.database().reference().child("stories")
        
        storiesRef.observe(.value, with: { snapshot in
            
            var tempStories = [Story]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let story = dict["story"] as? String,
                    let zipcode = dict["zipcode"] as? String,
                    let disaster = dict["disaster"] as? String,
                    // let hearts = dict["hearts"] as? Int,
                    let timestamp = dict["timestamp"] as? Double,
                    let consent = dict["consent"] as? String
                    {
                    let story = Story(story: story, zipcode: zipcode, disaster: disaster, timestamp: timestamp, consent: consent)
                    tempStories.append(story)
                    
                }
            }
            
            self.stories = tempStories
            self.tableView.reloadData()
            
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // adding the stories to the tableview
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyTableViewCell", for: indexPath) as! storyTableViewCell
        let story: Story
        
        
        story = stories[indexPath.row]
        
        
        cell.storyText.text = story.story
        cell.zipcodeText.text = story.zipcode
        cell.disasterText.text = story.disaster
        // cell.heartsCount.text = "\(story.hearts)"
        
        
        return cell
    }
    
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}


