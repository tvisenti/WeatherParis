//
//  AllWeatherInfo.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class AllWeatherInfo {
    
    static let sharedInstance = AllWeatherInfo()
    
    var groupWeather = [[WeatherInfo]]()
    var tmpWeather: WeatherInfo = WeatherInfo()

    func initWeatherInfo(json: JSON) -> [[WeatherInfo]] {
        print(json)
        var tmpGroupWeather = [WeatherInfo]()
        
        if let lst = json["list"].array {
            for list in lst {
                if let date = list["dt_txt"].string?.components(separatedBy: " ") {
                    tmpWeather.initWeather(json: list, dt: date)
                    tmpWeather.printWeatherInfo()
                    if tmpGroupWeather.isEmpty {
                        tmpGroupWeather.append(tmpWeather)
                    } else if date[1] != "00:00:00" {
                        tmpGroupWeather.append(tmpWeather)
                    } else {
                        groupWeather.append(tmpGroupWeather)
                        tmpGroupWeather.removeAll()
                        tmpGroupWeather.append(tmpWeather)
                    }
                }
            }
        }
        print(tmpGroupWeather)
        print(groupWeather)
        return groupWeather
    }
}
