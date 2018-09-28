//
//  ChatViewController.swift
//  Parse Chat
//
//  Created by user144731 on 9/28/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit
import Parse




class ChatViewController: UIViewController {
    @IBOutlet weak var chatMessageField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSend(_ sender: Any)
    {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
 

}
