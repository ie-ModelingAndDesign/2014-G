//
//  PDFViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/11.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import Foundation

import UIKit;

class PDFViewController: UIViewController ,UIWebViewDelegate{
    
    var webview: UIWebView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webview.frame = self.view.bounds
        self.webview.delegate = self;
        self.view.addSubview(self.webview)
        
        
        var url : NSURL!
        url = NSURL(string: "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/e135761.pdf")
        UIApplication.sharedApplication().openURL(url)
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        self.webview.loadRequest(urlRequest)
        
        //ボタンを作成する記述
        var button :UIButton =
        UIButton(frame: CGRectMake(270, 590, 100, 50));
        button.backgroundColor =
            UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0);
        button.addTarget(self, action: "btn:", forControlEvents:.TouchUpInside);
        button.setTitle("return", forState: .Normal);
        button.setTitleColor(UIColor.blueColor(), forState: .Normal);
        
        //これで枠が作られ、少し角が丸くなる
        button.layer.cornerRadius = 10;
        button.layer.borderWidth = 1;
        
        //Viewに追加
        self.view.addSubview(button);
    }
    
    //ボタンがタップされたときの処理メソッド
    func btn(sender: UIButton) {
        // 遷移するViewを定義.
        // ここでURLに飛ぶようにしたい
        let myViewController: UIViewController = ThirdViewController()
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
}