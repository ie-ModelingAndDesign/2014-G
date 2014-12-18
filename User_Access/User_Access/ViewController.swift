//
//  ViewController.swift
//  User_Access
//
//  Created by Hiroyuki Tengan on 2014/12/15.
//  Copyright (c) 2014年 Hiroyuki Tenngann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet var currentUserName : UILabel!
    @IBOutlet var currentUserEmail : UILabel!
    @IBOutlet var userImage : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    //Facebook Delagate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue.")
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println("User Name: \(user.name)")
        var profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: "https://graph.facebook.com/\(user.objectID)/picture?type=large")!)!) // プロフィール画像の取得
        self.userImage.clipsToBounds = true // 画像にレイヤーをつけて、
        self.userImage.layer.cornerRadius = 60 // 円形にする
        
        self.userImage.image = trimPicture(profileImage!) // 画像をトリミング
        self.currentUserName.text = user.name
        self.currentUserEmail.text = user.objectForKey("email") as? String


    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
        self.userImage.image = nil
        self.currentUserName.text = "You're not logged in!"
        self.currentUserEmail.text = ""
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    // プロフィール画像のトリミングするための関数
    func trimPicture(rawPic:UIImage) -> UIImage {
        var rawImageW = rawPic.size.width
        var rawImageH = rawPic.size.height
        
        
        var posX = (rawImageW - 200) / 2
        var posY = (rawImageH - 200) / 2
        var trimArea : CGRect = CGRectMake(posX, posY, 200, 200)
        
        var rawImageRef:CGImageRef = rawPic.CGImage
        var trimmedImageRef = CGImageCreateWithImageInRect(rawImageRef, trimArea)
        var trimmedImage : UIImage = UIImage(CGImage : trimmedImageRef)!
        return trimmedImage
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

