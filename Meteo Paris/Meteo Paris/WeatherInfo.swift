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
    
    var date : String? = ""
    var hour : String? = ""
    var main : String? = ""
    var description : String? = ""
    var icon : String? = ""
    var degree : String? = ""
    var humidity : String? = ""
    var wind : String? = ""
    
    func initWeather(json: JSON, dt : [String]) -> WeatherInfo {
        let weatherInfo = WeatherInfo()
        
        weatherInfo.date = substringDate(fullDate: dt[0])
        
        // Get only hours and minutes
        weatherInfo.hour = String(dt[1].prefix(5))
        
        let data = json["weather"].array?.first
        if let tmpMain = data?["main"].stringValue {
            weatherInfo.main = tmpMain
        }
        if let tmpDescription = data?["description"].stringValue {
            weatherInfo.description = tmpDescription
        }
        if let icon = data?["icon"].stringValue {
            weatherInfo.icon = icon
        }
        
        // Convert kelvin to celsius (-273)
        weatherInfo.degree = String(json["main"]["temp"].intValue - 273) + "°C"
        weatherInfo.humidity = json["main"]["humidity"].stringValue + "%"
        weatherInfo.wind = json["wind"]["speed"].stringValue + " m/s"
        return (weatherInfo)
    }
    
    // Reverse date for french reading
    func substringDate(fullDate : String) -> String {
        
        let indexDay = fullDate.suffix(5)
        let month = indexDay.prefix(2)
        let day = indexDay.suffix(2)
        
        return day + "/" + month
    }
    
    func transformToURL(icon : String) -> String {
        return ("https://openweathermap.org/img/w/" + icon + ".png")
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

