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

class FirstViewController: UIViewController {
    
    var myButtonNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定する.
        self.view.backgroundColor = UIColor.hexStr("79c0fe", alpha: 1)
        
        // ボタンの生成する.
        myButtonNext = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonNext.backgroundColor = UIColor.redColor();
        myButtonNext.layer.masksToBounds = true
        myButtonNext.setTitle("e13", forState: .Normal)
        myButtonNext.layer.cornerRadius = 20.0
        myButtonNext.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        myButtonNext.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonNext);
        
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義する.
        let mySecondViewController: UIViewController = SecondViewController()
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        // Viewの移動する.
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}