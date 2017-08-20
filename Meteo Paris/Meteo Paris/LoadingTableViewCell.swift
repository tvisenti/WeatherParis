//
//  LoadingTableViewCell.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/20/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet var loadingIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
