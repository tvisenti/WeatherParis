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

extension UIColor {
    
    class func changeBackgroundColor(icon : String) -> UIColor {
        switch icon {
        case "01d":
            return UIColor.blueSkyColor()
        case "02d":
            return UIColor.cloudColor()
        case "03d":
            return UIColor.cloudsColor()
        case "04d":
            return UIColor.brokenCloudsColor()
        case "09d":
            return UIColor.showerRainColor()
        case "10d":
            return UIColor.rainColor()
        case "11d":
            return UIColor.thunderColor()
        case "13d":
            return UIColor.white
        case "50d":
            return UIColor.darkGray
        default:
            return UIColor.nightColor()
        }
    }
    
    class func blueSkyColor() -> UIColor {
        return UIColor(red: 0.749, green: 0.9569, blue: 0.9882, alpha: 1.0) /* #bff4fc */
    }
    
    class func cloudColor() -> UIColor {
        return UIColor(red: 0.8784, green: 0.8784, blue: 0.8784, alpha: 1.0) /* #e0e0e0 */
    }
    
    class func cloudsColor() -> UIColor {
        return UIColor(red: 0.8196, green: 0.8196, blue: 0.8196, alpha: 1.0) /* #d1d1d1 */
    }
    
    class func brokenCloudsColor() -> UIColor {
        return UIColor(red: 0.749, green: 0.749, blue: 0.749, alpha: 1.0) /* #bfbfbf */
    }
    
    class func showerRainColor() -> UIColor {
        return UIColor(red: 0.6471, green: 0.6471, blue: 0.6471, alpha: 1.0) /* #a5a5a5 */
    }
    
    class func rainColor() -> UIColor {
        return UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0) /* #999999 */
    }
    
    class func thunderColor() -> UIColor {
        return UIColor(red: 0.549, green: 0.549, blue: 0.549, alpha: 1.0) /* #8c8c8c */
    }
    
    class func mistColor() -> UIColor {
        return UIColor(red: 0.6824, green: 0.8706, blue: 0.902, alpha: 1.0) /* #aedee6 */
    }
    
    class func nightColor() -> UIColor {
        return UIColor(red: 0.4824, green: 0.6353, blue: 0.9686, alpha: 1.0) /* #7ba2f7 */
    }
}
