//
//  ViewController.swift
//  PatelAdvaitHW4
//
//  Created by Patel, Advait Rajeshkumar on 2/6/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var powerStatus = "ON"
    var volumeStatus = ""
    var channelStatus = ""
    var speakerVolume = 50
    var currentChannel = 1
    var ch = ""
    var count = 0
    
    @IBOutlet var lblPower: UILabel!
    @IBOutlet var lblVolume: UILabel!
    @IBOutlet var lblChannel: UILabel!
    
    @IBOutlet var btn0: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    
    
    
    @IBOutlet var channelPlus: UIButton!
    @IBOutlet var channelMinus: UIButton!
    
    
    @IBOutlet var controlVolume: UISlider!
    
    @IBOutlet var segmentChannel: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblPower.text = powerStatus
        lblVolume.text = String(speakerVolume)
        lblChannel.text = String(currentChannel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willEnableControls()
    {
        controlVolume.isEnabled = true
        
        segmentChannel.isEnabled = true
        
        btn0.isEnabled = true
        btn1.isEnabled = true
        btn2.isEnabled = true
        btn3.isEnabled = true
        btn4.isEnabled = true
        btn5.isEnabled = true
        btn6.isEnabled = true
        btn7.isEnabled = true
        btn8.isEnabled = true
        btn9.isEnabled = true
        
        channelPlus.isEnabled = true
        channelMinus.isEnabled = true
        
    }
    
    func willDisableControls()
    {
        controlVolume.isEnabled = false
        
        segmentChannel.isEnabled = false
        
        btn0.isEnabled = false
        btn1.isEnabled = false
        btn2.isEnabled = false
        btn3.isEnabled = false
        btn4.isEnabled = false
        btn5.isEnabled = false
        btn6.isEnabled = false
        btn7.isEnabled = false
        btn8.isEnabled = false
        btn9.isEnabled = false
        
        channelPlus.isEnabled = false
        channelMinus.isEnabled = false
        
    }
    
    @IBAction func switchPower(_ sender: UISwitch)
    {
        lblPower.text = powerStatus
        
        if sender.isOn
        {
            willEnableControls()
            
            powerStatus = "ON"
            lblPower.text = powerStatus
            
            lblVolume.text = String(speakerVolume)
            lblChannel.text = String(currentChannel)
        }
        else
        {
            willDisableControls()
            powerStatus = "OFF"
            lblPower.text = powerStatus
            
            volumeStatus = "Power OFF"
            lblVolume.text = volumeStatus
            
            channelStatus = "0"
            lblChannel.text = channelStatus
            
            //lblVolume.text = ""
            //lblChannel.text = ""
        }
    }

    
    @IBAction func btnVolumeChanged(_ sender: UISlider)
    {
        
        speakerVolume = Int(sender.value)
        lblVolume.text = String(speakerVolume)
        //lblVolume.text = String(Int(sender.value))
    }
    
    @IBAction func btnChannelPlus(_ sender: UIButton)
    {
        if currentChannel <= 99
        {
            currentChannel += 1
        }
        else
        {
            currentChannel = 1
        }
        
        lblChannel.text = String(currentChannel)
    }
    
    @IBAction func btnChannelMinus(_ sender: UIButton)
    {
        if currentChannel > 1
        {
            currentChannel -= 1
        }
        else
        {
            currentChannel = 99
        }
        lblChannel.text = String(currentChannel)
    }
    
    @IBAction func btnChannelClicked(_ sender: UIButton)
    {
        count += 1
        if let current = sender.currentTitle
        {
            ch = ch + current
            currentChannel = Int(ch)!
            
            
        }
        if count == 2
        {
            if currentChannel == 0
            {
                currentChannel = 01
            }
            lblChannel.text = String(currentChannel)
            ch = ""
            count = 0
            
            
        }
    }
    
    @IBAction func btnSegmentChannel(_ sender: UISegmentedControl)
    {
        let favCurrentChannel = sender.selectedSegmentIndex
        switch favCurrentChannel {
        case 0:
            currentChannel = 25
        case 1:
            currentChannel = 75
        case 2:
            currentChannel = 50
        case 3:
            currentChannel = 100
        default:
            currentChannel = 1
        }
        lblChannel.text = String(currentChannel)
    }
    
    
    
    
    
    
    
    
    
    
    

}

