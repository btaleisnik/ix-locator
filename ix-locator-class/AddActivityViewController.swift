//
//  AddActivityViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import CoreLocation
//import FirebaseDatabase
import Alamofire

class AddActivityViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let locationManager: CLLocationManager = CLLocationManager()
    var latestLocation: CLLocation?

    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    // var ref: DatabaseReference! = Database.database().reference()
    
    
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
        
        
        
//        self.ref.child("users").setValue(["username": "Test1"])
//        
//        var testRef = ref.child("users")
//        
//        var refHandle = testRef.observe(DataEventType.value, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//            print(postDict)
//        })

        
//        Alamofire.request("https://ix-locator-1499093950654.firebaseio.com/UserTest").responseJSON {
//            response in
//            print(response.request!)
//            print(response.response!)
//            print(response.data!)
//            print(response.result)
//        }
        
        
        Alamofire.request("https://ix-locator-1499093950654.firebaseio.com/activities.json", method: .post, parameters: newActivity?.toJSON(), encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
            
            switch response.result {
            case .success:
                // Checks that all data fields are filled in for Activity
                if (self.isActivityDataComplete(newActivity: self.newActivity)) {
                    self.delegate?.didSaveActivity(activity: self.newActivity!)
                    self.dismiss(animated: true, completion: nil)
                }
                break
            case .failure:
                break
            }
        })
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.latestLocation = locations[0]
    }
    
    
    //Verifies all Activity variables have datas
    func isActivityDataComplete(newActivity: Activity?)-> Bool {
        if (newActivity?.name != "" && newActivity?.description != "" && newActivity?.latitude != nil && newActivity?.longitude != nil) {
            
            return true
        } else {
            return false
        }
    }


}
