//
//  ViewController.swift
//  PatelAdvaitHW5
//
//  Created by Patel, Advait Rajeshkumar on 2/15/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var tf_desc: UITextField!
    @IBOutlet var tf_qty: UITextField!
    
    
    @IBAction func btn_newList(_ sender: UIButton)
    {
        //print("1")
    }
    
    @IBAction func btn_newItem(_ sender: UIButton)
    {
        //print("2")
    }
    
    
    @IBAction func btn_addItem(_ sender: UIButton)
    {
        //print("3")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
}

