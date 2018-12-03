//
//  Story.swift
//  SAY Houston
//
//  Created by Tracy Wei on 8/6/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import Foundation
import Firebase

class Story {
    
    var story:String
    var zipcode: String
    var disaster: String
    var hearts: Int
    var timestamp:Double
    
    init(story:String, zipcode:String,disaster:String, hearts: Int, timestamp:Double) {
        self.story = story
        self.zipcode = zipcode
        self.disaster = disaster
        self.hearts = hearts
        self.timestamp = timestamp
        
    }
    
}
