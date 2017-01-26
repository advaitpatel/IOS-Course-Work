//
//  StructEnums.swift
//  PatelAdvaitCalcHW3
//
//  Created by Patel, Advait Rajeshkumar on 1/25/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import Foundation


enum Operator: String
{
    case add      = "+"
    case subtract = "-"
    case times    = "*"
    case divide   = "/"
    case nothing  = " "
}

enum CalculationState: String
{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
