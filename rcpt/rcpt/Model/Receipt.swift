//
//  Receipt.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 26/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import Foundation
import RealmSwift

class Receipt: Object {
    
    dynamic var number = 0
    dynamic var from = ""
    dynamic var to = ""
    dynamic var when = NSDate()
    dynamic var type = ""
    dynamic var amount: Double = 0.0
    dynamic var desc = ""
    dynamic var picture = ""
    dynamic var signature = ""
    dynamic var location = ""
    
    // Specify properties to ignore (Realm won't persist these)
    
    override static func ignoredProperties() -> [String] {
        return []
    }
}