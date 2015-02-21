//
//  FirstViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/10.
//  Copyright (c) 2014年 team-g. All rights reserved.
//
//  *****学年選択画面*****

import Foundation

//
//  FirstViewController.swift
//  UIKit015
//

import UIKit
import Foundation

class FirstViewController: UIViewController {
    
    var e13: UIButton!
    var e14: UIButton!
    var myButtonLogout: UIButton!
    
    var b1: [String] = ["工業数学1"]
    var b2: [String] = ["情報ネットワーク2", "計算機アーキテクチャ"]
    
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
        e13 = UIButton(frame: CGRectMake(0,0,120,50))
        e13.backgroundColor = UIColor.redColor();
        e13.layer.masksToBounds = true
        e13.setTitle("e13", forState: .Normal)
        e13.layer.cornerRadius = 20.0
        e13.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
        e13.addTarget(self, action: "onClickMyButtonToe13:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(e13);
        
        // ボタンの生成する.
        // 学年選択ボタン
        //e14 = UIButton(frame: CGRectMake(0,0,120,50))
        //e14.backgroundColor = UIColor.redColor();
        //e14.layer.masksToBounds = true
        //e14.setTitle("e14", forState: .Normal)
        //e14.layer.cornerRadius = 20.0
        //e14.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-130)
        //e14.addTarget(self, action: "onClickMyButtonToe13:", forControlEvents: .TouchUpInside)
        //
        //// ボタンを追加する.
        //self.view.addSubview(e14);
        
        
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
    func onClickMyButtonToe13(sender: UIButton){
        
        // 遷移するViewを定義する.
        // 次の授業選択に移動する
        let mySecondViewController = SecondViewController()
        mySecondViewController.lecture = b2
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動する.
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButtonToe14(sender: UIButton){
        
        
        // 遷移するViewを定義する.
        // 次の授業選択に移動する
        let mySecondViewController = SecondViewController()
        mySecondViewController.lecture = b1
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動する.
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }
    
    func onClickMyButtonLogout(sender: UIButton){
        FBSession.activeSession().closeAndClearTokenInformation()
        
        var alert = UIAlertView()
        alert.title = "Logout"
        alert.message = "ログアウトしました"
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