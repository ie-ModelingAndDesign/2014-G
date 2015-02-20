//
//  FirstViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/10.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import Foundation

//
//  FirstViewController.swift
//  UIKit015
//

import UIKit
import Foundation

class FirstViewController: UIViewController {
    
    var myButtonNext: UIButton!
    var myButtonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景に画像を設定する.
        let myImage = UIImage(named: "2.jpg")!
        var myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(-10, -28, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        // 背景色を設定する.
        self.view.backgroundColor = UIColor.hexStr("79c0fe", alpha: 1)
        
        // ボタンの生成する.
        // 学年選択ボタン
        myButtonNext = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonNext.backgroundColor = UIColor.redColor();
        myButtonNext.layer.masksToBounds = true
        myButtonNext.setTitle("e13", forState: .Normal)
        myButtonNext.layer.cornerRadius = 20.0
        myButtonNext.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-150)
        myButtonNext.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonNext);
        
        
        // ボタンの生成する.
        // logoutするボタン
        myButtonLogout = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonLogout.backgroundColor = UIColor.redColor();
        myButtonLogout.layer.masksToBounds = true
        myButtonLogout.setTitle("logout", forState: .Normal)
        myButtonLogout.layer.cornerRadius = 20.0
        myButtonLogout.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        myButtonLogout.addTarget(self, action: "onClickMyButtonLogout:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonLogout);
        
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義する.
        // 次の授業選択に移動する
        let mySecondViewController: UIViewController = SecondViewController()
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動する.
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }
    
    func onClickMyButtonLogout(sender: UIButton){
        FBSession.activeSession().closeAndClearTokenInformation()
        
        var alert = UIAlertView()
        alert.title = "Logout"
        alert.message = "ログアウトしました．わずらわしいけどアプリを再起動してください"
        alert.addButtonWithTitle("OK")
        alert.show()
        
        //// 次の授業選択に移動する
        //let moveToViewController: UIViewController = ViewController()
        //
        //// アニメーションを設定する.
        //moveToViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        //
        //// Viewの移動する.
        //self.presentViewController(moveToViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}