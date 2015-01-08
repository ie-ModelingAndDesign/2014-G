//
//  ViewController.swift
//  User_Access_Google
//
//  Created by yonamineryo on 2015/01/08.
//  Copyright (c) 2015年 yonamineryo. All rights reserved.
//

import UIKit

//G+
import AddressBook
import MediaPlayer
import Assetslibrary
import CoreLocation
import CoreMotion

class ViewController: UIViewController,GPPSignInDelegate {
    
    var signIn: GPPSignIn?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Configre Google login
        signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.clientID = "useraccess-ie13"
        signIn?.scopes = [kGTLAuthScopePlusLogin]
        signIn?.delegate = self
        signIn?.authenticate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWithAuth(auth: GTMOAuth2Authentication?, error: NSError?) {
        println(auth)
    }
    
    func didDisconnectWithError(erro: NSError?) {
        
    }

}

