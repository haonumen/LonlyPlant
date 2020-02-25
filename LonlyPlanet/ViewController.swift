//
//  ViewController.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/9.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var spotsList: [SpotsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let plistPath = Bundle.main.path(forResource: "vacation_spots", ofType: "plist")
    
        if let listTemp: [NSDictionary] = NSArray(contentsOfFile: plistPath!) as? [NSDictionary] {
            for temp in listTemp {
                let spot = SpotsModel()
                
                spot.identifier = temp["identifier"] as! Int
                spot.latitude = temp["latitude"] as! Double
                spot.locationName = temp["locationName"] as! String
                spot.longitude = temp["longitude"] as! Double
                spot.name = temp["name"] as! String
                spot.placesList = temp["placesList"] as! String
                spot.thumbnailName = temp["thumbnailName"] as! String
                spot.userRating = temp["userRating"] as! Int
                spot.weatherInfo = temp["weatherInfo"] as! String
                spot.whatToSee = temp["whatToSee"] as! String
                spot.whyVisit = temp["whyVisit"] as! String
                spot.wikipediaLink = temp["wikipediaLink"] as! String
                
                spotsList.append(spot)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spotsList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "spotsList", for: indexPath) as! SpotsTableViewCell
        
        let row = (indexPath as NSIndexPath).row
        
        cell.nameLabel?.text = self.spotsList[row].name
        cell.locationLabel?.text = self.spotsList[row].locationName
        cell.thumbnailImageView?.image = UIImage(named: self.spotsList[row].thumbnailName)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSpotDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! SpotsDetailsViewController
                destinationController.spot = self.spotsList[indexPath.row]
            }
        }
    }

}

