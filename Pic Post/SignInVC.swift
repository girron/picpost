//
//  SignInVC.swift
//  Pic Post
//
//  Created by Henry Swanson on 2/4/17.
//  Copyright © 2017 Henry Swanson. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                
                print("JAKE: Unable to authenticate with Facebook - \(error)")
                
            } else if result?.isCancelled == true {
                
                print("JAKE: User cancelled Facebook authentication")
                
            } else {
                
                print("JAKE: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JAKE: Unable to authenticate with Firebase - \(error)")
                
            } else {
                
                print("JAKE: Successfully authenticated with Firebase")
            }
        })
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JAKE: Email User authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JAKE: Unable to authenticated with Firebase user email")
                        } else {
                            print("JAKE: Successfully authenticate Firebase")
                        }
                    })
                }
            })
        }
        
    }

}

