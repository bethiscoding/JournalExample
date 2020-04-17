//
//  AddEntryViewController.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/16/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var dateTextView: UITextView!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
    // MARK: - Properties
       
    var EVCJournal: Journal?
    var EVCEntry: Entry?
       
    
       
       // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextView.text = "Title"
        dateTextView.text = "Date"
        bodyTextView.text = "Journal entry here..."
    }
    
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let entryTitle = titleTextView.text,
              let entryDate = dateTextView.text,
              let entryBodyText = bodyTextView.text,
              let AEVCJournal = EVCJournal
              else { return }
        
        if let entry = EVCEntry {
            EntryController.sharedInstance.updateEntryWith(title: entryTitle, date: entryDate, bodyText: entryBodyText, entry: entry)
        } else {
            EntryController.sharedInstance.createEntryWith(newTitle: entryTitle, newDate: entryDate, newBodyText: entryBodyText, journalToUpdate: AEVCJournal)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextView.text = "Title"
        dateTextView.text = "Date"
        bodyTextView.text = "Journal entry here..."
    }
    
    
} //End of class
