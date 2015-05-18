//
//  MessageCell.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/16/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    //TODO: instead of String, use Message object
    var message: String? {
        didSet {
            if let message = message {
                messageLabel.text = message
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
