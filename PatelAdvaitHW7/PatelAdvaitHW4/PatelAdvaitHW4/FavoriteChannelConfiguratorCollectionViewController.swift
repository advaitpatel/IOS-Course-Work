//
//  FavoriteChannelConfiguratorCollectionViewController.swift
//  PatelAdvaitHW4
//
//  Created by Patel, Advait Rajeshkumar on 2/20/17.
//  Copyright © 2017 Patel, Advait. All rights reserved.
//

import UIKit

import UIKit

class FavoriteChannelConfigurator: NSObject {
    fileprivate var favChannelID: Int
    fileprivate var favChannelNumber: Int
    fileprivate var favChannelName: String
    
    init(fcID: Int, fcNumber: Int, fcName: String) {
        self.favChannelID = fcID
        self.favChannelNumber = fcNumber
        self.favChannelName = fcName
    }
    
    func saveFavChannel(fcObj: FavoriteChannelConfigurator, fcID: Int, fcNumber: Int, fcName: String) {
        fcObj.favChannelID = fcID
        fcObj.favChannelNumber = fcNumber
        fcObj.favChannelName = fcName
    }
    
    func getID() -> Int {
        return self.favChannelID
    }
    func getNumber() -> Int {
        return self.favChannelNumber
    }
    func getName() -> String {
        return self.favChannelName
    }
    
    override var description: String {
        return "FavoriteChannel ID: \(favChannelID) Number: \(favChannelNumber) Name: \(favChannelName)"
    }
}
