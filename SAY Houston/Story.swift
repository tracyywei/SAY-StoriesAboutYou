//
//  Story.swift
//  SAY Houston
//
//  Created by Tracy Wei on 8/6/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import Firebase

// base/format of the story that will be saved to firebase 

class Story {
    
    var story:String
    var zipcode: String
    var disaster: String
    // var hearts: Int
    var timestamp:Double
    var consent: String
    
    init(story:String, zipcode:String,disaster:String, timestamp:Double, consent:String) {
        self.story = story
        self.zipcode = zipcode
        self.disaster = disaster
        // self.hearts = hearts
        self.timestamp = timestamp
        self.consent = consent
    }
    
}
