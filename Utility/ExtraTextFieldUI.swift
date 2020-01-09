//
//  ExtraTextFieldUI.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/19/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//
import UIKit
import Foundation

extension UITextField {
    func setBorderUIEXTEND ( borderColor : CGColor , cornerRadius : CGFloat , borderWidth : CGFloat ) {
        clipsToBounds = true
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
    /**Setting padding for textfield*/
    func setLeftPaddingPoints(_ amount:CGFloat){
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
           self.leftView = paddingView
           self.leftViewMode = .always
       }
       func setRightPaddingPoints(_ amount:CGFloat) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
           self.rightView = paddingView
           self.rightViewMode = .always
       }
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped()
    {
        self.resignFirstResponder()
    }
    @objc func cancelButtonTapped()
    {   text = ""
        self.resignFirstResponder()
        
    }
    
    /**Add image to the most lef of textfields */
    func addMostLeftImage(  img : UIImage, imgWidth : CGFloat, imgHeight : CGFloat, imgViewContainerWidth : CGFloat, imgViewContainerHeight : CGFloat) {
        let view = UIView(frame: CGRect(x:0.0, y:0.0, width: imgViewContainerWidth, height: imgViewContainerHeight))
        let leftImageView = UIImageView(frame: CGRect(x:5.0, y:0.0, width: imgWidth, height: imgHeight))
        leftImageView.image = img
        leftImageView.contentMode = .scaleAspectFit
        view.addSubview(leftImageView)
        leftView = view
        leftViewMode = .always
    }

}

