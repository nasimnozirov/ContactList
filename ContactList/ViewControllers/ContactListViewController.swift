//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Nasim Nozirov on 06.05.2022.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var contact = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contact.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let person = contact[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        content.image = UIImage(named: person.image)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personVC = segue.destination as? PersonViewController else { return }
        //        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        personVC.person = sender as? Person
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = contact[indexPath.row]
        performSegue(withIdentifier: "contact", sender: person)
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //        let contacts = contact.remove(at: sourceIndexPath.row)
        //        contact.insert(contacts, at: destinationIndexPath.row)
    }
}
