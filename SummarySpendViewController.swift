//
//  SummarySpendViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/4/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit
import Macaw

class SummarySpendViewController: UIViewController, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var visualViewBlur: UIVisualEffectView!
    @IBOutlet var itemDetailViewPopup: UIView!
    @IBOutlet weak var chartView: MacawChartView!
    @IBOutlet weak var sendingRecordTableView: UITableView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var tolBdgetLabel: UILabel!
    @IBOutlet weak var tolSpendingLabel: UILabel!
    @IBOutlet weak var tolBdgetAmountLabel: UILabel!
    @IBOutlet weak var budgetTolView: UIView!
    @IBOutlet weak var tolSpendingAmountLabel: UILabel!
    
    @IBOutlet weak var showDateOutlet: UIButton!
    
    //IBOutlet for DetailView Popup
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateOfPurchaseLabel: UILabel!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var totalPriceTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var purchaseDateOutlet: UIButton!
    @IBOutlet weak var star1Outlet: UIButton!
    @IBOutlet weak var star2Outlet: UIButton!
    @IBOutlet weak var star3Outlet: UIButton!
    @IBOutlet weak var star4Outlet: UIButton!
    @IBOutlet weak var star5Outlet: UIButton!
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    @IBOutlet weak var choseOptionOutlet: UIButton!
    
    @IBAction func logOutItemBarAction(_ sender: Any) { NavigationService.navigateToSignIn(self) }
    @IBAction func gotoAddNewItemBarAction(_ sender: Any) { NavigationService.navigateToAddItemPage(self) }
    
    @IBAction func chooseOptionBttn(_ sender: Any) {
        
    }
    
    
    @IBAction func showDateBttn(_ sender: Any) {
        
    }
    
    @IBAction func editBttn(_ sender: Any) {
        animateOut()
    }
    @IBAction func saveBttn(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func starOptionsBttn(_ sender: Any) {
        
    }
    
    
    @IBAction func PurchaseDateBttn(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        temp.count
    }
    
    //Assign value to each table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 55
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordcell", for: indexPath) as!  RecordListTableViewCell
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.darkGray.cgColor
        let currItemObj = temp[indexPath.item]
        cell.itemName.text = String (currItemObj.getItemName())
        cell.tolCost.text = String(currItemObj.getTotalCost())
        cell.DOP.text = currItemObj.getPurchaseDate().toString(dateFormat: "dd-MM-yyyy")
        return cell
    }
    
    //action for the row that got selected
    static var tolOfTableRow = 1
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showItemDetailPopup()
        let newInfo = temp[indexPath.item]
        itemTextField.text = newInfo.getItemName()
        totalPriceTextField.text = String(newInfo.getTotalCost())
        amountTextField.text = String (newInfo.getAmount())
        descriptionTextField.text = newInfo.getDesc()
        purchaseDateOutlet.titleLabel?.text = newInfo.getPurchaseDate().toString(dateFormat: "MM-dd-yyyy")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? RecordDetailViewController,
            let index = sendingRecordTableView.indexPathForSelectedRow?.row
            else {
                return
        }
        detailViewController.itemObj = temp[index]
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

    var temp : [ItemObject] = []
    var viewEffectProp:UIVisualEffect!

    override func viewDidLoad() {
            super.viewDidLoad()
            temp = generateItems()
        
        viewEffectProp = visualViewBlur.effect //Store the effect of the visualViewBlue in viewEffect
        visualViewBlur.effect = nil
        visualViewBlur.isHidden = true
        
           // chartCollectionView.delegate = self
           // chartCollectionView.dataSource = self
            
            // Do any additional setup after loading the view.
            //Change the scroll orientation of the collection view
           /* (chartCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
            chartCollectionView?.contentInsetAdjustmentBehavior = .always8*/
        itemDetailViewPopup.layer.borderColor = UIColor.red.cgColor
        itemDetailViewPopup.layer.borderWidth = 3
        itemDetailViewPopup.layer.cornerRadius = 20

        chartView.contentMode = .scaleAspectFit
        MacawChartView.playAnimation()
        //https://www.youtube.com/watch?v=hMyExC9swz8&t=441s
        summaryLabel.layer.masksToBounds = true
        summaryLabel.layer.cornerRadius = 12
        
        summaryLabel.backgroundColor = .gray
        showDateOutlet.setViewBorderUIEXTEND(borderColor: UIColor.gray.cgColor, cornerRadius: 12, borderWidth:1)
        showDateOutlet.backgroundColor = UIColor.grayL3EXTEND()
        budgetTolView.backgroundColor = UIColor.grayL3EXTEND()
        budgetTolView.setViewBorderUIEXTEND(borderColor: UIColor.grayL3EXTEND().cgColor, cornerRadius: 12, borderWidth: 1)
        tolBdgetLabel.textColor  = .red
        tolSpendingLabel.textColor = .red
        mainView.backgroundColor = SettingViewController.globalBGcolor
        sendingRecordTableView.layer.cornerRadius = 12
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

        }

        
       
