//
//  Entry.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/15/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation

class Entry: Codable {
    
    
    var title: String
    var date: String
    var bodyText: String
    
    
    init(title: String, date: String, bodyText: String) {
        self.title = title
        self.date = date
        self.bodyText = bodyText
    }
    
    
} //End of class



extension Entry: Equatable {
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return (lhs.title == rhs.title) && (lhs.date == rhs.date) && (lhs.bodyText == rhs.bodyText)
    }
}
