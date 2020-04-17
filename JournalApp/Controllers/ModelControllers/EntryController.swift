//
//  EntryController.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/15/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation

class EntryController {
    
    
    // MARK: - Singleton
    
    static let sharedInstance = EntryController()
    
    
    
    // MARK: - Source of Truth
    
    var entries: [Entry] = []
    
    
    
    // MARK: - CRUD Methods
    
    
    // Create
    func createEntryWith(newTitle: String, newDate: String, newBodyText: String, journalToUpdate: Journal) {
        let newEntry = Entry(title: newTitle, date: newDate, bodyText: newBodyText)
        entries.append(newEntry)
        JournalController.sharedInstance.updateJournalWith(newEntry: newEntry, to: journalToUpdate)
    }
    
    
    // Read
    
    // Update
    func updateEntryWith(title: String, date: String, bodyText: String, entry: Entry) {
        entry.title = title
        entry.date = date
        entry.bodyText = bodyText
    }
    
    // Delete
    func deleteEntryWith(entryToRemove: Entry) {
        guard let indexToDelete = entries.firstIndex(of: entryToRemove) else { return }
        entries.remove(at: indexToDelete)
        JournalController.sharedInstance.saveToPersistentStore()
    }
    
    
    
    
    
    
    
    
//    // MARK: - Persistence
//
//
//    // Get the url where we are saving our data
//    func createFileForPersistentStore() -> URL {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let fileURL = url[0].appendingPathComponent("JournalApp.json") // <- Change string to app name
//        return fileURL
//    }
//
//
//    // Save the data at the url
//    func saveToPersistentStore() {
//        let jsonEncoder = JSONEncoder()
//
//        do {
//            let jsonEntries = try jsonEncoder.encode(entries)
//            try jsonEntries.write(to: createFileForPersistentStore())
//        } catch let encodingError {
//            print("There was an error encoding the data. \(encodingError.localizedDescription)")
//        }
//    }
//
//    // Fetch the data from the url
//    func loadFromPersistentStore() {
//        let jsonDecoder = JSONDecoder()
//
//        do {
//            let decodedData = try Data(contentsOf: createFileForPersistentStore())
//            entries = try jsonDecoder.decode([Entry].self, from: decodedData)
//        } catch let decodingError {
//            print("There was an error decoding the data. \(decodingError.localizedDescription)")
//        }
//    }
        
    
} //End of class
