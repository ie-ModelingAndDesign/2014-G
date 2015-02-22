//
//  MainViewControll.swift
//  User_Access
//
//  Created by index on 2015/02/22.
//  Copyright (c) 2015年 Hiroyuki Tenngann. All rights reserved.
//

import Foundation
import UIkit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       /* // 背景に画像を設定する.
        let myImage = UIImage(named: "wood.JPG")!
        var myImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(-10, -28, myImage.size.width, myImage.size.height)
        self.view.addSubview(myImageView)
        */
        
    }
    
    @IBOutlet var FaceBookBtn: UIButton!
    
    @IBAction func FaceBookBtnAction(sender: AnyObject) {
        //nope
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
