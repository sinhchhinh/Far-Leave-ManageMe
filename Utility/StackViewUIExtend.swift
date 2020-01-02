//
//  StackViewUIExtend.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/30/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import Foundation
import UIKit
extension UIStackView {
    /**Customize Stackview*/
    func customizeStackViewUI (distribution : UIStackView.Distribution , alignment : UIStackView.Alignment, axis : NSLayoutConstraint.Axis, spacing : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.distribution = distribution
        self.alignment = alignment
        self.axis = axis
        self.spacing = spacing
    }
}
