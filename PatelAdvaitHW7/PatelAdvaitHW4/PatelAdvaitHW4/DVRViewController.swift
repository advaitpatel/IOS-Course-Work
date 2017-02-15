//
//  DVRViewController.swift
//  PatelAdvaitHW4
//
//  Created by Patel, Advait Rajeshkumar on 2/15/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {

    
    @IBOutlet var lbl_power: UILabel!
    @IBOutlet var lbl_state: UILabel!
    
    
    @IBOutlet var bob_play: UIButton!
    @IBOutlet var bob_stop: UIButton!
    @IBOutlet var bob_pause: UIButton!
    @IBOutlet var bob_ff: UIButton!
    @IBOutlet var bob_fr: UIButton!
    @IBOutlet var bob_record: UIButton!
    
    
    @IBOutlet var bob_switch: UISwitch!
    
    
    var currentPowerState = "ON"
    var currentState = States.STOPPED
    var forcedState: States!
    
    
    func powerSwitchOn()
    {
        bob_play.isEnabled =   true
        bob_stop.isEnabled =   true
        bob_pause.isEnabled =  true
        bob_ff.isEnabled =     true
        bob_fr.isEnabled =     true
        bob_record.isEnabled = true
    }
    
    func powerSwitchOff()
    {
        bob_play.isEnabled =   false
        bob_stop.isEnabled =   false
        bob_pause.isEnabled =  false
        bob_ff.isEnabled =     false
        bob_fr.isEnabled =     false
        bob_record.isEnabled = false
        
    }
    
    func setDVRState() {
        lbl_state.text = currentState.state
    }
    
    func printErrorMessage(){
        
        let printMessage = UIAlertController(title: "Warning⚠️", message: "Are you sure you want to force \(forcedState.state)?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let popBox = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:
            {(alert:UIAlertAction) -> Void in print("Cancelled")})
        
        let forcePromptMessage = UIAlertAction(title: "Force \(forcedState.state)", style: UIAlertActionStyle.destructive,
                                        handler: {(alert: UIAlertAction) -> Void in
                                            let alertBox = UIAlertController(title: "\(self.forcedState.state)", message: "State changed from \(self.currentState.state) state to \(self.forcedState.state) state", preferredStyle: UIAlertControllerStyle.alert)
                                            let actionDismiss = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil)
                                            alertBox.addAction(actionDismiss)
                                            self.present(alertBox, animated: true, completion: nil)
                                            self.currentState = self.forcedState
                                            self.setDVRState()
        })
        
        printMessage.addAction(forcePromptMessage)
        printMessage.addAction(popBox)
        self.present(printMessage, animated: true, completion: nil)
        
    }
    
    enum States: String {
        case STOPPED = "Stopped",
        PLAYING = "Playing",
        PAUSED = "Paused",
        FASTFORWARDING = "Fast Forwarding",
        FASTREWINDING = "Fast Rewinding",
        RECORDING = "Recording"
        
        var state: String {
            return self.rawValue
        }
    }
    
    @IBAction func btn_power_switch(_ sender: UISwitch)
    {
        print("Switch")
        
        if sender.isOn == false {
            powerSwitchOff()
            currentState = States.STOPPED
            //lbl_state.text = "NO POWER"
            setDVRState()
            currentPowerState = "OFF"
            lbl_power.text = currentPowerState
            lbl_state.text = ""
            bob_switch.setOn(false, animated: true)
            
            
        }
        else {
            powerSwitchOn()
            currentState = States.STOPPED
            setDVRState()
            currentPowerState = "ON"
            lbl_power.text = currentPowerState
            bob_switch.setOn(true, animated: true)
            
        }
        
    }
    
    @IBAction func btn_play(_ sender: UIButton)
    {
        print("Play")
        currentState = States.PLAYING
        setDVRState()
        
    }
    
    @IBAction func btn_stop(_ sender: UIButton)
    {
        print("Stop")
        ///lbl_state.text = "Done5"
        currentState = States.STOPPED
        setDVRState()
    }
    
    @IBAction func btn_pause(_ sender: UIButton)
    {
        print("Pause")
        //lbl_state.text = "Done6"
        
        if currentState == .PLAYING {
            currentState = States.PAUSED
            setDVRState()
        }
        else if currentState != .PAUSED {
            forcedState = States.PAUSED
            printErrorMessage()
        }
    }
    
    @IBAction func btn_ff(_ sender: UIButton)
    {
        print("Fast FF")
        //lbl_state.text = "Done7"
        currentState = States.FASTFORWARDING
        setDVRState()
        
    }
    
    @IBAction func btn_fr(_ sender: UIButton)
    {
        print("Fast RW")
        //lbl_state.text = "Done8"
        currentState = States.FASTREWINDING
        setDVRState()
    }
    
    @IBAction func btn_record(_ sender: UIButton)
    {
        print("Record")
        //lbl_state.text = "Done9"
        
        if currentState == .STOPPED {
            currentState = States.RECORDING
            setDVRState()
        }
        else if currentState != .RECORDING {
            forcedState = States.RECORDING
            printErrorMessage()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("DVR Screen is loaded successfully")
    }
    


}
