//
//  APIHandler.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Oauth {
    
    let KEY_CITY = "6455259"
    let API_KEY = "f0b817cd450a59cc9e829a8aea337c61"
    let API_SITE = "https://api.openweathermap.org/data/2.5/"
    
//    var access_token : String!
//    var created_token : Double!
//    var expired_token : Double!
    
    static let sharedInstance = Oauth()

    private func callAPIWeather() -> URL {
        return URL(string: API_SITE + "forecast?id=" + KEY_CITY + "&appid=" + API_KEY)!
    }
    
    func getInfoToApi(completionHandler: @escaping (Bool, Error?, [[WeatherInfo]]?) -> ()) {
        
        // voir si on utilise l'ancien call ou si ca fait + de 10min
        
        DispatchQueue.global(qos: .background).async {
            print("Call to API")
            var request = URLRequest(url: self.callAPIWeather())
            
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    completionHandler(false, error!, nil)
                } else if let d = data {
                    let dataString = NSString(data: d, encoding: String.Encoding.utf8.rawValue)
                    if let dataFromString = dataString?.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false) {
                        let weatherInfo = JSON(data: dataFromString)
                        DispatchQueue.main.async {
                            if weatherInfo.isEmpty == false {
                                let allWeatherInfo = AllWeatherInfo.sharedInstance.initWeatherInfo(json: weatherInfo)
                                completionHandler(true, nil, allWeatherInfo)
                            } else {
                                completionHandler(false, nil, nil)
                                print("Error (getInfoToApi)")
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
