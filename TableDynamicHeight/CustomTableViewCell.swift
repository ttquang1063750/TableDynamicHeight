//
//  CustomTableViewCell.swift
//  TableDynamicHeight
//
//  Created by Thanh Quang Ngoc Tuong on 2/6/16.
//  Copyright © 2016 Thanh Quang Ngoc Tuong. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lbFontName: UILabel!
    @IBOutlet weak var lbContent: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
