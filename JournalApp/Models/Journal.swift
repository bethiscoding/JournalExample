//
//  Journal.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/16/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation

class Journal: Codable {
    
    
    var journalName: String
    var entries: [Entry]
    
    
    init(journalName: String, entries: [Entry] = []) {
        self.journalName = journalName
        self.entries = entries
    }
 
    
} //End of class



extension Journal: Equatable {
    
    static func ==(lhs: Journal, rhs: Journal) -> Bool {
        return (lhs.journalName == rhs.journalName) && (lhs.entries == rhs.entries)
    }
}
