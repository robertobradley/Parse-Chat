//
//  Message.swift
//  Parse Chat
//
//  Created by user144731 on 10/20/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//
import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    
    
    
    @NSManaged var message: String
    
    
    
    class func parseClassName() -> String {
        
        return "Message"
        
    }
    
    
    
}
