//
//  Filereader.swift
//  hoge
//
//  Created by Kaito Oshiro on 2015/01/08.
//  Copyright (c) 2015年 team-g. All rights reserved.
//

import Foundation
import UIKit

class Filereader: UIViewController {
    
    override func viewDidLoad() {
        let paths1 = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory,
            .UserDomainMask, true)
        
        let _path = paths1[0].stringByAppendingPathComponent("load.txt");
        
        println(_path)
        
        //// 読み込み
        var data2 = ""
        data2 = NSString(contentsOfFile: _path, encoding: NSUTF8StringEncoding, error: nil)!
        println(data2)
    }
    
}