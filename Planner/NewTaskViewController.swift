//
//  NewTaskViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/28/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let startDateBttn = UIButton()
    let endDateBttn = UIButton()
    let alertBttn = UIButton ()
    let repeatBttn = UIButton ()
    let priority1 = UIButton ()
    let priority2 = UIButton ()
    let priority3 = UIButton ()
    let priority4 = UIButton ()
    let priority5 = UIButton ()
    let color1 = UIButton ()
    let color2 = UIButton ()
    let color3 = UIButton ()
    let color4 = UIButton ()
    let color5 = UIButton ()
    
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    @IBOutlet var optionPopUpView: UIView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var option5: UIButton!
    @IBOutlet weak var option6: UIButton!
    @IBOutlet weak var custom: UIButton!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var taskinfoview: UIView!
    @IBOutlet weak var newTaskTableView: UITableView!
    let tasknameTextField  = UITextField()
    let locationTextField = UITextField ()
    let detailTextField = UITextField ()
    
    var viewEffectProp:UIVisualEffect!
    var priorityBttnList : [UIButton]!
    var colorBttnList : [UIButton]!
    let TABLEROWS : Int = 8
    
    @IBAction func submitBttn(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
    
    @IBAction func cancelBttn(_ sender: Any) {
        NavigationService.navigateToMainSpendingPage(self)
    }
        
    @IBAction func optionAction(_ sender: Any) {
        hidePopUpView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    @objc func alertAction(sender: UIButton!) {
        option1.setTitle("5 Mins before", for: .normal)
        option2.setTitle("10 Mins before", for: .normal)
        option3.setTitle("30 Mins before", for: .normal)
        option4.setTitle("1 Hour before", for: .normal)
        option5.setTitle("1 Day before", for: .normal)
        option6.setTitle("Custom", for: .normal)
        showOptionPopUp()
    }
    

    func showOptionPopUp () {
        self.view.addSubview(optionPopUpView)
        optionPopUpView.center = self.view.center
        optionPopUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        optionPopUpView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.blurEffectView.effect = self.viewEffectProp
            self.blurEffectView.isHidden = false
            self.optionPopUpView.alpha = 1
            self.optionPopUpView.transform = CGAffineTransform.identity
        })
    }
    
    func hidePopUpView () {
        UIView.animate(withDuration: 0.3, animations: {
            self.optionPopUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.optionPopUpView.alpha = 0
            self.blurEffectView.effect = nil
            self.blurEffectView.isHidden = true
        }) { (success:Bool) in
            self.optionPopUpView.removeFromSuperview()
        }
    }
    /**Initiate UI*/
    func initUI () {
        viewEffectProp = blurEffectView.effect //Store the effect of the visualViewBlue in viewEffect
        blurEffectView.effect = nil
        blurEffectView.isHidden = true
        tasknameTextField.delegate = self
        locationTextField.delegate = self
        detailTextField.delegate = self
        
        optionPopUpView.backgroundColor = UIColor.grayL3EXTEND()
        optionPopUpView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1)
        tasknameTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        locationTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        detailTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))

        priorityBttnList = [priority1, priority2,priority3, priority4, priority5]
        colorBttnList = [color1, color2,color3, color4, color5]
        
        newTaskTableView.backgroundColor  = UIColor.grayL3EXTEND()
        taskinfoview.backgroundColor = UIColor.grayL3EXTEND()
        navView.backgroundColor = UIColor.white
        view.backgroundColor = SettingViewController.globalBGcolor
        
        taskinfoview.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1)
         alertBttn.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
    }
    /**Stop Displaying the keyboard*/
    @objc func exitKeyBoard (){  view.endEditing(true) }
    
    /** Assign cursor return according to specific textfield */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField {
        case tasknameTextField:
            tasknameTextField.resignFirstResponder()
            locationTextField.becomeFirstResponder()
            
        case locationTextField:
        locationTextField.resignFirstResponder()
        detailTextField.becomeFirstResponder()
            
        default:
            break
        }
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TABLEROWS
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newtaskcell = tableView.dequeueReusableCell(withIdentifier: "newtaskcell", for: indexPath) as! NewTaskTableViewCell
        newtaskcell.backgroundColor = UIColor.grayL3EXTEND()
        newtaskcell.selectionStyle = .none
        newTaskTableView.rowHeight = 80
        
        switch indexPath.row {
        case 0:
            addTaskTextFieldInfo(newtaskcell.taskStackView, "Task Name", tasknameTextField)
            tasknameTextField.addMostLeftImage(img: UIImage.init(named: "doc")!, imgWidth: 20, imgHeight: 20, imgViewContainerWidth: 22, imgViewContainerHeight: 20)
        case 1:
            for n in 1...2 {
                let tempStack = UIStackView()
                if n == 1 {
                    addNewBttnInfo(tempStack, "Start Date", startDateBttn, " Sun, 29,12,19 10:11pm", .horizontal) }
                else {
                    addNewBttnInfo(tempStack, "End Date", endDateBttn, " Sun, 29,12,19 10:11pm", .horizontal)
                }
                newtaskcell.taskStackView.addArrangedSubview(tempStack)
                newtaskcell.taskStackView.distribution = .fillEqually
                newtaskcell.taskStackView.spacing = 0
                newtaskcell.taskStackView.axis = .vertical
            }
            
        case 2:
            addTaskTextFieldInfo(newtaskcell.taskStackView, "Location", locationTextField)
            let img = UIImage.init(named:  "location")
            locationTextField.addMostLeftImage( img:(img?.withTintColor(.gray))!, imgWidth: 20, imgHeight: 20, imgViewContainerWidth: 22, imgViewContainerHeight: 20)
            
        case 3:
            addTaskTextFieldInfo(newtaskcell.taskStackView, "Detail", detailTextField)
            detailTextField.addMostLeftImage( img: UIImage.init(named: "doc")!, imgWidth: 20, imgHeight: 20, imgViewContainerWidth: 22, imgViewContainerHeight: 20)
            
        case 4:
            addNewBttnInfo(newtaskcell.taskStackView, "Repeat", repeatBttn, "Select Repeat", .vertical)
            
        case 5:
            addNewBttnInfo(newtaskcell.taskStackView, "Alert", alertBttn, "Select Alert", .vertical)
            
        case 6:
            addTaskBttnsInfo(newtaskcell.taskStackView, "Priority", bttnsList: priorityBttnList, bttnFlag: "PRIORITY")
            break
        case 7:
            addTaskBttnsInfo(newtaskcell.taskStackView, "Color Flag", bttnsList: colorBttnList, bttnFlag: "COLOR")
            break
            
        default:
            break
        }
        return newtaskcell
    }
    /**Add array of bttns to tableview*/
    func addTaskBttnsInfo (_ stackView : UIStackView,_ inputStr : String, bttnsList : [UIButton], bttnFlag : String) {
        let tempstack = UIStackView()
        tempstack.customizeStackViewUI(distribution: .fillEqually, alignment: .center, axis: .horizontal, spacing: 0)
        stackView.customizeStackViewUI(distribution: .fill, alignment: .center, axis: .vertical, spacing: 3)

        let label = UILabel()
        label.textAlignment = NSTextAlignment.left
        label.text = inputStr
      
        switch bttnFlag {
        case "PRIORITY":
            for (_, bttn) in bttnsList.enumerated() {
                bttn.setTitle("", for: .normal)
                bttn.setImage(UIImage.init(systemName: "star"), for: .normal)
                bttn.backgroundColor = UIColor.grayL3EXTEND()
                tempstack.addArrangedSubview(bttn)
            }
        default:
            for (_, bttn) in bttnsList.enumerated() {
                bttn.setTitle("", for: .normal)
                bttn.backgroundColor = UIColor.DGreenEXTEND()
                bttn.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 15, borderWidth: 1)
                tempstack.addArrangedSubview(bttn)
                tempstack.spacing = 10
            }
        }
        tempstack.heightAnchor.constraint(equalToConstant: 45).isActive = true
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(tempstack)
        label.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
        tempstack.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
    }
    /**Add a label and bttn to tableview*/
    func addNewBttnInfo (_ stackView : UIStackView, _ inputStr : String, _ bttn : UIButton, _ bttnStr : String, _ orientation : NSLayoutConstraint.Axis ) {
        bttn.setTitle(bttnStr, for: .normal)
        bttn.backgroundColor = UIColor.grayL2EXTEND()
        bttn.setTitleColor(.black, for: .normal)
        stackView.customizeStackViewUI(distribution: .fill, alignment: .leading, axis: orientation, spacing: 3)
        
        let label = UILabel()
        label.text = inputStr
        if orientation == .vertical {
            label.text = " "
            bttn.setTitleColor(.gray, for: .normal)
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(bttn)
            label.textAlignment = NSTextAlignment.left
            bttn.heightAnchor.constraint(equalToConstant: 45).isActive = true
            label.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
            bttn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
        } else
        {
            stackView.spacing = 0
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(bttn)
            bttn.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 0, borderWidth: 1)
            label.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 0, borderWidth: 1)
            label.textAlignment = NSTextAlignment.left
            label.heightAnchor.constraint(equalTo: bttn.heightAnchor, multiplier: 1).isActive = true
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
            stackView.distribution = .fill
        }
    }
    /**Add a label and textfield to tableview*/
    func addTaskTextFieldInfo (_ tempstackView : UIStackView, _ inputStr : String,_ textField : UITextField) {
        textField.text = ""
        textField.backgroundColor = UIColor.grayL2EXTEND()
        textField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 5, borderWidth: 1)
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        tempstackView.customizeStackViewUI(distribution: .fill, alignment: .leading, axis: .vertical, spacing: 3)
      
        let label = UILabel()
        label.textAlignment = NSTextAlignment.left
        label.text = ""
        textField.placeholder = " \(inputStr)"
        tempstackView.addArrangedSubview(label)
        tempstackView.addArrangedSubview(textField)
        label.widthAnchor.constraint(equalTo: tempstackView.widthAnchor, multiplier: 1).isActive = true
        textField.widthAnchor.constraint(equalTo: tempstackView.widthAnchor, multiplier: 1).isActive = true
    }
    
    //Setting a Line underneat the view
    static func setlineDevider (_ stackView : UIStackView, _ color : UIColor) {
        let seperator = UIView()
        seperator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        seperator.backgroundColor = color
        stackView.insertArrangedSubview(seperator, at: 1)
        seperator.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1).isActive = true
    }
}
