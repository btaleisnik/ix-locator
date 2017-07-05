//
//  AddActivityViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import CoreLocation

class AddActivityViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let locationManager: CLLocationManager = CLLocationManager()
    var latestLocation: CLLocation?

    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        if let location = self.latestLocation {
            
            newActivity?.name = nameTextField.text
            newActivity?.description = descriptionTextView.text
            newActivity?.latitude = location.coordinate.latitude
            newActivity?.longitude = location.coordinate.longitude
        } else {
            newActivity = Activity(name: nameTextField.text, description: descriptionTextView.text)
        }
        
        
        
        delegate?.didSaveActivity(activity: newActivity!)

        self.dismiss(animated: true, completion: nil)

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.latestLocation = locations[0]
    }


}
