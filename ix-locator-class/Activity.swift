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
    var latitude: Double?
    var longitude: Double?
    
    init(name: String?, description: String?) {
        self.name = name
        self.description = description
    }
    
    init() {
        self.name = ""
        self.description = ""
    }
    
    init(name: String?, description: String?, latitude: Double?, longitude: Double?) {
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
