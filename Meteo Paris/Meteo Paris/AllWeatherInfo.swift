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
    
    var allDayWeather = [[WeatherInfo]]()
    var tmpWeather: WeatherInfo = WeatherInfo()

    func initWeatherInfo(json: JSON) {
        print(json)
        var tmpGroupWeather = [WeatherInfo]()
        
        if let lst = json["list"].array {
            for list in lst {
                if let date = list["dt_txt"].string?.components(separatedBy: " ") {
                    tmpWeather.initWeather(json: list, dt: date)
                    print(tmpWeather)
                    if tmpGroupWeather.isEmpty {
                        tmpGroupWeather.append(tmpWeather)
                        print("Je rentre une fois")
                    } else if date[0] == tmpGroupWeather.first?.date! {
                        tmpGroupWeather.append(tmpWeather)
                        print("J'ai la meme date")
                    } else {
                        allDayWeather.append(tmpGroupWeather)
                        tmpGroupWeather.removeAll()
                        tmpGroupWeather.append(tmpWeather)
                        print("Nouvelle date")
                    }
                }
            }
        }
//        for day in allDayWeather {
//            for hour in day {
//                print(hour)
//            }
//        }
        
        //        skills.removeAll()
        //        if let cursus = json["cursus_users"].array {
        //            for entry in cursus {
        //                let cursus_name = entry["cursus"]["slug"].stringValue
        //                if cursus_name == "42" {
        //                    isStudent = true
        //                    level = entry["level"].floatValue
        //                    if let skls = entry["skills"].array {
        //                        for skill in skls {
        //                            let skillOb = SkillsUser()
        //                            skillOb.initSkill(json: skill)
        //                            self.skills.append(skillOb)
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //
        //        projects.removeAll()
        //        if let projects = json["projects_users"].array {
        //            for project in projects {
        //                let projectOb = ProjectsUser()
        //                projectOb.initProjects(json: project)
        //                self.projects.append(projectOb)
        //            }
        //        }
        //    }
        
    }
}
