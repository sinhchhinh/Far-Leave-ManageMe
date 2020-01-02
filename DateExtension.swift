//
//  DateExtension.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/13/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
extension Date {
    
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
