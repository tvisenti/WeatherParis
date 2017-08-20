//
//  DetailViewController.swift
//  Météo Paris
//
//  Created by Thomas VISENTIN on 8/18/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dayWeatherInfo = [WeatherInfo]()
    var actualWeather = WeatherInfo()
    
    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for weather in dayWeatherInfo {
            if weather.hour == "12:00" {
                actualWeather = weather
            }
        }
        if actualWeather.date! == "" {
            actualWeather = dayWeatherInfo.first!
        }
        setWeather()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItemTitle.title = "Date: " + actualWeather.date!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setWeather() {
        imageView.image = UIImage(named: actualWeather.icon!)
        hourLabel.text = actualWeather.hour
        degreeLabel.text = actualWeather.degree
        mainLabel.text = actualWeather.main
        humidityLabel.text = "Humidité: " + actualWeather.humidity!
        windLabel.text = "Vent: " + actualWeather.wind!
        descriptionLabel.text = "Description: " + actualWeather.description!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actualWeather = dayWeatherInfo[indexPath.row]
        setWeather()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayWeatherInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tmpWeather = dayWeatherInfo[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPrototypeCellID") as! DetailPrototypeCell
        cell.imageViewCell.image = UIImage(named: tmpWeather.icon!)
        cell.hourLabelCell?.text = tmpWeather.hour
        cell.degreeLabelCell.text = tmpWeather.degree
        cell.backgroundColor = UIColor.changeBackgroundColor(icon: tmpWeather.icon!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
