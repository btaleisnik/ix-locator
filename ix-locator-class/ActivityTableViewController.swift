//
//  ActivityTableViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit
import Alamofire

class ActivityTableViewController: UITableViewController, AddActivityDelegate {
    
    var activities: [Activity] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tableView.reloadData()
        
        //var newActivity: Activity?
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Alamofire.request("https://ix-locator-1499093950654.firebaseio.com/activities.json").responseJSON(completionHandler: {
            response in
            //print(response.result.value)
            
            if let activityDictionary = response.result.value as? [String: AnyObject] {
                
                self.activities = []
                
                for (key, value) in activityDictionary {
                    print("Key: \(key)")
                    print("Value: \(value)")
                    
                    if let singleActivityDictionary = value as? [String: AnyObject] {
                        let newActivity = Activity(dictionary: singleActivityDictionary)
                        self.activities.append(newActivity)
                        self.tableView.reloadData()
                    }
                }
                
                
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell

//        cell.textLabel?.text = activities[indexPath.row].name
//        cell.detailTextLabel?.text = activities[indexPath.row].description
        
        cell.name.text = activities[indexPath.row].name
        cell.desc.text = activities[indexPath.row].description
        
        var location = ""
        if let lat = activities[indexPath.row].latitude {
            location.append(String(lat))
        }
        
        if let long = activities[indexPath.row].longitude {
            location.append(", \(String(long))")
        }
        cell.latAndLong.text = location
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newActivity = Activity()
        
        if (segue.identifier == "navToAddActivity") {
                        
            let navigationViewController = segue.destination as! UINavigationController
            let addActivityViewController = navigationViewController.topViewController as! AddActivityViewController!
            
            addActivityViewController?.delegate = self
            addActivityViewController?.newActivity = newActivity
            
        }
        
    }
    
    func didSaveActivity(activity: Activity) {
        activities.append(Activity(name: activity.name, description: activity.description))
        
        self.tableView.reloadData()
    }
    
    func didCancelActivity() {
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
