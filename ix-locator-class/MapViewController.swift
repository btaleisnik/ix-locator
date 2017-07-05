//
//  MapViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, AddActivityDelegate {
    
    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSaveActivity(activity: Activity) {
        print("Name: " + activity.name!)
        print("Description: " + activity.description!)
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


}

