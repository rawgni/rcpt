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
    
    dynamic var name = ""
    dynamic var createdAt = NSDate()
    dynamic var notes = ""
    dynamic var isCompleted = false
    
    // Specify properties to ignore (Realm won't persist these)
    
    override static func ignoredProperties() -> [String] {
        return []
    }
}
/*
 struct Receipt {
    var name: String?
    var notes: String?
    
    init(name: String?, notes: String?) {
        self.name = name
        self.notes = notes
    }
}
*/