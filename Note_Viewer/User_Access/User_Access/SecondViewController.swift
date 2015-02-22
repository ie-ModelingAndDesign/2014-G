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

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var myButtonBefore: UIButton!
    var myButtonToNote: UIButton!
    
    
    var information: [[String]]!
    var lecture: [String]!
    
    var num: Int!
    
    // UIPickerView.
    var myUIPicker: UIPickerView = UIPickerView()
    
    // 表示する値の配列.
    var myValues: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 背景に画像を設定する.
        let myImage = UIImage(named: "2.jpg")!
        var myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(-10, -28, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        
        
        //-------------------------
        // サイズを指定する.
        myUIPicker.frame = CGRectMake(0,self.view.bounds.height/2,self.view.bounds.width, 180.0)
        myUIPicker.backgroundColor = UIColor.grayColor()
        // Delegateを設定する.
        myUIPicker.alpha = 0.7
        myUIPicker.delegate = self
        
        for n in lecture {
            var i: Int = 0
            if (n == "0") {
                lecture.removeAtIndex(i)
            }
            i++
        }
        
        myValues = lecture
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        //-------------------
        
        //// ボタンの生成する.
        myButtonToNote = UIButton(frame: CGRectMake(0,0,100,50))
        myButtonToNote.backgroundColor = UIColor.redColor();
        myButtonToNote.layer.masksToBounds = true
        myButtonToNote.setTitle("OK", forState: .Normal)
        myButtonToNote.layer.cornerRadius = 20.0
        myButtonToNote.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-120)
        //myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButtonToNote);
        
        myButtonToNote.tag = 0
        myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
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
        
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        //self.dismissViewControllerAnimated(true, completion: nil)
        
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
        
        var rownum = sender.tag
        
        let myViewController = ThirdViewController()
        myViewController.information = information
        var temp:[String] = ["0", "0"]
        for var i=1; i<information.count; i+=2 {
            temp[i] = information[rownum][i]
        }
        myViewController.notename = temp
        myViewController.num = rownum
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
        
        //// 遷移するViewを定義.
        //let myViewController: UIViewController = ThirdViewController()
        //
        //// アニメーションを設定.
        //myViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
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
            // 遷移するViewを定義.
            
        //mySecondViewController.information = b2
        //var temp: [String] = ["0", "0"]
        //for var i=0; i<b2.count; i++ {
        //    temp[i] = b2[i][0]
        //}
        //mySecondViewController.lecture = temp
            
            myButtonToNote.tag = 0
            myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: UIControlEvents.TouchUpInside)
            
            //let myViewController = ThirdViewController()
            //myViewController.information = information
            //var temp:[String] = ["0", "0"]
            //for var i=1; i<information.count; i+=2 {
            //    temp[i] = information[0][i]
            //}
            //myViewController.notename = temp
            //myViewController.num = 0
            //
            //// アニメーションを設定.
            //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            //
            //// Viewの移動.
            //self.presentViewController(myViewController, animated: true, completion: nil)

        } else if row == 1 {
            
            var rownum: Int = 1
            
            // 遷移するViewを定義.
            //let myViewController = ThirdViewController()
            //var temp:String = "0"
            //temp = information[1][1]
            
            myButtonToNote.tag = 1
            myButtonToNote.addTarget(self, action: "onClickMyButtonToNext:", forControlEvents: UIControlEvents.TouchUpInside)
            
            //let myViewController = ThirdViewController()
            //myViewController.information = information
            //var temp:[String] = ["0", "0"]
            //for (var i=1; i<information.count; i+=2) {
            //    temp[i] = information[1][i]
            //}
            //myViewController.notename = temp
            //myViewController.num = 1
            //
            //// アニメーションを設定.
            //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            //
            //// Viewの移動.
            //self.presentViewController(myViewController, animated: true, completion: nil)

            
        //// 遷移するViewを定義.
        //// ここでURLに飛ぶようにしたい
        ////let noteurl = "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information/information6.pdf"
        ////let myViewController: UIViewController = PDFViewController(noteurl)
        //let myViewController = ThirdViewController()
        ////myViewController.noteurl = noteurl
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