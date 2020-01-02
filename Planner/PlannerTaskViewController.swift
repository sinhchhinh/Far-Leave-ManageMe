//
//  PlannerTaskViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/26/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class PlannerTaskViewController: UIViewController {

    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    @IBOutlet weak var repeatOutlet: UIButton!
    @IBOutlet weak var alertOutlet: UIButton!
    
    
    @IBOutlet weak var allDaySwitch: UISwitch!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startDateOutlet: UIButton!
    @IBOutlet weak var endDateOutlet: UIButton!
    @IBAction func submit(_ sender: Any) {
        
    }
    @IBAction func cancel(_ sender: Any) {
    }
    
    @IBAction func repeatBttn(_ sender: Any) {
    }
    
    @IBAction func AlertBttn(_ sender: Any) {
    }
    
    @IBAction func startDateBttn(_ sender: Any) {
    }
    
    @IBAction func endDateBttn(_ sender: Any) {
    }
    

    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    @IBOutlet weak var colorMark1: UIButton!
    @IBOutlet weak var colorMark2: UIButton!
    @IBOutlet weak var colorMark3: UIButton!
    @IBOutlet weak var colorMark4: UIButton!
    @IBOutlet weak var colorMark5: UIButton!
    @IBOutlet weak var colorMark6: UIButton!
    
    @IBAction func colorMarksAction(_ sender: Any) {
        NavigationService.navigateToSignIn(self)
    }
    
    
    @IBAction func starsAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI () {
        
        view.backgroundColor = SettingViewController.globalBGcolor
        taskView.backgroundColor = UIColor.grayL3EXTEND()
        taskView.setViewBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor, cornerRadius: 12, borderWidth: 1)
        startDateLabel.backgroundColor = UIColor.grayL2EXTEND()
        endDateLabel.backgroundColor = UIColor.grayL2EXTEND()
        startDateOutlet.backgroundColor = UIColor.grayL2EXTEND()
        endDateOutlet.backgroundColor = UIColor.grayL2EXTEND()
        
        taskTextField.backgroundColor = .grayL2EXTEND()
        detailTextField.backgroundColor = .grayL2EXTEND()
        locationTextField.backgroundColor = .grayL2EXTEND()
        repeatOutlet.backgroundColor = .grayL2EXTEND()
        alertOutlet.backgroundColor = .grayL2EXTEND()
        
      


    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
