//
//  SettingsTableViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/5/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editNameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField?.placeholder = " "
        nameTextField?.isEnabled = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editName(_ sender: Any) {
        
        if (editNameButton.currentTitle == "Edit") {
            
            print ("Currently editing")
            
            // Change button to save title
            editNameButton.setTitle("Save", for: .normal)
            
            
            nameLabel.text = ""
            
            // Enable editing of textfield and format
            nameTextField?.isHidden = false
            nameTextField?.isEnabled = true
            nameTextField?.becomeFirstResponder()
            nameTextField?.layer.borderWidth = 0.5
            let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
            nameTextField?.layer.borderColor = borderColor.cgColor
            nameTextField?.layer.cornerRadius = 5.0
        } else {
            print ("Saved new name: " + (nameTextField?.text!)!)
            
            nameTextField?.isHidden = true
            nameLabel.text = nameTextField?.text
            editNameButton.setTitle("Edit", for: .normal)
        }
        
    }
    
    @IBAction func closePinWindow(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        
        let mapType = UserDefaults.standard.string(forKey: "mapType")

        if indexPath.section == 2 && mapType == nil {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 0 && mapType == "hybrid" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 1 && mapType == "hybridFlyover" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 2 && mapType == "satellite" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 3 && mapType == "satelliteFlyover" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 4 && mapType == "standard" {
            cell.accessoryType = .checkmark
        }

        
    }
    
    
    // Choose actions for when user selects each cell; save settings in UserDefaults for map
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Some navigation Items
        if indexPath.section == 1 && indexPath.row == 0 {
            self.tabBarController?.selectedIndex = 2
        }
        
        if indexPath.section == 1 && indexPath.row == 1 {
            self.tabBarController?.selectedIndex = 1
        }
        
        // Settings
        if indexPath.section == 2 {
            
            // First de-select all
            tableView.cellForRow(at: IndexPath(row: 0, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 1, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 2, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 3, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 4, section: 2))?.accessoryType = .none
            
            // Determine which cell was chosen
            if let cell = tableView.cellForRow(at: indexPath) {
                if indexPath.row == 0 {
                    UserDefaults.standard.set("hybrid", forKey: "mapType")
                }
                
                if indexPath.row == 1 {
                    UserDefaults.standard.set("hybridFlyover", forKey: "mapType")
                }
                
                if indexPath.row == 2 {
                    UserDefaults.standard.set("satellite", forKey: "mapType")
                }
                
                if indexPath.row == 3 {
                    UserDefaults.standard.set("satelliteFlyover", forKey: "mapType")
                }
                
                if indexPath.row == 4 {
                    UserDefaults.standard.set("standard", forKey: "mapType")
                }
                
                cell.accessoryType = .checkmark
            }
        }

        
    }
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
