//
//  NewTaskTableViewCell.swift
//  Far-Leave-Money-Tracker
//
//  Created by Sinhchhinh Lor on 12/28/19.
//  Copyright © 2019 PanPenFamily. All rights reserved.
//

import UIKit

class NewTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    // Remove current info in taskStackView to proevent repeat cell when scroll up and down 
    override func prepareForReuse() {
        super.prepareForReuse()
        taskStackView.subviews.forEach { (view) in
                view.removeFromSuperview()    
        }

    }


}
