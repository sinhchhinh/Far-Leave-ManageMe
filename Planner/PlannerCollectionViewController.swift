//
//  PlannerCollectionViewController.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/23/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class PlannerCollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    var indexForPageView    : Int = 0
    @IBOutlet weak var collectionView: UICollectionView!
    var cellWidth : CGFloat!
    var arrayList : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        let layout   = UICollectionViewFlowLayout()
        cellWidth = collectionView.bounds.width / 9
        layout.itemSize = CGSize(width: cellWidth, height: 40 )
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("value of curr:\(arrayList)")
        return arrayList.count //issue only 35 count when its supposed to be 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let idCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "plannerCell", for: indexPath) as! PlannerCollectionViewCell
        // idCardCell.optionImgView.image = UIImage(named: "add")
        print ("THe current value of the collection view :\(indexPath.item)")
         if arrayList[indexPath.item] != 0 {
            idCardCell.dayLabel.text = "\(PlannerMainViewController.currMonth[indexPath.item])"
         }
         idCardCell.contentView.backgroundColor = .white
         return idCardCell
    }
    
}
