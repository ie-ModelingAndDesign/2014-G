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
import CoreData


class PDFViewController: UIViewController, UIWebViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var textField: UITextField!
    
var myValues: NSArray = ["★","★★","★★★","★★★★"]//
    var myUIPicker: UIPickerView = UIPickerView()
    
    var allDataArr = [NSManagedObject]()

    var webview: UIWebView = UIWebView()
    
    var myButtonToBack: UIButton!
    
    var myButton1: UIButton!
    var myButton2: UIButton!
    var myButton3: UIButton!
    var myButton4: UIButton!
    
    var nextpage: UIButton!
    var backpage: UIButton!
    var page :UInt = 1
    var number_of_page :UInt!
   
    var noteurl : String!

    var hoge:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
 
        
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
        //---------------
        myUIPicker.frame = CGRectMake(self.view.bounds.width*3/4-30,self.view.bounds.height*3/4,150, 180.0)
        //myUIPicker.backgroundColor = UIColor.grayColor()
        // Delegateを設定する.
        myUIPicker.alpha = 0.7
        myUIPicker.delegate = self
        
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        //textFIeld
        textField = UITextField(frame: CGRectMake(self.view.frame.size.width-100, 50, 100, 50))
        textField.text = hoge
        textField.delegate = self
        textField.placeholder = hoge
        //textField.sizeToFit()
        //textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
        //textField
        //-------------
        myButton1 = UIButton(frame: CGRectMake(0,0,50,40))
        myButton1.backgroundColor = UIColor.redColor();
        myButton1.layer.masksToBounds = true
        myButton1.setTitle("add", forState: .Normal)
        myButton1.layer.cornerRadius = 20.0
        myButton1.layer.position = CGPoint(x: 110 , y:50)
        //myButton1.addTarget(self, action: "tapAddButton:", forControlEvents: .TouchUpInside)
        
        //Viewに追加
        self.view.addSubview(myButton1);
        
        myButton2 = UIButton(frame: CGRectMake(0,0,50,40))
        myButton2.backgroundColor = UIColor.redColor();
        myButton2.layer.masksToBounds = true
        myButton2.setTitle("delete", forState: .Normal)
        myButton2.layer.cornerRadius = 20.0
        myButton2.layer.position = CGPoint(x: 170 ,y: 50)
        myButton2.addTarget(self, action: "tapDeleteButton:", forControlEvents: .TouchUpInside)
        
        //Viewに追加
        self.view.addSubview(myButton2);
        
       /* myButton3 = UIButton(frame: CGRectMake(0,0,90,40))
        myButton3.backgroundColor = UIColor.redColor();
        myButton3.layer.masksToBounds = true
        myButton3.setTitle("update", forState: .Normal)
        myButton3.layer.cornerRadius = 20.0
        myButton3.layer.position = CGPoint(x: self.view.bounds.width*3/4 , y:self.view.bounds.height-135)
        myButton3.addTarget(self, action: "tapUpdateButton:", forControlEvents: .TouchUpInside)
        
        //Viewに追加
        self.view.addSubview(myButton3);*/
        
        myButton4 = UIButton(frame: CGRectMake(0,0,50,40))
        myButton4.backgroundColor = UIColor.redColor();
        myButton4.layer.masksToBounds = true
        myButton4.setTitle("fetch", forState: .Normal)
        myButton4.layer.cornerRadius = 20.0
        myButton4.layer.position = CGPoint(x: 230 , y:50)
        myButton4.addTarget(self, action: "tapFetchButton:", forControlEvents: .TouchUpInside)
        
        //Viewに追加
        self.view.addSubview(myButton4);
        //--------
        myButtonToBack = UIButton(frame: CGRectMake(0,0,50,40))
        myButtonToBack.backgroundColor = UIColor.redColor();
        myButtonToBack.layer.masksToBounds = true
        myButtonToBack.setTitle("back", forState: .Normal)
        myButtonToBack.layer.cornerRadius = 20.0
        myButtonToBack.layer.position = CGPoint(x: 50 , y:50)
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
    //-------------------------------------------------------------------------------------
    func saveName(name: String){
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        /* Create new ManagedObject */
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let personObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        /* Set the name attribute using key-value coding */
        personObject.setValue(name, forKey: "name")
        
        /* Error handling */
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        println("object saved")
    }
    
    func fetchPersonData() {
        allDataArr = []
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        
        /* Set search conditions */
        let fetchRequest = NSFetchRequest(entityName: "Person")
        var error: NSError?
        
        /* Get result array from ManagedObjectContext */
        let fetchResults = manageContext.executeFetchRequest(fetchRequest, error: &error)
        if let results: Array = fetchResults {
            for obj:AnyObject in results {
                allDataArr.append(obj as NSManagedObject)
                let name:String? = obj.valueForKey("name") as? String
                println(name)
                textField.text = name
            }
            println(results.count)
        } else {
            println("Could not fetch \(error) , \(error!.userInfo)")
        }
        
    }
    
    func updateName(managedObject: NSManagedObject, newName: String) {
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        /* Change value of managedObject */
        managedObject.setValue(newName, forKey: "name")
        
        /* Save value to managedObjectContext */
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not update \(error), \(error!.userInfo)")
        }
        
        println("Object updated")
    }
    
    func deleteName(managedObject: NSManagedObject) {
        
        /* Get ManagedObjectContext from AppDelegate */
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        /* Delete managedObject from managed context */
        managedContext.deleteObject(managedObject)
        
        /* Save value to managed context */
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not update \(error), \(error!.userInfo)")
        }
        println("Object deleted")
        
    }
    
    
    func tapAddButton(sender: AnyObject) {
        let randInt:Int = Int(arc4random_uniform(10))
        let name:String = hoge
        saveName(name)
        fetchPersonData()
    }
    
    func tapDeleteButton(sender: AnyObject) {
        if allDataArr.count > 0 {
            deleteName(allDataArr[allDataArr.count-1])
        }
        fetchPersonData()
    }
    
    func tapUpdateButton(sender: AnyObject) {
        if allDataArr.count > 0 {
            updateName(allDataArr[0], newName: "new updated name")
        }
        fetchPersonData()
    }
    
    func tapFetchButton(sender: AnyObject) {
        fetchPersonData()
        
    }

//------------------------------------------------------------
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
        hoge = myValues[row] as NSString
        textField.text = myValues[row] as NSString
        myButton1.addTarget(self, action: "tapAddButton:", forControlEvents: .TouchUpInside)
        
    }
    
    //--------------------------------------
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