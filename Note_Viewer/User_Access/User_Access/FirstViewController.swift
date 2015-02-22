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
    
    var b1: [[String]] = [["アルゴリズムとデータ構造", "レポート", "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/algo/algo3.pdf"],["工業数学1", "期末テスト", "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/kosu1/kosu.pdf"]]
    var b2: [[String]] = [["情報ネットワーク2", "第六回講義", "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information/information6.pdf"], ["計算機アーキテクチャ", "課題", "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/architecture/e135761.pdf"]]
    //var b1: [String] = ["工業数学1"]
    //var b2: [String] = ["情報ネットワーク2", "計算機アーキテクチャ"]
    
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
        e14 = UIButton(frame: CGRectMake(0,0,120,50))
        e14.backgroundColor = UIColor.redColor();
        e14.layer.masksToBounds = true
        e14.setTitle("e14", forState: .Normal)
        e14.layer.cornerRadius = 20.0
        e14.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-130)
        e14.addTarget(self, action: "onClickMyButtonToe14:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(e14);
        
        
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
        
        //for lec in b2 {
        //    var i: Int = 0
        //    mySecondViewController.lecture[i] = b2[i][0]
        //    i++
        //}
        
        mySecondViewController.information = b2
        var temp: [String] = ["0", "0"]
        for var i=0; i<b2.count; i++ {
            temp[i] = b2[i][0]
        }
        mySecondViewController.lecture = temp
        //mySecondViewController.lecture = b2
        //mySecondViewController.lecture = b2
        //
        //var innote: [String] = ["第六回講義"]
        //var archinote: [String] = ["課題"]
        
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
        mySecondViewController.information = b1
        var temp: [String] = ["0","0"]
        for var i=0; i<b1.count; i++ {
            temp[i] = b1[i][0]
        }
        mySecondViewController.lecture = temp
        //mySecondViewController.num = 0
        
        //mySecondViewController.lecture[0] = b1[0][0]
        
        
        //for lec in b1 {
        //    var i: Int = 0
        //    mySecondViewController.lecture[i] = b1[i][0]
        //    i++
        //}
        
        //for var i=0; i<=b1.count; i++ {
        //    mySecondViewController.lecture[i] = b1[i][0]
        //}
        
        //var note: [String] = ["期末テスト"]
        
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動する.
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }
    
    func onClickMyButtonLogout(sender: UIButton){
        FBSession.activeSession().closeAndClearTokenInformation()
        
        if objc_getClass("UIAlertController") != nil {
            //UIAlertController使用
            var alert = UIAlertController(title: "確認", message: "ログアウトしてもよろしいですか？", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                println("Cancel button tapped.")
            }
            
            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                println("OK button tapped.")
                let moveToViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Main") as UIViewController
                //let moveToViewController: UIViewController = MainViewController()
                moveToViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
                self.presentViewController(moveToViewController, animated: true, completion: nil)
            }
            
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            
            presentViewController(alert, animated: true, completion: nil)
            
        } else {
            //UIAlertView使用
            /*var av = UIAlertView(title: "Title", message:"Message", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
            av.show()*/
        }
        
        /*var alert = UIAlertView()
        alert.title = "Logout"
        alert.message = "ログアウトしました"
        alert.addButtonWithTitle("OK")
        alert.show()*/
        
        
        
        //self.dismissViewControllerAnimated(true, completion: nil)
        //self.dismissViewControllerAnimated(true, completion: nil)
        
       //// 次の授業選択に移動する
       //let moveToViewController: UIViewController = ViewController()
       //
       //// アニメーションを設定する.
       //moveToViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
       //
       //// Viewの移動する.
       //self.presentViewController(moveToViewController, animated: true, completion: nil)
       
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            //Canceled
        } else {
            //OK
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}