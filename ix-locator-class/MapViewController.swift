//
//  MapViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, AddActivityDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let annotation = MKPointAnnotation()
    
    override func viewWillAppear(_ animated: Bool) {
        setMapType()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func setMapType() {

        let mapType = UserDefaults.standard.string(forKey: "mapType")
        
        if mapType != nil {
            
            if mapType == "hybrid" {
                map.mapType = .hybrid
            }
            
            if mapType == "hybridFlyover" {
                map.mapType = .hybridFlyover
            }
            
            if mapType == "satellite" {
                map.mapType = .satellite
            }
            
            if mapType == "satelliteFlyover" {
                map.mapType = .satelliteFlyover
            }
            
            if mapType == "standard" {
                map.mapType = .standard
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSaveActivity(activity: Activity) {
        print("Name: " + activity.name!)
        print("Description: " + activity.description!)
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: activity.latitude!,longitude: activity.longitude!)
        map.addAnnotation(annotation)
        
    }
    
    func didCancelActivity() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newActivity = Activity()
        
        if (segue.identifier == "appleMapSegue") {
            
            let navigationController = segue.destination as! UINavigationController
            let addActivityVC = navigationController.topViewController as! AddActivityViewController
            
            addActivityVC.newActivity = newActivity
            addActivityVC.delegate = self
            
        }
        
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations[0].coordinate.latitude)
//        print(locations[0].coordinate.longitude)
//
//    }
//    
//    
//    func determineCurrentLocation() {
//        let locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
//        
//    }

    
    


}

