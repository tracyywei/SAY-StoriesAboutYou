//
//  storyTableViewController.swift
//  SAY Houston
//
//  Created by Tracy Wei on 7/27/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit

class storyTableViewController: UITableViewController {
    
    @IBOutlet weak var totalLikes: UILabel!
    
    @IBOutlet weak var zipcodeField: UILabel!
    @IBOutlet weak var storyField: UITextView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var disasterCategory: UILabel!
    
    @IBAction func addStory(_ sender: Any) {
        performSegue(withIdentifier: "addStory", sender: self)
    }
    
    @IBAction func logout(_ sender: Any) {
        // unauth() is the logout method for the current user.
        
        DataService.dataService.CURRENT_USER_REF.unauth()
        
        // Remove the user's uid from storage.
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        
        // Head back to Login!
        
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }
    
    var stories = [Story]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.dataService.STORY_REF.observeEventType(.Value, withBlock: { snapshot in
            
            // The snapshot is a current look at our jokes data.
            
            print(snapshot.value)
            
            self.stories = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    // Make our jokes array for the tableView.
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let story = Story(key: key, dictionary: postDictionary)
                        
                        // Items are returned chronologically, but it's more fun with the newest jokes first.
                        
                        self.stories.insert(joke, atIndex: 0)
                    }
                }
                
            }
            
            // Be sure that the tableView updates when there is new data.
            
            self.tableView.reloadData()
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stories.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let story = stories[indexPath.row]
        
        // We are using a custom cell.
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("StoryCellTableViewCell") as? StoryCellTableViewCell {
            
            // Send the single joke to configureCell() in JokeCellTableViewCell.
            
            cell.configureCell(story)
            
            return cell
            
        } else {
            
            return StoryCellTableViewCell()
            
        }
    }
   
    func configureCell(story: Story) {
        self.story = story
        
        // Set the labels and textView.
        
        self.storyField.text = story.storyText
        self.totalLikes.text = "\(story.storyVotes)"
        self.zipcodeField.text = story.username
        
        // Set "votes" as a child of the current user in Firebase and save the joke's key in votes as a boolean.
        
        storyRef = DataService.dataService.CURRENT_USER_REF.childByAppendingPath("likes").childByAppendingPath(story.storyKey)
        
        // observeSingleEventOfType() listens for the thumb to be tapped, by any user, on any device.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // Set the thumb image.
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                
                // Current user hasn't voted for the joke... yet.
                
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "thumb-down")
            } else {
                
                // Current user voted for the joke!
                
                self.heartImage.image = UIImage(named: "heart")
            }
        })
        
        var story: Story!
        var likeRef: Firebase!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            // UITapGestureRecognizer is set programatically.
            
            let tap = UITapGestureRecognizer(target: self, action: "likeTapped:")
            tap.numberOfTapsRequired = 1
            thumbVoteImage.addGestureRecognizer(tap)
            thumbVoteImage.userInteractionEnabled = true
        }
        
        func likeTapped(sender: UITapGestureRecognizer) {
            
            // observeSingleEventOfType listens for a tap by the current user.
            
            likeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
                
                if let thumbsUpDown = snapshot.value as? NSNull {
                    print(thumbsUpDown)
                    self.thumbVoteImage.image = UIImage(named: "thumb-down")
                    
                    // addSubtractVote(), in Joke.swift, handles the vote.
                    
                    self.story.addSubtractVote(true)
                    
                    // setValue saves the vote as true for the current user.
                    // voteRef is a reference to the user's "votes" path.
                    
                    self.likeeRef.setValue(true)
                } else {
                    self.thumbVoteImage.image = UIImage(named: "thumb-up")
                    self.story.addSubtractVote(false)
                    self.likeRef.removeValue()
                }
                
            })
        }
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
