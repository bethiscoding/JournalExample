//
//  JournalController.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/16/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation

class JournalController {
    
    
    // MARK: - Singleton
    
    static let sharedInstance = JournalController()
    
    
    
    // MARK: - Source of Truth
    
    var journals: [Journal] = []
    
    
    
    // MARK: - CRUD Methods
    
    
    //Create
    func createJournalWith(newJournalName: String) {
        let newJournal = Journal(journalName: newJournalName)
        journals.append(newJournal)
        saveToPersistentStore()
    }
    
    
    // Read - typically used for pulling from API or DataBase
    
    
    // Update
    func updateJournalWith(newEntry: Entry, to journalToUpdate: Journal) {
        journalToUpdate.entries.append(newEntry)
        saveToPersistentStore()
    }
    
    // Delete
    func deleteJournalWith(journalToDelete: Journal) {
        guard let indexToDelete = journals.firstIndex(of: journalToDelete) else { return }
        journals.remove(at: indexToDelete)
        saveToPersistentStore()
    }
    
    func remove(entryToRemove: Entry, from journalToUpdate: Journal) {
        guard let indexToDelete = journalToUpdate.entries.firstIndex(of: entryToRemove) else { return }
        journalToUpdate.entries.remove(at: indexToDelete)
        saveToPersistentStore()
    }
    
    
    
    // MARK: - Persistence
    
    
    // Get the url where we are saving our data
    func createFileURL() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("JournalApp.json") // <- Change string to app name
        return fileURL
    }
    
    
    // Save the data at the url
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonJournals = try jsonEncoder.encode(journals)
            try jsonJournals.write(to: createFileURL())
        } catch let encodingError {
            print("There was an error encoding the data. \(encodingError.localizedDescription)")
        }
    }
    
    // Fetch the data from the url
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedData = try Data(contentsOf: createFileURL())
            journals = try jsonDecoder.decode([Journal].self, from: decodedData)
        } catch let decodingError {
            print("There was an error decoding the data. \(decodingError.localizedDescription)")
        }
    }
    
    
} //End of class
