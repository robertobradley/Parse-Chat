//
//  LoginViewController.swift
//  Parse Chat
//
//  Created by Roberto Bradley on 9/28/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit
import Parse



class LoginViewController: UIViewController {

//--OUTLETS--//
@IBOutlet weak var usernameField: UITextField!
@IBOutlet weak var passwordField: UITextField!

//------VARIABLES------//
//                       uialertcontroller
let alertController = UIAlertController(title: "Error", message: "Both Fields are empty. \nPlease enter username and password", preferredStyle: .alert)
    
let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
let OKAction = UIAlertAction(title: "OK", style: .default)
    { (action) in
        // handle response here.
    }

    
    //--OVERIDE FUNCTIONS--//
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.addAction(OKAction)
        
        
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//--FUNCTIONS--//
    
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }

    
    func loginUser() {
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any)
    {
        if (usernameField.text == "") || (passwordField.text == "")
        {
            present(alertController, animated: true)
        }
        else {
            loginUser()
        }
        
    }
    
    @IBAction func onSIgnUp(_ sender: Any)
    {
        if (usernameField.text == "") || (passwordField.text == "")
        {
            present(alertController, animated: true)
        }
        else {
            registerUser()
        }
    }
    
}
