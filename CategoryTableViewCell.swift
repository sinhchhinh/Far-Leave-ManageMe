//
//  CategoryTableViewCell.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 1/5/20.
//  Copyright © 2020 PanPenFamily. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categorycell_stackview: UIStackView!
    @IBOutlet weak var category_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        categorycell_stackview.subviews.forEach { (view) in
            if view != category_name {
              //  view.removeFromSuperview()
            }
        }
    }

}
