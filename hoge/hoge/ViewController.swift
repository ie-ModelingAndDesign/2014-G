//
//  ViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/04.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // サイズを設定する.
        myButton.frame = CGRectMake(0,0,180,40)
        
        // 背景色を設定する.
        myButton.backgroundColor = UIColor.blueColor()
        
        // 枠を丸くする.
        myButton.layer.masksToBounds = true
        
        // タイトルを設定する(通常時).
        myButton.setTitle("e13", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        //myButton.setTitle("ボタン(押された時)", forState: UIControlState.Highlighted)
        //myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0
        
        // ボタンの位置を指定する.
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        // タグを設定する.
        myButton.tag = 1
        
        // イベントを追加する.
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    ボタンイベント.
    */
    func onClickMyButton(sender: UIButton){
        println("onClickMyButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        
    }

}

