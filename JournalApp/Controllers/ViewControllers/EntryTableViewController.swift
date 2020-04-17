//
//  EntryListTableViewController.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/15/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    
    // MARK: - Properties
    
    var ETVCJournal: Journal?
    
    
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        JournalController.sharedInstance.loadFromPersistentStore()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    
    // MARK: - Actions
    
//    @IBAction func addButtonTapped(_ sender: Any) {
//
//        guard let journal = entryTVCJournal,
//              let entryTitle = titleTextField.text,
//              let entryDate = dateTextField.text,
//              let entryBodyText = bodyTextTextField.text else { return }
//
//        EntryController.sharedInstance.createEntryWith(newTitle: entryTitle, newDate: entryDate, newBodyText: entryBodyText, journalToUpdate: journal)
//
//        titleTextField.text = ""
//        dateTextField.text = ""
//        bodyTextTextField.text = ""
//        tableView.reloadData()
//    }
    
    
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)

        guard let ETVCJournal = ETVCJournal else { return UITableViewCell() }

        let entryCell = ETVCJournal.entries[indexPath.row]
        cell.textLabel?.text = entryCell.title
        cell.detailTextLabel?.text = entryCell.date
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let entryToDelete = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.deleteEntryWith(entryToRemove: entryToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? EntryViewController else { return }
        destinationVC.EVCJournal = ETVCJournal
        // IIDOO
        if segue.identifier == "ToEntryVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let entryToSend = EntryController.sharedInstance.entries[indexPath.row]
            destinationVC.EVCEntry = entryToSend
        }
    }

} //End of class
