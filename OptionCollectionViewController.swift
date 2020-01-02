//
//  OptionCollectionViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/2/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class OptionCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    static var selectedCategory = ""

    let types = [ "Food","Entertainment","Outing","HealthCare","Education","Shopping", "Housing", "Transporation" , "Utilities", "SelfCare", "Debt" , "Retirement" , "Gift" , "Others" ]

    var indexForPageView    : Int = 0
    var currMDisplay : Int = 0
    var currFWeekStartDisplay : Int = 0
    
    var cellWidth : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        let layout   = UICollectionViewFlowLayout()
        cellWidth = collectionView.bounds.width / 10
        print("width if cell \(cellWidth)")
        layout.itemSize = CGSize(width: cellWidth, height: 50 )
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing      = 5
        collectionView.collectionViewLayout = layout
        
        collectionView.layer.cornerRadius = 10.0
        collectionView.layer.shadowRadius = 50.0
        collectionView.layer.borderWidth = 1
        collectionView.backgroundColor = .white
        collectionView.layer.borderColor = UIColor.gray.cgColor
        collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NewRecordViewController.currMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*OptionCollectionViewController.selectedCategory = types[indexPath.item]
        let selectedCell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = .grayL3EXTEND()
        
        print (OptionCollectionViewController.selectedCategory)*/
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let idCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionCollectionViewCell", for: indexPath) as! OptionCollectionViewCell
       // idCardCell.optionImgView.image = UIImage(named: "add")
        idCardCell.optionImgView.isHidden = true
        if NewRecordViewController.currMonth[indexPath.item] != 0 {

            idCardCell.dayLabel.text = "\(NewRecordViewController.currMonth[indexPath.item])"
        }
        idCardCell.contentView.backgroundColor = .white
        return idCardCell

    }
    

}
