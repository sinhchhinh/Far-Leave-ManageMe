//
//  SignInViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 11/18/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate , UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var instruct : UILabel!
    @IBOutlet weak var forgetPwd: UILabel!
    @IBOutlet weak var forgetUsrName: UILabel!
    @IBOutlet weak var termCondition: UILabel!

    @IBOutlet weak var usrnameTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var signupImg: UIImageView!
    let doneBar  : UIToolbar  = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

    //Required for eyesicons
    let rightBttnView = UIView(frame: CGRect(x:0.0, y:0.0, width: 32, height: 28)) //FOR EYESICONS
    let rightImgView  = UIImageView(frame: CGRect(x:0.0, y:0.0, width: 28, height: 28))
    let showImg      = UIImage(named: "icon")
    let hideImg      = UIImage(named: "icon")
    static var fontSize : UIFont!
    

    @IBAction func loginBtn(_ sender: Any) {
        //NavigationService.navigateToAuthentication(self)
       /* let mainController = storyboard?.instantiateViewController(identifier: "MainTabViewController") as! MainTabViewController
        mainController.selectedViewController = mainController.viewControllers?[2]
        present(mainController, animated: true, completion: nil)*/
        
       let storyBoard: UIStoryboard = UIStoryboard( name: "SpendingRecord" , bundle: nil)
        let mainController = storyBoard.instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
        mainController.selectedViewController = mainController.viewControllers?[1]
        present(mainController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myCalendar = Calendar(identifier: .gregorian)
        let ymd = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: Date())
        
        let month = getTolDaysOfMonth(month: ymd.month!)
        var currMonth : [Int] = []
        print (ymd)
        // Do any additional setup after loading the view.
        print (month)
        for i in 1...month {
            currMonth.append(i)
            print("I val: \(i) ")
        }
        initUI()

    }
    
    func getTolDaysOfMonth (month : Int) -> Int {
           if month % 2 == 0 && month > 2
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
    
    
    func initUI () {
        usrnameTextField.delegate = self
        pwdTextField.delegate = self
        usrnameTextField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 2)
        pwdTextField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 2)
        
        loginOutlet.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 10, borderWidth: 2)

        //Addint doneBar to allow user ability to exit the keyboard
        doneBar.backgroundColor = .grayL3EXTEND()
        let nextButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.init(rawValue: 24) ?? UIBarButtonItem.SystemItem(rawValue: 0)!, target: self, action: #selector(self.exitKeyBoard))
        doneBar.setItems([nextButton], animated: false)
        usrnameTextField.inputAccessoryView = doneBar
        pwdTextField.inputAccessoryView = doneBar
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    /**Stop Displaying the keyboard*/
    @objc func exitKeyBoard () {  view.endEditing(true) }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }

}
