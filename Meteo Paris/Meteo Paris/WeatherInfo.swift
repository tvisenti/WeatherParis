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
        
        let data = json["weather"].array?.first
        if let tmpMain = data?["main"].stringValue {
            main = tmpMain
        }
        if let tmpDescription = data?["description"].stringValue {
            description = tmpDescription
        }
        if let tmpIcon = data?["icon"].stringValue {
            icon = tmpIcon
        }
        
        // Convert kelvin to celsius
        degree = String(json["main"]["temp"].intValue - 273)
        
        humidity = json["main"]["humidity"].stringValue
        wind = json["wind"]["speed"].stringValue
    }
    
    func printWeatherInfo() {
        print("--------------------")
        print("Date: " + date!)
        print("Hour: " + hour!)
        print("Main: " + main!)
        print("Description: " + description!)
        print("Icon: " + icon!)
        print("Degree: " + degree!)
        print("Humidity: " + humidity!)
        print("Wind: " + wind!)
    }
}

