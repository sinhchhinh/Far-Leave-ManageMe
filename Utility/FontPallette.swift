//
//  FontPallette.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/23/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//
import UIKit
import Foundation
extension UIFont
{
    static func changeLabelFontEXTEND  ( fontName : String, fontSize : CGFloat) -> UIFont
    {
        var font : UIFont!
        switch fontName {
            
        case "Menlo":
            font = UIFont(name: "Menlo", size: fontSize)
            break
            
        case "American Typewriter":
            font = UIFont(name: "American Typewriter", size: fontSize)
            break
            
        case "Times New Roman" :
            font = UIFont(name: "Times New Roman", size: fontSize)
            break
            
        case "Rockwell":
            font = UIFont(name: "Rockwell", size: fontSize)
            break
            
        default:
            font = UIFont(name: "Times New Roman", size: fontSize)
            break
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        return  fontMetrics.scaledFont(for: font!)
    }
    
    
}
