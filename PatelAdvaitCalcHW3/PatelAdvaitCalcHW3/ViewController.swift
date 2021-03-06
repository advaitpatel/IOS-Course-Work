//
//  ViewController.swift
//  PatelAdvaitCalcHW3
//
//  Created by Patel, Advait Rajeshkumar on 1/25/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var currentOperation: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum

    var firstValue: String = ""
    
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //button actions
    @IBAction func numberClicked(_ sender: UIButton)
    {
        
        updateDisplay (number: String(sender.tag))
        
    }
    
    func updateDisplay (number: String)
    {
        if calcState == CalculationState.newNumStarted
        {
            if let num = resultLabel.text
            {
                if num != ""
                {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum
        {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton)
    {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text
        {
            if num != ""
            {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag {
        
        case 10:
            currentOperation = Operator.add
            
        case 11:
            currentOperation = Operator.subtract

        case 12:
            currentOperation = Operator.times

        case 13:
            currentOperation = Operator.divide
            
        case 14:
            resultLabel.text = "Nothing"
            
        default:
            return
        }
 
    }
    
    @IBAction func equalsClicked(_ sender: UIButton)
    {
        calculateSum()
    }
    
    func calculateSum()
    {
        if (firstValue.isEmpty)
        {
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.times
        {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide
        {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add
        {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract
        {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        
        calcState = CalculationState.newNumStarted
        
        
    }
    
    func updateOperatorButton (tag: Int)
    {
        // clear colors
        for var i in 10..<15
        {
            if let button = self.view.viewWithTag(i) as? UIButton
            {
                button.backgroundColor = UIColor.clear
            }
        }
        //change color button
        if let button = self.view.viewWithTag(tag) as? UIButton
        {
            button.backgroundColor = UIColor.yellow
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

