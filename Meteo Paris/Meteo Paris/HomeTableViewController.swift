//
//  HomeTableViewController.swift
//  Meteo Paris
//
//  Created by Thomas VISENTIN on 8/17/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewController: UITableViewController {
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    let oauthApi = Oauth.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        oauthApi.getInfoToApi { (hasSucceed, error, weather) in
            if hasSucceed {
                print("Get Weather Info is a success")
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
    
    
}
