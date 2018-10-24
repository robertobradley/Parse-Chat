//
//  ChatViewController.swift
//  Parse Chat
//
//  Created by user144731 on 9/28/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit
import Parse




class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var chatMessageField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    var messages : [PFObject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.rowHeight = UITableViewAutomaticDimension
        chatTableView.estimatedRowHeight = 50
        
        fetchMessage()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

       
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSend(_ sender: Any)
    {
        let chatMessage = PFObject(className: "Message")
        chatMessage["user"] = PFUser.current()
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
    @objc func onTimer() {
        fetchMessage()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
          cell.messageLabel.text = messages[indexPath.row]["text"] as? String
        if let user = messages[indexPath.row]["user"] as? PFUser {
            // User found! update username label with username
            cell.usernameLabel.text = user.username
        } else {
            // No user found, set default username
            cell.usernameLabel.text = "🤖"
        }
        
        
        return cell
    }
    func fetchMessage(){
        // construct query
        let query = Message.query()
        query?.includeKey("user")
        query?.addDescendingOrder("createdAt")
        query?.limit = 20
        
        // fetch data asynchronously
        query?.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if let messages = messages {
                // do something with the array of object returned by the call
                self.messages = messages
                self.chatTableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
 

}
