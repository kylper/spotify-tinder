//
//  SettingsViewController.swift
//  Spotify Project
//
//  Created by Ethan Horing on 12/19/16.
//  Copyright © 2016 Ethan and Kyle. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {
    /**
     Sent to the delegate when the button was used to login.
     - Parameter loginButton: the sender
     - Parameter result: The results of the login
     - Parameter error: The error (if any) from the login
     */

    override func viewDidLoad() {
        print("well well well")
        
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        print("ok")
        let firebaseAuth = FIRAuth.auth()
        //let manager = FBSDKLoginManager()
        do {
            try firebaseAuth?.signOut()
            //print("Successfully signed out in with our user: ", user ?? "")
//            manager.logOut()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    /*
    @IBAction func logOutButtonPressed(_ sender: Any) {
        print("ok")
        
        /*
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        */
        
    }
    
    /*
    @IBAction func logOutBarButton(_ sender: Any) {
        
        
        /*
        let settingsPage = self.storyboard?.instantiateViewController(withIdentifier: "settingscontroller") as! LoginViewController

        let settingsPageNav = UINavigationController (rootViewController: settingsPage)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = settingsPageNav*/
        
        
        
        print("oh noe!")
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        
        /*
        
        let loginPage = self.storyboard?.instantiateViewController(withIdentifier: "loginController") as! LoginViewController
        
        let loginPageNav = UINavigationController (rootViewController: loginPage)
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginPageNav */
        
        
        
        //segueToLogin()
            // User is logged in, use 'accessToken' here.
    }*/
    
    
    /*
    func segueToLogin() {
        self.performSegue(withIdentifier: "toLogin", sender: nil)
    }*/
 */
}




