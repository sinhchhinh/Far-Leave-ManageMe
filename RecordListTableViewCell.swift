//
//  RecordListTableViewCell.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/12/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class RecordListTableViewCell: UITableViewCell {

    @IBOutlet weak var displayImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var tolCost: UILabel!
    @IBOutlet weak var DOP: UILabel! //Date of purchase 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
