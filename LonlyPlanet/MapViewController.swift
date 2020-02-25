//
//  MapViewController.swift
//  LonlyPlanet
//
//  Created by Hao Qiang on 2020/2/13.
//  Copyright © 2020 Hao Qiang. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var containView: UIView!
    var latitude: Double!
    var longitude: Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(self.longitude)
//        print(self.latitude)
//        print(self.title)
        // Do any additional setup after loading the view.
    //    containView.largeContentTitle = title
        let xy = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.setCenter(xy, animated: true)
        
        let region = MKCoordinateRegion(center: xy, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = xy
        mapView.addAnnotation(annotation)
        
    }
    
    @IBAction func closeMapView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
