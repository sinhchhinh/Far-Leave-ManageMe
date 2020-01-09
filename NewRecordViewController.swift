//
//  NewRecordViewController.swift
//  Far-Leave-Money-Tracker
//  Created by Sinhchhinh Lor on 11/19/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//  Contains UI that allows user ability to enter information of the recently purchased items


import UIKit
class NewRecordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var visualViewBlur: UIVisualEffectView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var categoryPopView: UIView!
    @IBOutlet weak var newRecordView: UIView!
    @IBOutlet weak var contentPopView: UIView!
    @IBOutlet weak var weekStackView: UIStackView!
    @IBOutlet weak var popupDescLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var dateDisplayLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var reason1TextField: UITextField!
    @IBOutlet weak var totalCostTextField: UITextField!
    @IBOutlet weak var categoryOutlet: UIButton!
    @IBOutlet weak var calendarOutlet: UIButton!
    @IBOutlet weak var selectOptOutlet: UIButton!
    @IBOutlet weak var cancelOptOutlet: UIButton!
    @IBOutlet weak var star1Outlet: UIButton!
    @IBOutlet weak var star2Outlet: UIButton!
    @IBOutlet weak var star3Outlet: UIButton!
    @IBOutlet weak var star4Outlet: UIButton!
    @IBOutlet weak var star5Outlet: UIButton!
    var currentViewIndex   : Int = 100 //The current page that is displaying in pageviewcontroller

    var viewEffectProp:UIVisualEffect!
    let types = [ "Food","Entertainment","Outing","HealthCare","Education","Shopping", "Housing", "Transporation" , "Utilities", "SelfCare", "Debt" , "Retirement" , "Gift" , "Others" ]
    let dataSource = 200 //["", "", "" , ""]
    static var currMonth : [Int] = []
    var startDay : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        
    }
    
    
    @IBAction func starsBttn(_ sender: UIButton) {
        if sender.imageView?.tintColor != SettingViewController.globalBGcolor {
            sender.imageView?.tintColor = SettingViewController.globalBGcolor
        } else {
            sender.imageView?.tintColor = .lightGray
        }
    }
    
    @IBAction func selectOptBttn(_ sender: Any) {
    }
    
    
    @IBAction func cancelOptAction(_ sender: Any) {
        animateOutPopView()
    }
    
    
    func initUI () {
        
        viewEffectProp = visualViewBlur.effect //Store the effect of the visualViewBlur in viewEffect
        visualViewBlur.effect = nil
        costTextField.delegate = self
        amountTextField.delegate = self
        descTextField.delegate = self
        nameTextField.delegate = self
        reason1TextField.delegate = self
        totalCostTextField.delegate = self
        costTextField.backgroundColor = .grayL2EXTEND()
        amountTextField.backgroundColor = .grayL2EXTEND()
        descTextField.backgroundColor = .grayL2EXTEND()
        nameTextField.backgroundColor = .grayL2EXTEND()
        reason1TextField.backgroundColor = .grayL2EXTEND()
        totalCostTextField.backgroundColor = .grayL2EXTEND()
        newRecordView.backgroundColor = .grayL3EXTEND()
        mainView.backgroundColor = SettingViewController.globalBGcolor
        
        newRecordView.setViewBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor , cornerRadius: 12, borderWidth: 1)
        categoryPopView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1)
        calendarOutlet.setBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor, cornerRadius: 12, borderWidth: 1)
        categoryOutlet.setBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor, cornerRadius: 12, borderWidth: 1)
        selectOptOutlet.setBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor, cornerRadius: 12, borderWidth: 1)
        cancelOptOutlet.setBorderUIEXTEND(borderColor: SettingViewController.globalBGcolor.cgColor, cornerRadius: 12, borderWidth: 1)
        selectOptOutlet.backgroundColor = .grayL3EXTEND()
        cancelOptOutlet.backgroundColor = .grayL3EXTEND()
        
        weekStackView.isHidden = true
        
        //Done bar for textField
        let doneBar  : UIToolbar  = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneBar.sizeToFit()
        doneBar.backgroundColor = .white
        let nextButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.exitKeyBoard))
        doneBar.setItems([nextButton], animated: false)
        costTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        amountTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        descTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        nameTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        reason1TextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))
        totalCostTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.exitKeyBoard)))

    }
    /**End keyboard editing*/
    @objc func exitKeyBoard ()
    {
        view.endEditing(true)
    }
    
    /**Set return functionality key for each textfield */
        func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
            switch textField {
                case nameTextField:
                    amountTextField.becomeFirstResponder()
                
                case amountTextField:
                    costTextField.becomeFirstResponder()
                
                case costTextField:
                    totalCostTextField.becomeFirstResponder()
                            
                case totalCostTextField:
                    descTextField.becomeFirstResponder()
                
                case descTextField:
                    reason1TextField.becomeFirstResponder()
  
                default:
                  textField.endEditing(true)
                break
            }
            return true
        }
    
    @IBAction func saveBar(_ sender: Any) {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let cost = Float (costTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0.0
        let category = OptionCollectionViewController.selectedCategory
        let desc = descTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let amount = Int(costTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) ?? 0
        let totalCost = Float (totalCostTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) ?? 0.0
        let date = Date()
        let tempItem =  ItemObject.init(itemName: name, category: category, desc: desc, amount: amount, price: cost, totalCost: totalCost, purchaseDate: date)
        //Add database new tempItemm
        NavigationService.navigateToMainSpendingPage(self)
        animateOutPopView()
    }
    
    @IBAction func closeBar(_ sender: Any) {
        NavigationService.navigateToAddItemPage(self)
        
        animateOutPopView()
    }
    @IBAction func categoryBttn(_ sender: Any) {
        self.view.addSubview(categoryPopView)
        popupDescLabel.text = "Select the category of the purchased item:"
        weekStackView.isHidden = true
        categoryPopView.center = self.view.center
        self.view.backgroundColor = SettingViewController.globalBGcolor.withAlphaComponent(0.8)
        categoryPopView.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
        showAnimate()
        configurePageViewController()
    }
    @IBAction func calendarBttn(_ sender: Any) {
        weekStackView.isHidden = false
        self.view.addSubview(categoryPopView)
        categoryPopView.center = self.view.center
        self.view.backgroundColor = SettingViewController.globalBGcolor.withAlphaComponent(0.8)
        categoryPopView.layer.cornerRadius = 5

        popupDescLabel.text = "Select the date of purchase: "
        
        let myCalendar = Calendar(identifier: .gregorian)
        let currYMD = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: Date())
        let month = getTolDaysOfMonth(month: currYMD.month!)
        currM = currYMD.month
        currY = currYMD.year!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime = formatter.date(from: "\(currYMD.year!)/\(currYMD.month!)/01")
        let firstWeek = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: someDateTime!)
        let monthStr = getMonth(currM)
        dateDisplayLabel.text = "\(currY ?? 0  ) - \(monthStr)"
        print (firstWeek)
        // Do any additional setup after loading the view.
        print (month)
        for i in 1...month {
            NewRecordViewController.currMonth.append(i)
            print("I val: \(i) ")
        }
        showAnimate()
        configurePageViewController()
    }
    
    func getMonth (_ month : Int) -> String {
        
        switch month {
        case 1:
            return "January"
        case 2:
            return "Feburary"
        case 3: return "March"
        case 4: return "April"
        case 5: return "May"
        case 6: return "June"
        case 7: return "July"
        case 8: return "August"
        case 9 : return "September"
        case 10 : return "October"
        case 11: return "November"
        case 12: return "December"
        default:
            return ""
        }
    }
    var currM : Int!
    var currY : Int!
    func getDateComponent(year : Int, month : Int ) {
         let myCalendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime = formatter.date(from: "\(year)/\(month)/01")
        print ("value of someDatetime :\(someDateTime)")
        let firstWeek = myCalendar.dateComponents([.year, .month, .day ,.weekday,  .yearForWeekOfYear], from: someDateTime!)
        var month = getTolDaysOfMonth(month: firstWeek.month!)
        print (firstWeek)
        // Do any additional setup after loading the view.
        print (month)
        NewRecordViewController.currMonth.removeAll()
        for i in 1...month {
            if i >= firstWeek.weekday!{
                for j in 1...month {
                    NewRecordViewController.currMonth.append(j)
                }
                break
            } else {
                NewRecordViewController.currMonth.append(0)
            }
                   print("I val: \(i) ")
        }
    }
    
    func showAnimate () {
        categoryPopView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        categoryPopView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.visualViewBlur.effect = self.viewEffectProp
            self.visualViewBlur.isHidden = false
            self.categoryPopView.alpha = 1
            self.categoryPopView.transform = CGAffineTransform.identity
        }
    }

    func animateOutPopView () {
        UIView.animate(withDuration: 0.3, animations: {
            self.categoryPopView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.categoryPopView.alpha = 0
            //self.visualViewBlur.effect = nil
            self.visualViewBlur.isHidden = true
        }) { (success:Bool) in
            self.categoryPopView.removeFromSuperview()
        }
    }
        
    func detailViewControllerAt( _ i : Int) -> OptionCollectionViewController? {
        //to prevent over step the array
        if i >= dataSource || dataSource == 0 {
            return nil }
        guard let dataViewController = self.storyboard?.instantiateViewController(withIdentifier: "OptionCollectionViewController") as? OptionCollectionViewController
            else { return nil }
        
        //Add data to the view
        dataViewController.indexForPageView = i
        //everyswipe the date change
      
        return dataViewController
    }
    
    /**Process to add the pageviewcontroller into the idcardviewcontroller*/
    func configurePageViewController()
    {   //get reference to custom pageviewcontroller
        let storyBoardNew: UIStoryboard = UIStoryboard( name: "SpendingRecord" , bundle: nil)
        guard let pageViewController = storyBoardNew.instantiateViewController(withIdentifier: "PopUpPageViewController") as? UIPageViewController
            else { return }
        
        // Assign the deligate and datasource then need to add some required methods
        pageViewController.delegate     = self
        pageViewController.dataSource   = self
        
        //Add the pageViewController as the main view child
        addChild(pageViewController)
        
        //Tell the pageviewcontroller that we added it to the parent
        pageViewController.didMove(toParent: self)
        
        //Make sure the content fit the window
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.backgroundColor = UIColor.white //The background of the dot view
        
        contentPopView.addSubview(pageViewController.view)
        
        // Set the page view controller to the contentview size
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: contentPopView.frame.width, height: contentPopView.frame.height)
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.black
        
        //Get the first viewcontroller
        guard let startingViewController = detailViewControllerAt( currentViewIndex) else{  return }
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
}

