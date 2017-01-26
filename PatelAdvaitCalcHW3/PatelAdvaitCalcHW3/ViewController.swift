//
//  ViewController.swift
//  PatelAdvaitCalcHW3
//
//  Created by Patel, Advait Rajeshkumar on 1/25/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //button actions
    @IBAction func numberClicked(_ sender: UIButton)
    {
        
        switch sender.tag {
        case 0:
            print ("0")
        case 1:
            print ("1")
        case 2:
            print ("2")
        case 3:
            print ("3")
        case 4:
            print ("4")
        case 5:
            print ("5")
        case 6:
            print ("6")
        case 7:
            print ("7")
        case 8:
            print ("8")
        case 9:
            print ("9")
            
        default:
            return
        }
 
    }
    
    @IBAction func operatorClicked(_ sender: UIButton)
    {
        /*
        switch sender.tag {
        case 10:
            print ("0")
        case 11:
            print ("1")
        case 12:
            print ("2")
        case 13:
            print ("3")
        case 14:
            print ("4")
            
        default:
            return
        }
 */
    }
    
    @IBAction func equalsClicked(_ sender: UIButton)
    {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

