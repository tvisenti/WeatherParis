//
//  HomePrototypeCell.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class HomePrototypeCell: UITableViewCell {
    
    @IBOutlet weak var dayLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var degreeLabelCell: UILabel!
    @IBOutlet weak var degreeNightLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
