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
            } else {
                print("Error (viewDidLoad/getInfoToApi)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWeatherInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tmpWeather = WeatherInfo()
        
        // Get 12h00 if exist or first hour
        for weather in allWeatherInfo[indexPath.row] {
            if weather.hour == "12:00" {
                tmpWeather = weather
            }
        }
        if tmpWeather.hour == "" {
            tmpWeather = allWeatherInfo[indexPath.row].first!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePrototypeCellID") as! HomePrototypeCell
        cell.imageViewCell?.sd_setImage(with: URL(string: tmpWeather.iconURL!), placeholderImage: UIImage(named: tmpWeather.iconURL!))
        cell.dayLabelCell?.text = tmpWeather.date
        cell.degreeLabelCell.text = tmpWeather.degree
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewControllerID") as! DetailViewController
        detailVC.dayWeatherInfo = allWeatherInfo[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
