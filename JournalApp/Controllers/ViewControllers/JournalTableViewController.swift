//
//  JournalTableViewController.swift
//  JournalApp
//
//  Created by Bethany Morris on 4/16/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var journalNameTextField: UITextField!
    
    
    
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
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        guard let journalName = journalNameTextField.text, !journalName.isEmpty else { return }
        
        JournalController.sharedInstance.createJournalWith(newJournalName: journalName)
        journalNameTextField.text = ""
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return JournalController.sharedInstance.journals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath)

        let journalForCell = JournalController.sharedInstance.journals[indexPath.row]
        cell.textLabel?.text = journalForCell.journalName

        if journalForCell.entries.count == 1 {
            cell.detailTextLabel?.text = "1 entry"
        } else {
            cell.detailTextLabel?.text = "\(journalForCell.entries.count) entries"
        }
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "ToEntryTVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? EntryTableViewController else { return }
            let journalToSend = JournalController.sharedInstance.journals[indexPath.row]
            destinationVC.ETVCJournal = journalToSend
        }
    }
    

}
