//
//  ErrorTableViewCell.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/20/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import UIKit

class ErrorTableViewCell: UITableViewCell {

    @IBOutlet var errorLabelCell: UILabel!
    @IBOutlet var errorImageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        errorLabelCell.text = "Network error"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
