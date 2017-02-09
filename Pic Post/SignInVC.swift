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

}

