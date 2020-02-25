//
//  SpotsModel.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/12.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import Foundation

class SpotsModel {
    var identifier: Int
    var latitude: Double
    var locationName: String
    var longitude: Double
    var name: String
    var placesList: String
    var thumbnailName: String
    var userRating: Int
    var weatherInfo: String
    var whatToSee: String
    var whyVisit: String
    var wikipediaLink: String
    init(identifier: Int, latitude: Double, locationName: String, longitude: Double,
         name: String, placesList: String, thumbnailName: String, userRating: Int,
         weatherInfo: String, whatToSee: String, whyVisit: String, wikipediaLink: String) {
        self.identifier = identifier
        self.latitude = latitude
        self.locationName = locationName
        self.longitude = longitude
        self.name = name
        self.placesList = placesList
        self.thumbnailName  = thumbnailName
        self.userRating =  userRating
        self.weatherInfo = weatherInfo
        self.whatToSee = whatToSee
        self.whyVisit   = whyVisit
        self.wikipediaLink = wikipediaLink
    }
    convenience init() {
        self.init(identifier: 0, latitude: 0, locationName: "", longitude: 0,
        name: "", placesList: "", thumbnailName: "", userRating: 0,
        weatherInfo: "",  whatToSee: "", whyVisit: "", wikipediaLink: "")
    }
}
