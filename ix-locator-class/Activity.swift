//
//  Activity.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import Foundation

class Activity {
    
    var name: String?
    var description: String?
    
    init(name: String?, description: String?) {
        self.name = name
        self.description = description
    }
    
    init() {
        self.name = ""
        self.description = ""
    }
    
    
}
