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
import Alamofire

class MapViewController: UIViewController, AddActivityDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let annotation = MKPointAnnotation()
    var activities: [Activity] = []
    
    override func viewWillAppear(_ animated: Bool) {
        setMapType()
        setupPins()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupPins()
        

    }
    
    
    func setupPins() {
        Alamofire.request("https://ix-locator-1499093950654.firebaseio.com/activities.json").responseJSON(completionHandler: {
            response in
            
            //print(response.result.value)
            
            if let activityDictionary = response.result.value as? [String: AnyObject] {
                
                self.activities = []
                
                for (key, value) in activityDictionary {
                    print("Key: \(key)")
                    print("Value: \(value)")
                    
                    if let singleActivityDictionary = value as? [String: AnyObject] {
                        //Create new Activity
                        let newActivity = Activity(dictionary: singleActivityDictionary)
                        
                        if (newActivity.latitude != nil && newActivity.longitude != nil) {
                            //Add pin for new Activity
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = CLLocationCoordinate2DMake(newActivity.latitude!, newActivity.longitude!);
                            annotation.title = newActivity.name
                            self.map.addAnnotation(annotation)
                        }
                        
                        //Add to activities[] dictionary
                        self.activities.append(newActivity)
                    }
                    
                }
                
                
            }
        })

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
        annotation.title = activity.name
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

