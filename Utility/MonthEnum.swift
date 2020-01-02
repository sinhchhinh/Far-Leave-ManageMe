//
//  MonthEnum.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/17/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
class MonthEnum
{

    func getTolDaysOfMonth (month : Int) -> Int {
        if month / 2 == 0 && month > 2
        {
            return 31
        } else
        {
            switch  month
            {
            case 2:
                return 28
            case 7:
                return 31
            default:
                return 30
            }
          
        }
    }
}



