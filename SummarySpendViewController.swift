//
//  SummarySpendViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/4/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit
import Macaw

class SummarySpendViewController: UIViewController, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var itemDetailViewPopup: UIView!
    @IBOutlet weak var budgetTolView: UIView!
    @IBOutlet weak var chartView: MacawChartView!
    @IBOutlet weak var visualViewBlur: UIVisualEffectView!
    @IBOutlet weak var sendingRecordTableView: UITableView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var tolBdgetLabel: UILabel!
    @IBOutlet weak var tolSpendingLabel: UILabel!
    @IBOutlet weak var tolBdgetAmountLabel: UILabel!
    @IBOutlet weak var tolSpendingAmountLabel: UILabel!
    @IBOutlet weak var selectDateTextField: UITextField!
    @IBOutlet var categoryPopupTableview: UITableView!
    let existCategoryBttn : UIButton = UIButton()
    let selectCategoryBttn: UIButton = UIButton()
    
    //IBOutlet for DetailView Popup
    @IBOutlet weak var itemDetailTitle: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateOfPurchaseLabel: UILabel!
    @IBOutlet weak var purchaseDateTextField: UITextField!
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var totalPriceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var star1Outlet: UIButton!
    @IBOutlet weak var star2Outlet: UIButton!
    @IBOutlet weak var star3Outlet: UIButton!
    @IBOutlet weak var star4Outlet: UIButton!
    @IBOutlet weak var star5Outlet: UIButton!
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    @IBOutlet weak var choseOptionOutlet: UIButton!
    var categoryTypesList = ["", "", "Food", "Health", "Education" , "Petrol", "", ""]
    
    var itemObjList : [ItemObject] = [] //Store list of objects that a user added
    var viewEffectProp:UIVisualEffect! //the Visual effect used for displaying blur view
    var itemPurchaseDate : Date!
    var starCountDics : [Int : Int] = [0 : 0 , 1 : 0,2 : 0,3 : 0,4 : 0]
    static var selectedCategory = ""
    private var datePicker : UIDatePicker? //Date picker
    
    @IBAction func logOutItemBarAction(_ sender: Any) {
        NavigationService.navigateToSignIn(self)
    }
    @IBAction func gotoAddNewItemBarAction(_ sender: Any) {
        NavigationService.navigateToAddItemPage(self)
    }
    
    @IBAction func chooseOptionBttn(_ sender: UIButton) {
        showCategoryTableViewPopup()
        existCategoryBttn.addTarget(self, action: #selector(exitCateogryPopUp), for: .touchUpInside)
        selectCategoryBttn.addTarget(self, action: #selector(exitCateogryPopUp), for: .touchUpInside)


    }
    
    @objc func exitCateogryPopUp () {
         closeCategoryTableViewPopup()
     }
    
    @objc func selectCateogryAndClosePopUp () {
         closeCategoryTableViewPopup()
        print ("Selected category :\(SummarySpendViewController.selectedCategory)")
        MacawChartView.playAnimation()  //https://www.youtube.com/watch?v=hMyExC9swz8&t=441s

     }
    
    @IBAction func editBttn(_ sender: Any) {
        animateOut()
    }
    @IBAction func saveBttn(_ sender: Any) {
        animateOut()
        print ("starcountDics\(starCountDics)")
        
        let tolStarCount = starCountDics[0]! +  starCountDics[1]! + starCountDics[2]!  + starCountDics[3]!  + starCountDics[4]!
        let itemName = itemNameTextField.text
        let tolPrice = totalPriceTextField.text
        let amount   = amountTextField.text
        let desc     = descriptionTextField.text
        let purchaseDate = purchaseDateTextField.text
        
        print ("Total of Star count : \(tolStarCount)")
        
        
        
    }
    
    @IBAction func starOptionsBttn(_ sender: UIButton) {
        let starsBttnList  = [star1Outlet, star2Outlet, star3Outlet, star4Outlet,star5Outlet]
        var tempStarKey = 0
        switch sender {
        case star1Outlet:
            
            tempStarKey = 0
            print ("GOT CALLED STAR1")
            break
        case star2Outlet:
            tempStarKey = 1
            break
        case star3Outlet:
            tempStarKey = 2
            break
        case star4Outlet:
            tempStarKey = 3
            break
        case star5Outlet:
            tempStarKey = 4
            break
            
        default:
            break
        }
        sender.tintColor = .gray
        print ("The value of temStar key :\(tempStarKey)")
        for n in 0...starsBttnList.count - 1   {
            print ("value \(n)")
            if n <= tempStarKey {
                starsBttnList[n]!.setImage(UIImage.init(systemName: "star.fill"), for: .normal)
                setValInStarCountDic(val: 1,key: n)
            } else {
                print ("value in else \(n)")
                setValInStarCountDic(val: 0,key: n)
                starsBttnList[n]!.setImage(UIImage.init(systemName: "star"), for: .normal)
            }
        }
        print ("THe value in dictionary:\(starCountDics)")
    }
    func setValInStarCountDic (val : Int, key : Int) {
         starCountDics[key] = val
    }

    override func viewDidLoad() {
            super.viewDidLoad()
            itemObjList = generateItems()
        
        viewEffectProp = visualViewBlur.effect //Store the effect of the visualViewBlue in viewEffect
        visualViewBlur.effect = nil
        visualViewBlur.isHidden = true
        
        chartView.contentMode = .scaleAspectFit
        MacawChartView.playAnimation()  //https://www.youtube.com/watch?v=hMyExC9swz8&t=441s
        summaryLabel.layer.masksToBounds = true
        summaryLabel.layer.cornerRadius = 4
        summaryLabel.backgroundColor = .gray
        summaryLabel.textColor = .white
        choseOptionOutlet.layer.cornerRadius = 4
        choseOptionOutlet.backgroundColor = UIColor.grayL3EXTEND()
        
        selectDateTextField.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 18, borderWidth:1)
        selectDateTextField.backgroundColor = UIColor.grayL3EXTEND()
        budgetTolView.backgroundColor = UIColor.grayL2EXTEND()
        budgetTolView.setViewBorderUIEXTEND(borderColor: UIColor.white.cgColor, cornerRadius: 4, borderWidth: 1)
        tolBdgetLabel.textColor  = .black
        tolSpendingLabel.textColor = .black
        tolBdgetLabel.backgroundColor = UIColor.grayL3EXTEND()
        tolSpendingLabel.backgroundColor = UIColor.grayL3EXTEND()
        tolSpendingAmountLabel.backgroundColor = UIColor.grayL2EXTEND()
        tolBdgetAmountLabel.backgroundColor = UIColor.grayL2EXTEND()

        mainView.backgroundColor = SettingViewController.globalBGcolor
        sendingRecordTableView.layer.cornerRadius = 4
        initUI()
        
        }
    
    func initUI () {
        
        itemNameTextField.delegate = self
        totalPriceTextField.delegate = self
        descriptionTextField.delegate = self
        amountTextField.delegate = self
        purchaseDateTextField.delegate = self
        selectDateTextField.delegate = self
        selectDateTextField.text = (NSDate() as Date).toString(dateFormat: "MM/dd/yyyy")
        
        //For popupview outlet
        itemDetailViewPopup.layer.borderColor = SettingViewController.globalBGcolor.cgColor
        itemDetailViewPopup.layer.borderWidth = 1
        itemDetailViewPopup.layer.cornerRadius = 20
        
        datePicker = UIDatePicker ()
        datePicker?.datePickerMode = .date
        itemNameTextField.inputView = datePicker
        purchaseDateTextField.inputView = datePicker
        editOutlet.backgroundColor = .grayL3EXTEND()
        saveOutlet.backgroundColor = .grayL3EXTEND()
        itemDetailTitle.layer.masksToBounds = true
        itemDetailTitle.backgroundColor = SettingViewController.globalBGcolor
        itemDetailTitle.textColor = .white
        itemDetailTitle.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1)
        purchaseDateTextField.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 4, borderWidth: 1)
        editOutlet.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 4, borderWidth: 1)
        saveOutlet.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 4, borderWidth: 1)
        datePicker?.addTarget(self, action: #selector(dueDateChanged(sender:)), for: UIControl.Event.editingDidEnd)
        
        let toolbar  : UIToolbar  = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

               toolbar.barStyle = .default
               toolbar.items = [
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneButtonTapped)),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(self.cancelButtonTapped)),
               ]
               toolbar.sizeToFit()
        purchaseDateTextField.inputAccessoryView = toolbar
        let toolbarSelectDate  : UIToolbar  = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

                    toolbarSelectDate.barStyle = .default
                    toolbarSelectDate.items = [
                     UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneSelectDateBttnTapped)),
                     UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(self.cancelSelectBttnTapped)),
                    ]
                    toolbarSelectDate.sizeToFit()
        selectDateTextField.inputView = datePicker
        selectDateTextField.inputAccessoryView = toolbarSelectDate
    }
    
    @objc func doneSelectDateBttnTapped()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "MM/dd/yyyy"
        selectDateTextField.text = dateFormatter.string(from: datePicker!.date)
        view.endEditing(true)

    }
    @objc func cancelSelectBttnTapped()
    {
        selectDateTextField.text = itemPurchaseDate.toString(dateFormat: "MM/dd/yyyy")
        view.endEditing(true)
    }
    
    @objc func doneButtonTapped()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "MM/dd/yyyy"
        purchaseDateTextField.text = dateFormatter.string(from: datePicker!.date)
        self.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped()
    {
        purchaseDateTextField.text = itemPurchaseDate.toString(dateFormat: "MM/dd/yyyy")
        view.endEditing(true)
    }
    
    
    @objc func dueDateChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "MM/dd/yyyy"
        purchaseDateTextField.text = dateFormatter.string(from: datePicker!.date)
       // view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func showItemDetailPopup () {
        //Add popup to the SummarySpendViewController
        self.view.addSubview(itemDetailViewPopup)
        itemDetailViewPopup.center = self.view.center
        itemDetailViewPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        itemDetailViewPopup.alpha = 0
        print ("show item detial pop up called")

        UIView.animate(withDuration: 0.4) {
            self.visualViewBlur.effect = self.viewEffectProp
            self.visualViewBlur.isHidden = false
            self.itemDetailViewPopup.alpha = 1
            self.itemDetailViewPopup.transform = CGAffineTransform.identity
        }
    }
    
    func closeCategoryTableViewPopup () {
         UIView.animate(withDuration: 0.3, animations: {
                   self.categoryPopupTableview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                   self.categoryPopupTableview.alpha = 0
                   self.visualViewBlur.effect = nil
                   self.visualViewBlur.isHidden = true
               }) { (success:Bool) in
                   self.categoryPopupTableview.removeFromSuperview()
               }
    }
    
    func showCategoryTableViewPopup () {
           //Add popup to the SummarySpendViewController
           self.view.addSubview(categoryPopupTableview)
           categoryPopupTableview.center = self.view.center
           categoryPopupTableview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
           categoryPopupTableview.alpha = 0
           print ("show item detial pop up called")

           UIView.animate(withDuration: 0.4) {
               self.visualViewBlur.effect = self.viewEffectProp
               self.visualViewBlur.isHidden = false
               self.categoryPopupTableview.alpha = 1
               self.categoryPopupTableview.transform = CGAffineTransform.identity
           }
       }
    
    func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.itemDetailViewPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.itemDetailViewPopup.alpha = 0
            self.visualViewBlur.effect = nil
            self.visualViewBlur.isHidden = true
        }) { (success:Bool) in
            self.itemDetailViewPopup.removeFromSuperview()
        }
    }
    
    func generateItems () -> [ItemObject] {
        var itemsList : [ItemObject] = []
        let currentDateTime = Date()
        
        for _ in 1...23  {
            itemsList.append(ItemObject.init(itemName: "Food", category: "Food", desc: "Fruit", amount: 2, price: 30, totalCost: 200, purchaseDate: currentDateTime))
        }
        print("itemsList:\(itemsList.count)")
        return itemsList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sendingRecordTableView {
           return itemObjList.count } else {
           return categoryTypesList.count
        }
      }
      
      //Assign value to each table cell
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == sendingRecordTableView {

          tableView.rowHeight = 55
          let cell = tableView.dequeueReusableCell(withIdentifier: "recordcell", for: indexPath) as!  RecordListTableViewCell
          cell.layer.borderColor = UIColor.grayL3EXTEND().cgColor
          let currItemObj = itemObjList[indexPath.item]
          cell.itemName.text = String (currItemObj.getItemName())
          cell.tolCost.text = String(currItemObj.getTotalCost())
          cell.DOP.text = currItemObj.getPurchaseDate().toString(dateFormat: "MM-dd-yyyy")
            return cell
        }
        else {
            tableView.rowHeight = 40
            let cell = tableView.dequeueReusableCell(withIdentifier: "categories_cell", for: indexPath) as! CategoryTableViewCell
            switch indexPath.item {
            case 0:
                cell.category_name.text = "Display only the following:"
                cell.category_name.textColor = .white
                cell.backgroundColor = .gray
                cell.layer.cornerRadius = 4
                cell.layer.borderWidth = 1
            case 1:
                cell.isUserInteractionEnabled = false
                cell.category_name.text = ""
            case categoryTypesList.count - 2:
                cell.isUserInteractionEnabled = false
                cell.category_name.text = ""
            case categoryTypesList.count - 1:
                existCategoryBttn.setTitleColor(.black, for: .normal)
                selectCategoryBttn.setTitleColor(.black, for: .normal)
                existCategoryBttn.setTitle("Exit", for: .normal)
                selectCategoryBttn.setTitle("Select", for: .normal)
                existCategoryBttn.backgroundColor = UIColor.grayL3EXTEND()
                selectCategoryBttn.backgroundColor = UIColor.grayL3EXTEND()
                cell.categorycell_stackview.spacing = 20
                selectCategoryBttn.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 4, borderWidth: 1)
                existCategoryBttn.setBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 4, borderWidth: 1)
                cell.category_name.removeFromSuperview()
                cell.categorycell_stackview.addArrangedSubview(existCategoryBttn)
                cell.categorycell_stackview.addArrangedSubview(selectCategoryBttn)
                
            default:
                cell.category_name.text = categoryTypesList[indexPath.item]
                cell.layer.cornerRadius = 4
                cell.layer.borderWidth = 0.5
                break
            }
            cell.layer.borderColor = UIColor.grayL2EXTEND().cgColor
            return cell
        }
      }

      //action for the row that got selected
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView == sendingRecordTableView {
          showItemDetailPopup()
          let newInfo = itemObjList[indexPath.item]
          //Add inforation to popupview to display the detail
          itemNameTextField.text = newInfo.getItemName()
          totalPriceTextField.text = String(newInfo.getTotalCost())
          amountTextField.text = String (newInfo.getAmount())
          descriptionTextField.text = newInfo.getDesc()
         itemPurchaseDate = newInfo.getPurchaseDate()
         purchaseDateTextField.text = itemPurchaseDate.toString(dateFormat: "MM-dd-yyyy")
        } else {
            //Category
            SummarySpendViewController.selectedCategory = categoryTypesList[indexPath.item]
        }

      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          guard let detailViewController = segue.destination as? RecordDetailViewController,
              let index = sendingRecordTableView.indexPathForSelectedRow?.row
              else {
                  return
          }
          detailViewController.itemObj = itemObjList[index]
      }
      
      /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return goals.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chart", for: indexPath) as! BarCollectionViewCell
          cell.barView.translatesAutoresizingMaskIntoConstraints = false
          cell.barView.heightAnchor.constraint(equalToConstant: CGFloat (goals[indexPath.item])).isActive = true
          cell.backgroundColor = UIColor.DPinkEXTEND()
          return cell
      }
      
      //https://www.youtube.com/watch?v=oYXRKxeb7hE
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath) -> CGSize
      {
          return CGSize(width: 100, height: view.frame.height)

      }*/

}

        
       
