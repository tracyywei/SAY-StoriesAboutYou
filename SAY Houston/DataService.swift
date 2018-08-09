//
//  DataService.swift
//  SAY Houston
//
//  Created by Tracy Wei on 8/2/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    var ref: DatabaseReference!
    
    ref = Database.database().reference()
    
    static let dataService = DataService()
    
    private var _BASE_REF = Firebase(url: "\(BASE_URL)")
    private var _USER_REF = Firebase(url: "\(BASE_URL)/users")
    private var _STORY_REF = Firebase(url: "\(BASE_URL)/stories")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var CURRENT_USER_REF: Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        
        return currentUser!
    }
    
    var STORY_REF: Firebase {
        return _STORY_REF
    }
    

    func signUp(uid: String, user: Dictionary<String, String>) {
        
        // A User is born.
        
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
    
    
    func createNewStory(story: Dictionary<String, AnyObject>) {
        
        // Save the Joke
        // JOKE_REF is the parent of the new Joke: "jokes".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewStory = STORY_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewStory.setValue(story)
    }
}
