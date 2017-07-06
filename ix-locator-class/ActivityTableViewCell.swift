//
//  ActivityTableViewCell.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/6/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var latAndLong: UILabel!
    @IBOutlet weak var desc: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
