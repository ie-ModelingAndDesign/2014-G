//
//  PDFViewController.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/11.
//  Copyright (c) 2014年 team-g. All rights reserved.
//
//  *****ノート閲覧画面*****

import Foundation

import UIKit;

class PDFViewController: UIViewController, UIWebViewDelegate {
    
    var webview: UIWebView = UIWebView()
    
    var myButtonToBack: UIButton!
    var nextpage: UIButton!
    var backpage: UIButton!
    var page :UInt = 1
    var number_of_page :UInt!
   //
    var noteurl : String!
   // init(url: String) {
   //     self.noteurl = url
   // }
    override func viewDidLoad() {
        super.viewDidLoad()
        //var url = NSURL(string :noteurl)
        //var url = NSURL(string: "http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information6.pdf")
        //var url:NSURL! = NSBundle.mainBundle().URLForResource("http://ie.u-ryukyu.ac.jp/~e135761/PostingNote/information6.pdf", withExtension:nil)
        //var pdf:CGPDFDocumentRef = CGPDFDocumentCreateWithURL(url);
        //var rect = UIScreen.mainScreen().bounds;
        
        //number_of_page = CGPDFDocumentGetNumberOfPages(pdf)
        
        //var myview:PDFView = PDFView(frame:rect);
        //myview._pdfPage = CGPDFDocumentGetPage(pdf, page)
        //myview._pdfPage = CGPDfDocument
        //self.view.addSubview(myview)
        
        //
        self.webview.frame = self.view.bounds
        self.webview.delegate = self;
        self.view.addSubview(self.webview)
        
        var url = NSURL(string :noteurl)
        var urlRequest: NSURLRequest = NSURLRequest(URL: url!)
        self.webview.loadRequest(urlRequest)
        //
        
        
        myButtonToBack = UIButton(frame: CGRectMake(0,0,90,40))
        myButtonToBack.backgroundColor = UIColor.redColor();
        myButtonToBack.layer.masksToBounds = true
        myButtonToBack.setTitle("back", forState: .Normal)
        myButtonToBack.layer.cornerRadius = 20.0
        myButtonToBack.layer.position = CGPoint(x: self.view.bounds.width*3/4 , y:self.view.bounds.height-35)
        myButtonToBack.addTarget(self, action: "btn:", forControlEvents: .TouchUpInside)
        
        //Viewに追加
        self.view.addSubview(myButtonToBack);
        
        //nextpage = UIButton(frame: CGRectMake(0,0,70,40))
        //nextpage.backgroundColor = UIColor.redColor();
        //nextpage.layer.masksToBounds = true
        //nextpage.setTitle(" => ", forState: .Normal)
        //nextpage.layer.cornerRadius = 20.0
        //nextpage.layer.position = CGPoint(x: self.view.bounds.width*2/4 , y:self.view.bounds.height-35)
        //nextpage.addTarget(self, action: "next:", forControlEvents: .TouchUpInside)
        //
        ////Viewに追加
        //self.view.addSubview(nextpage);
        //
        //backpage = UIButton(frame: CGRectMake(0,0,70,40))
        //backpage.backgroundColor = UIColor.redColor();
        //backpage.layer.masksToBounds = true
        //backpage.setTitle(" <= ", forState: .Normal)
        //backpage.layer.cornerRadius = 20.0
        //backpage.layer.position = CGPoint(x: self.view.bounds.width*1/4 , y:self.view.bounds.height-35)
        //backpage.addTarget(self, action: "back:", forControlEvents: .TouchUpInside)
        //
        ////Viewに追加
        //self.view.addSubview(backpage);
        
    }

    func didReceieveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    
    //func next(sender: UIButton) {
    //    if (page < number_of_page) {
    //        UIModalTransitionStyle.FlipHorizontal
    //        page += 1
    //        viewDidLoad()
    //    }
    //}
    //
    //func back(sender: UIButton) {
    //    if (page > 1) {
    //        UIModalTransitionStyle.FlipHorizontal
    //        page -= 1
    //        viewDidLoad()
    //    }
    //}
    
    
    //ボタンがタップされたときの処理メソッド
    func btn(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //// 遷移するViewを定義.
        //let myViewController: UIViewController = ThirdViewController()
        //
        //// アニメーションを設定.
        //myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //
        //// Viewの移動.
        //self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
}

class PDFView: UIView {
    var _pdfPage: CGPDFPageRef?
    override func drawRect(rect: CGRect){
        var context:CGContextRef = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, 0, -CGRectGetHeight(rect));
        var pdfRect:CGRect = CGPDFPageGetBoxRect(_pdfPage, kCGPDFArtBox)
        CGContextScaleCTM(context,
            rect.size.width/pdfRect.size.width,
                          rect.size.height/pdfRect.size.height)
         CGContextDrawPDFPage(context, _pdfPage)
    }
}