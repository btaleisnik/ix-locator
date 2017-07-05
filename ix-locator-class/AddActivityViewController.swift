//
//  AddActivityViewController.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var activityTableViewController: ActivityTableViewController?
    
    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        newActivity?.name = nameTextField.text
        newActivity?.description = descriptionTextView.text
        
        delegate?.didSaveActivity(activity: newActivity!)

        self.dismiss(animated: true, completion: nil)

    }


}
