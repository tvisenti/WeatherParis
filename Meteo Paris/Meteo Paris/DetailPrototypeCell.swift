//
//  DetailPrototypeCell.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/18/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class DetailPrototypeCell: UITableViewCell {
    
    @IBOutlet weak var hourLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var degreeLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
