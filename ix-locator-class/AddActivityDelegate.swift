//
//  AddActivityDelegate.swift
//  ix-locator-class
//
//  Created by Brandon Taleisnik on 7/5/17.
//  Copyright © 2017 Brandon Taleisnik. All rights reserved.
//

import Foundation

protocol AddActivityDelegate {
    func didSaveActivity(activity: Activity)
    func didCancelActivity()
}
