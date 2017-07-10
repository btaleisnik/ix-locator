//
//  Activity.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/4/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import Foundation
import Gloss

class Activity: Decodable {

    
    var name: String?
    var description: String?
    var latitude: Double?
    var longitude: Double?
    var image: UIImage?
    var imageURL: String?
    
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
    
    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as? String
        self.description = dictionary["description"] as? String
        self.latitude = dictionary["latitude"] as? Double
        self.longitude = dictionary["longitude"] as? Double
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "description" ~~> self.description,
            "latitude" ~~> self.latitude,
            "longitude" ~~> self.longitude
        ])
    }
    
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
    }
}
