//
//  SettingViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/19/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit
class SettingViewController: UIViewController {
    @IBOutlet weak var colorSettingView: UIView!
    @IBOutlet weak var fontSizeSettingView: UIView!
    @IBOutlet weak var fontTypeSettingView: UIView!
    
    @IBOutlet weak var navigateTitleOutlet: UINavigationItem!
    
    @IBOutlet weak var saveBar: UIBarButtonItem!
    @IBOutlet weak var closeBar: UIBarButtonItem!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var changeColorLabel: UILabel!
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var changeFontSizeLabel: UILabel!
    @IBOutlet weak var textColorLabel: UILabel!
    @IBOutlet weak var backgroundColorLabel: UILabel!

    @IBOutlet weak var saveIdOutlet: UIButton!
    @IBOutlet weak var editIdOutlet: UIButton!
    @IBOutlet weak var editPwdOutlet: UIButton!
    @IBOutlet weak var savePwdOutlet: UIButton!
    @IBOutlet weak var color1Outlet: UIButton!
    @IBOutlet weak var color2Outlet: UIButton!
    @IBOutlet weak var color3Outlet: UIButton!
    @IBOutlet weak var color4Outlet: UIButton!
    @IBOutlet weak var color5Outlet: UIButton!
    @IBOutlet weak var color7Outlet: UIButton!
    @IBOutlet weak var color6Outlet: UIButton!
    @IBOutlet weak var color8Outlet: UIButton!
    @IBOutlet weak var color9Outlet: UIButton!
    @IBOutlet weak var colorOption: UIButton!
    @IBOutlet weak var FontSize1Outlet: UIButton!
    @IBOutlet weak var fontSize2Outlet: UIButton!
    @IBOutlet weak var fontSize3Outlet: UIButton!
    @IBOutlet weak var fontSize4Outlet: UIButton!
    @IBOutlet weak var fontType1Outlet: UIButton!
    @IBOutlet weak var fontType2Outlet: UIButton!
    @IBOutlet weak var fontType3Outlet: UIButton!
    @IBOutlet weak var fontType4Outlet: UIButton!
    
