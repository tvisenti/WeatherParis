//
//  HomeTableViewController.swift
//  Meteo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HomeTableViewController: UITableViewController {
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    let oauthApi = Oauth.sharedInstance
    var allWeatherInfo = [[WeatherInfo]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oauthApi.getInfoToApi { (hasSucceed, error, weather) in
            if hasSucceed {
                print("Get Weather Info is a success")
                self.allWeatherInfo = weather!
                self.tableView.reloadData()
//                self.performSegue(withIdentifier: "SearchToProfilSegue", sender: self)
            } else {
                print("Error (getInfoToApi): \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(allWeatherInfo.count)
        return allWeatherInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tmpWeather = allWeatherInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePrototypeCell") as! HomePrototypeCell
        
        //async
        cell.imageViewCell?.sd_setImage(with: URL(string: transformToURL(imageUrl: tmpWeather[indexPath.row].icon!)), placeholderImage: UIImage(named: tmpWeather[indexPath.row].icon! + ".png"))
        
        cell.dayLabelCell?.text = tmpWeather[indexPath.row].date
        cell.degreeLabelCell.text = tmpWeather[indexPath.row].degree
        return cell
    }
        
    func transformToURL(imageUrl : String) -> String {
        return ("https://openweathermap.org/img/w/" + imageUrl + ".png")
    }
}