extension NewRecordViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? OptionCollectionViewController
        var currentIndex = dataViewController!.indexForPageView
        currentViewIndex = currentIndex
        if currentIndex == 0 {
            return nil }
        currentIndex -= 1
              if currM  == 1 {
                    currY = currY - 1
                    currM = 12
                  getDateComponent(year: currY, month: currM )
              } else {
                    currM = currM - 1
                  getDateComponent(year: currY, month: currM )

            }
        let monthStr = getMonth(currM)
        dateDisplayLabel.text = "\(currY ?? 0)  \(monthStr)"

        return detailViewControllerAt(currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let dataViewController = viewController as? OptionCollectionViewController
        var currentIndex = dataViewController!.indexForPageView
        if currentIndex == dataSource {
            return nil }
        currentIndex = currentIndex + 1
        currentViewIndex = currentIndex
        if currM  == 12 {
            currM = 1
            currY = currY + 1
            getDateComponent(year: currY, month: currM )
        } else {
            currM = currM + 1
            getDateComponent(year: currY, month: currM )
        }
        let monthStr = getMonth(currM)
        dateDisplayLabel.text = "\(currY ?? 0)  \(monthStr)"
        return detailViewControllerAt(currentIndex)
    }
    
    /**Get the total number of days in a specific month*/
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
    
    //dispose of any resources that can be regreated
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
}

