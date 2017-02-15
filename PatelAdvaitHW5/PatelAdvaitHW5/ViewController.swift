//
//  ViewController.swift
//  PatelAdvaitHW5
//
//  Created by Patel, Advait Rajeshkumar on 2/15/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    
    @IBOutlet var tf_desc: UITextField!
    @IBOutlet var tf_qty: UITextField!

    @IBOutlet var tv_itemList: UITextView!
    
    var currentItemList = ""
    
    @IBOutlet var viewView: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func btn_newList(_ sender: UIButton)
    {
        print("New List")
        
        currentItemList = ""
        tv_itemList.text = "No Item"
        tf_desc.text = ""
        tf_qty.text=""
        
        UserDefaults.standard.set(currentItemList, forKey: "currentItemList")
        
    }
    
    @IBAction func btn_newItem(_ sender: UIButton)
    {
        print("Create a New Item Here")
        tf_desc.text = ""
        tf_qty.text=""
    }
    
    @IBAction func btn_addItem(_ sender: UIButton)
    {
        print("Add New Item Here")
        
        let currItemDesc = tf_desc.text!
        let currItemQty = tf_qty.text!
        
        
        tv_itemList.resignFirstResponder()
        
        if currItemDesc == "" {
            let title = "Incorrect Input"
            let message = "Item Description cant be Empty"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK",style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController,
                    animated: true,
                    completion: nil)
        }else if currItemQty == ""{
            let title = "Error, Incorrect Input"
            let message = "Item Quantity can't be Empty"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK",style: .cancel,handler: nil)
            alertController.addAction(cancelAction)
            present(alertController,
                    animated: true,
                    completion: nil)
        }else{
            
            if let _ = Int(currItemQty){
                currentItemList = currentItemList + "\(currItemDesc) x \(currItemQty)\n"
                tv_itemList.text=currentItemList
                UserDefaults.standard.set(currentItemList, forKey: "currentItemList")
            }else{
                let title = "Error, Incorrect Input!"
                let message = "Integer Value Required!"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "OK",style: .cancel,handler: nil)
                alertController.addAction(cancelAction)
                present(alertController,
                        animated: true,
                        completion: nil)
            }
            
        }
    }
    
    
    
}

