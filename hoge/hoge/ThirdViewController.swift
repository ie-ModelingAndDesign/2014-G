//
//  ThirdViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/11.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  UIKit015
//

import UIKit

class ThirdViewController: UIViewController {
    
    var myButtonBefore: UIButton!
    var myButtonToNote: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定.
        self.view.backgroundColor = UIColor.blueColor()
        
        // ボタンの生成する.
        myButtonToNote = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonToNote.backgroundColor = UIColor.redColor();
        myButtonToNote.layer.masksToBounds = true
        myButtonToNote.setTitle("HogeNote", forState: .Normal)
        myButtonToNote.layer.cornerRadius = 20.0
        myButtonToNote.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-150)
        myButtonToNote.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonToNote);
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義.
        // ここでURLに飛ぶようにしたい
        let myViewController: UIViewController = PDFViewController()
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}