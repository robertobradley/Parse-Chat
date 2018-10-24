//
//  ChatCell.swift
//  Parse Chat
//
//  Created by user144731 on 9/29/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit
import Parse



class ChatCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
