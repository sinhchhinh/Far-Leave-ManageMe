//
//  ItemObject.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/17/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
public class ItemObject {
    private var itemName : String!
    private var category : String!
    private var desc : String!
    private var amount : Int!
    private var price  : Float!
    private var totalCost : Float!
    private var purchaseDate : Date!

    init () {
        itemName = ""
        category =  ""
        desc = ""
        amount = 0
        price = 0
        purchaseDate = NSDate() as Date
        totalCost = 0.0
        
        
    }
    init (itemName : String, category : String, desc: String, amount : Int, price : Float, totalCost : Float , purchaseDate : Date) {
        self.itemName = itemName
        self.category = category
        self.desc = desc
        self.amount = amount
        self.price = price
        self.purchaseDate = purchaseDate
        self.totalCost = totalCost
    }
    func getItemName () -> String {
        return itemName
    }
    func getCategory () -> String {
        return category
    }
    func getDesc () -> String {
        return desc
    }
    func getAmount () -> Int {
        return amount
    }
    func getPrice () -> Float {
        return price
    }
    func getPurchaseDate () -> Date {
        return purchaseDate
    }
    func getTotalCost () -> Float {
        return totalCost
    }

}
