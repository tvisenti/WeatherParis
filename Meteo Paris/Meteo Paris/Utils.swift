//
//  Utils.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromURl(stringImageUrl url: String) -> UIImage? {
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                return (UIImage(data: data as Data))!
            }
        }
        return nil
    }
}
