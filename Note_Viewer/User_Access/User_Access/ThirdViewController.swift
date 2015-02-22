//
//  ThirdViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/11.
//  Copyright (c) 2014年 team-g. All rights reserved.
//
//  *****ノート選択画面*****

import Foundation
//
//  ViewController.swift
//  UIKit015
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    // UIPickerView.
    var myUIPicker: UIPickerView = UIPickerView()
    
    // 表示する値の配列.
    var temp: [String]!
    var myValues: NSArray!
    
    var information: [[String]]!
    var notename: [String]!
    var num: Int!
    
    var myButtonBefore: UIButton!
    var myButtonToNote: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景に画像を設定する.
        let myImage = UIImage(named: "2.jpg")!
        var myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(-10, -28, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        for n in notename {
            var i: Int = 0
            if (n == "0") {
                notename.removeAtIndex(i)
            }
            i++
        }
        
        myValues = notename
        
        
        //-------------------------
        // サイズを指定する.
        myUIPicker.frame = CGRectMake(0,self.view.bounds.height/2,self.view.bounds.width, 180.0)
        myUIPicker.backgroundColor = UIColor.grayColor()
        // Delegateを設定する.
        myUIPicker.alpha = 0.7
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        //-------------------

        // ボタンの生成する.
        myButtonToNote = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonToNote.backgroundColor = UIColor.redColor();
        myButtonToNote.layer.masksToBounds = true
        myButtonToNote.setTitle("OK", forState: .Normal)
        myButtonToNote.layer.cornerRadius = 20.0
        myButtonToNote.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-120)
        //myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
        myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonToNote);
        
        // 背景色を設定.
        //self.view.backgroundColor = UIColor.blueColor()
        self.view.backgroundColor = UIColor.hexStr("79c0fe", alpha: 1)
        
        
        // UIボタンを作成
        myButtonBefore = UIButton(frame: CGRectMake(0,0,120,50))
        myButtonBefore.backgroundColor = UIColor.redColor();
        myButtonBefore.layer.masksToBounds = true
        myButtonBefore.setTitle("go back", forState: .Normal)
        myButtonBefore.layer.cornerRadius = 20.0
        myButtonBefore.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        myButtonBefore.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myButtonBefore);
        
        // ボタンを追加する.
        self.view.addSubview(myButtonToNote);
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButtonToNext(sender: UIButton){
        
        //// 遷移するViewを定義.
        //let myViewController: UIViewController = SecondViewController()
        let myViewController = PDFViewController()
        var temp: String = "0"
        temp = information[num][2]
        myViewController.noteurl = temp
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
        
        //// 遷移するViewを定義.
        //// ここでURLに飛ぶようにしたい
        //let noteurl = "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information/information6.pdf"
        ////let myViewController: UIViewController = PDFViewController(noteurl)
        //let myViewController = PDFViewController()
        //myViewController.noteurl = noteurl
        //
        //// アニメーションを設定.
        //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //
        //// Viewの移動.
        //self.presentViewController(myViewController, animated: true, completion: nil)
        ////self.presentViewController(Filereader(), animated: true, completion: nil)
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //// 遷移するViewを定義.
        //let myViewController: UIViewController = SecondViewController()
        //
        //// アニメーションを設定.
        //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //
        //// Viewの移動.
        //self.presentViewController(myViewController, animated: true, completion: nil)
    }

    //---------------
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    表示するデータ数を返す.
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    /*
    値を代入する.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return myValues[row] as String
    }
    
    /*
    Pickerが選択された際に呼ばれる.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //println("row: \(row)")
        //println("value: \(myValues[row])")
        
        if row == 0 {
            
            myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
            
            ////// 遷移するViewを定義.
            ////let myViewController: UIViewController = SecondViewController()
            //let myViewController = PDFViewController()
            //var temp: String = "0"
            //temp = information[num][2]
            //myViewController.noteurl = temp
            //// アニメーションを設定.
            //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            //
            //// Viewの移動.
            //self.presentViewController(myViewController, animated: true, completion: nil)

        } else if row == 1 {
            
            myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
            
            //// 遷移するViewを定義.
            //// ここでURLに飛ぶようにしたい
            ////let noteurl = "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information/information6.pdf"
            ////let myViewController: UIViewController = PDFViewController(noteurl)
            //let myViewController = PDFViewController()
            //var temp: String = "0"
            //temp = information[num][2]
            //myViewController.noteurl = temp
            //
            //// アニメーションを設定.
            //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            //
            //// Viewの移動.
            //self.presentViewController(myViewController, animated: true, completion: nil)
            ////self.presentViewController(Filereader(), animated: true, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}