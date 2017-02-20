//
//  ConfigurationViewController.swift
//  PatelAdvaitHW4
//
//  Created by Patel, Advait Rajeshkumar on 2/15/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    var fc: FavoriteChannelConfigurator!
    var fcNumber: Int!
    var fcName: String!
    
    
    @IBOutlet var lbl_channel: UILabel!
    
    @IBOutlet var tf_label: UITextField!
    
    
    @IBOutlet var seg_btn: UISegmentedControl!
    
    @IBOutlet var step_channel: UIStepper!
    
    func getFavChannelDetails() {
        if let fcNum = Int((lbl_channel.text)!) {
            fcNumber = fcNum
        }
        else {
            fcNumber = 1
        }
        fcName = tf_label.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        fc = fc1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_stepper(_ sender: UIStepper)
    {
        sender.wraps = true
        sender.minimumValue = 1.0
        sender.maximumValue = 99.0
        lbl_channel.text = String(Int(sender.value))
    }
    
    @IBAction func btn_segment(_ sender: UISegmentedControl)
    {
        let favChannel = sender.selectedSegmentIndex
        switch favChannel
        {
            case 0:
                fc = fc1
            case 1:
                fc = fc2
            case 2:
                fc = fc3
            case 3:
                fc = fc4
            default:
                fc = fc1
        
        }
    }
    
    @IBAction func btn_save(_ sender: UIButton)
    {
        getFavChannelDetails()
        if fcName.characters.count < 1 || fcName.characters.count > 4  {
            let alertBox = UIAlertController(title: "Invalid Label Length! ", message: "Label must be between 1 - 4 letters in length ", preferredStyle: UIAlertControllerStyle.alert)
            let actionDismiss = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil)
            alertBox.addAction(actionDismiss)
            self.present(alertBox, animated: true, completion: nil)
            
        }
        else
        {
            fc.saveFavChannel(fcObj: fc, fcID: fc.getID(), fcNumber: fcNumber!, fcName: fcName!)
        }
    }
    
    
    @IBAction func btn_cancel(_ sender: UIButton)
    {
        tf_label.text = ""
        step_channel.value = step_channel.minimumValue
        lbl_channel.text = "--"
        seg_btn.selectedSegmentIndex = 0
    }

}
