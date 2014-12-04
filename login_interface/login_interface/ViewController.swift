//
//  ViewController.swift
//  login_interface
//
//  Created by Kaito Oshiro on 2014/11/26.
//  Copyright (c) 2014年 team-g. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myTextField = UITextField(frame: CGRectMake(100, 100, 200, 50))
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.delegate = self
        self.view.addSubview(myTextField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        println( textField.text )
        return true
    }
    
    
    
    @IBAction func signIn(sender: UIButton) {
    }
    
    @IBAction func signUp(sender: UIButton) {
    }
}

