//
//  LoginViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/6/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
import FirebaseAuth


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
//        loginButton.center = view.center
//        
//        view.addSubview(loginButton)
//
//        if let accessToken = AccessToken.current {
//            
//        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)

        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Error with sign in: " + error.localizedDescription)
                return
            }
            
        }
        
        print("USER IS SIGNED IN YAY")
        
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