    @IBOutlet var mainView: UIView!
    static var globalFontSize : CGFloat = 12
    static var globalFontType = UIFont.changeLabelFontEXTEND(fontName: "Menlo", fontSize:
        SettingViewController.globalFontSize)
    static var globalBGcolor =   UIColor.darkGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    
    func initUI() {
        setBorder( color1Outlet)
        setBorder( color2Outlet)
        setBorder( color3Outlet)
        setBorder( color4Outlet)
        setBorder( color5Outlet)
        setBorder( color6Outlet)
        setBorder( color7Outlet)
        setBorder( color8Outlet)
        setBorder( color9Outlet)
        setBorder( color9Outlet)
        setBorder( FontSize1Outlet)
        setBorder( fontSize2Outlet)
        setBorder( fontSize3Outlet)
        setBorder( fontSize4Outlet)
        setBorder( fontType1Outlet)
        setBorder( fontType2Outlet)
        setBorder( fontType3Outlet)
        setBorder( fontType4Outlet)
        setBorder( editIdOutlet)
        setBorder( editPwdOutlet)
        setBorder( saveIdOutlet)
        setBorder( savePwdOutlet)
        setBorder(colorOption)
        
        emailTextField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 14, borderWidth: 1)
        pwdTextField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 14, borderWidth: 1)

        savePwdOutlet.isHidden = true
        saveIdOutlet.isHidden  = true
        
        adjustFont()
        fontSizeSettingView.backgroundColor = .grayL2EXTEND()
        colorSettingView.backgroundColor = .grayL2EXTEND()
        fontTypeSettingView.backgroundColor = .grayL2EXTEND()
        
        fontSizeSettingView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 1)
        colorSettingView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 1)
        fontTypeSettingView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 1)
        mainView.backgroundColor = SettingViewController.globalBGcolor
        color1Outlet.backgroundColor = .LY2EXTEND()
        color2Outlet.backgroundColor = .LB2EXTEND()
        color3Outlet.backgroundColor = .LPINK1EXTEND()
        color4Outlet.backgroundColor = .LG2EXTEND()
        color5Outlet.backgroundColor = .darkGray
        color6Outlet.backgroundColor = .DGreenEXTEND()
        color7Outlet.backgroundColor = .white
        color8Outlet.backgroundColor = .DYellowEXTEND()
        color9Outlet.backgroundColor = .DDDBlueEXTEND()
        colorOption.backgroundColor  = .LBLUE1EXTEND()
        
        changeFontSettingBttns()
    }
    
    func changeFontSettingBttns () {
        fontType1Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontType2Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontType3Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontType4Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        FontSize1Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontSize2Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontSize3Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        fontSize4Outlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        saveIdOutlet.layer.borderColor  = SettingViewController.globalBGcolor.cgColor
        savePwdOutlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        editIdOutlet.layer.borderColor  = SettingViewController.globalBGcolor.cgColor
        editPwdOutlet.layer.borderColor = SettingViewController.globalBGcolor.cgColor
    }
    @IBAction func fontTypeSettings(_ sender: UIButton) {
        switch sender {
        case fontType1Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: "Menlo", fontSize: SettingViewController.globalFontSize)
            break
        case fontType2Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: "American Typewriter", fontSize: SettingViewController.globalFontSize)
            break
        case fontType3Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: "Times New Roman", fontSize: SettingViewController.globalFontSize)
            break
        case fontType4Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: "Rockwell", fontSize: SettingViewController.globalFontSize)
            break
        default:
            break
        }
        adjustFont()
    }

       func adjustFont (){
           idLabel.font = SettingViewController.globalFontType
           pwdLabel.font = SettingViewController.globalFontType
           textColorLabel.font = SettingViewController.globalFontType
           changeFontLabel.font = SettingViewController.globalFontType
           changeColorLabel.font = SettingViewController.globalFontType
           changeFontSizeLabel.font = SettingViewController.globalFontType
           backgroundColorLabel.font = SettingViewController.globalFontType
           idLabel.adjustsFontSizeToFitWidth = true
           pwdLabel.adjustsFontSizeToFitWidth = true
           textColorLabel.adjustsFontSizeToFitWidth = true
           changeFontLabel.adjustsFontSizeToFitWidth = true
           changeColorLabel.adjustsFontSizeToFitWidth = true
           changeFontSizeLabel.adjustsFontSizeToFitWidth = true
           backgroundColorLabel.adjustsFontSizeToFitWidth = true
       }
    
    @IBAction func fontSizeSettings(_ sender: UIButton) {
        switch sender {
        case FontSize1Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: SettingViewController.globalFontType.fontName, fontSize: 12)
            SettingViewController.globalFontSize = 12
            break
            
        case fontSize2Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: SettingViewController.globalFontType.fontName, fontSize: 15)
            SettingViewController.globalFontSize = 15
            break
            
        case fontSize3Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: SettingViewController.globalFontType.fontName, fontSize: 20)
            SettingViewController.globalFontSize = 20
            break
            
        case fontSize4Outlet:
            SettingViewController.globalFontType = UIFont.changeLabelFontEXTEND(fontName: SettingViewController.globalFontType.fontName, fontSize: 30)
            SettingViewController.globalFontSize = 30
            break
            
        default:
            break
        }
        adjustFont()
    }
    

    func setBorder (_ bttn : UIButton) { bttn.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1) }
    @IBAction func saveBttn(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    @IBAction func closeBttn(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    @IBAction func colorSettings(_ sender: UIButton) {
        
        switch sender {
        case color1Outlet:
              SettingViewController.globalBGcolor = UIColor.LY2EXTEND()
        case color2Outlet:
             SettingViewController.globalBGcolor = UIColor.LB2EXTEND()
        case color3Outlet:
            SettingViewController.globalBGcolor = UIColor.LPINK1EXTEND()
        case color4Outlet:
            SettingViewController.globalBGcolor = UIColor.LG2EXTEND()
            break
        case colorOption:
            break
        case color5Outlet:
            SettingViewController.globalBGcolor = UIColor.darkGray
            break
        case color6Outlet :
            SettingViewController.globalBGcolor = UIColor.DGreenEXTEND()
            break
        case color7Outlet :
            SettingViewController.globalBGcolor = UIColor.white
            break
        case color8Outlet :
            SettingViewController.globalBGcolor = UIColor.DYellowEXTEND()
            break
        case color9Outlet :
            SettingViewController.globalBGcolor = UIColor.DDDBlueEXTEND()
            break
        default:
            print("Unknown language")
        }
        mainView.backgroundColor = SettingViewController.globalBGcolor
        changeFontSettingBttns ()
    }
    
    @IBAction func editIdButton(_ sender: Any) {
    }
    
    @IBAction func saveIdButton(_ sender: Any) {
    }
    @IBAction func editPwdButton(_ sender: Any) {
    }
    @IBAction func savePwdButton(_ sender: Any) {
    }
}
