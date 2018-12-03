//
//  storyTableViewCell.swift
//  SAY Houston
//
//  Created by Tracy Wei on 11/4/18.
//  Copyright © 2018 Game Changers. All rights reserved.
//

import UIKit
import Firebase

class storyTableViewCell: UITableViewCell {


    @IBOutlet weak var zipcodeText: UILabel!
    @IBOutlet weak var disasterText: UILabel!
    @IBOutlet weak var storyText: UITextView!
    @IBOutlet weak var heartsCount: UILabel!
    @IBOutlet weak var heartImage: UIImageView!
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(story:Story) {
        storyText.text = story.story
        zipcodeText.text = story.zipcode
        disasterText.text = story.disaster
        heartsCount.text = "\(story.hearts)"
        
    
}
    
    
}
