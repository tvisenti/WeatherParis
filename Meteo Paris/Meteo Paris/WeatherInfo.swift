//
//  WeatherInfo.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherInfo {
    
    static let sharedInstance = WeatherInfo()
    
    var date : String?
    var hour : String?
    var main : String?
    var description : String?
    var icon : String?
    var degree : String?
    var humidity : String?
    var wind : String?
    
    func initWeather(json: JSON, dt : [String]) {
        date = dt[0]
        hour = dt[1]
        main = json["weather"]["main"].stringValue
        description = json["weather"]["description"].stringValue
        icon = json["weather"]["icon"].stringValue
        degree = json["weather"]["main"].stringValue
        humidity = json["main"]["humidity"].stringValue
        wind = json["wind"]["speed"].stringValue
    }
}

