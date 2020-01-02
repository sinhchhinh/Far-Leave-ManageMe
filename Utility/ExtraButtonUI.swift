//
//  ExtraButtonUI.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/19/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//
import UIKit
import Foundation

extension UIButton {
    
    func setBorderUIEXTEND ( borderColor : CGColor , cornerRadius : CGFloat , borderWidth : CGFloat ) {
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
