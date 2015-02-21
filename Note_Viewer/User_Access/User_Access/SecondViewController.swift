//
//  SecondViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/10.
//  Copyright (c) 2014年 team-g. All rights reserved.
//
//  *****授業選択画面*****

import Foundation
//
//  ViewController.swift
//  UIKit015
//

import UIKit

class SecondViewController: UIViewController {
    
    var myButtonBefore: UIButton!
    var myButtonToNote: UIButton!
    
    var lecture: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景に画像を設定する.
        let myImage = UIImage(named: "2.jpg")!
        var myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(-10, -28, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        // 背景色を設定.
//        self.view.backgroundColor = UIColor.blueColor()
        self.view.backgroundColor = UIColor.hexStr("79c0fe", alpha: 1)
        
        // UIボタンを作成
        myButtonBefore = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonBefore.backgroundColor = UIColor.redColor();
        myButtonBefore.layer.masksToBounds = true
        myButtonBefore.setTitle("go to top", forState: .Normal)
        myButtonBefore.layer.cornerRadius = 20.0
        myButtonBefore.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        myButtonBefore.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myButtonBefore);
        
        // ボタンの生成する.
        myButtonToNote = UIButton(frame: CGRectMake(0,0,220,50))
        myButtonToNote.backgroundColor = UIColor.redColor();
        myButtonToNote.layer.masksToBounds = true
        myButtonToNote.setTitle("Infomation Network", forState: .Normal)
        myButtonToNote.layer.cornerRadius = 20.0
        myButtonToNote.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-150)
        myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonToNote);
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義.
        let myViewController: UIViewController = FirstViewController()
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButtonToNext(sender: UIButton){
        
        // 遷移するViewを定義.
        let myViewController: UIViewController = ThirdViewController()
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}