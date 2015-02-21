//
//  Color.swift
//  hoge
//
//  Created by Kaito Oshiro on 2014/12/14.
//  Copyright (c) 2014年 team-g. All rights reserved.
//
//  *****色をRGBかなんかでつけれるやつ*****

import Foundation

import UIKit

//16進数で色を変えることができる
//Usage : self.view.backgroundColor = UIColor.hexStr("79c0fe", alpha: 1)
extension UIColor {
    class func hexStr (var hexStr : NSString, var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}

