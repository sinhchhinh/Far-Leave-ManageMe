//
//  ExtraLabelViewUI.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 1/4/20.
//  Copyright © 2020 PanPenFamily. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setLabelUIEXTEND ( borderColor : CGColor , cornerRadius : CGFloat , borderWidth : CGFloat ) {
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
