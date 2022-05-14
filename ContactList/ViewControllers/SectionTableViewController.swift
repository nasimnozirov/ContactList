//
//  SecsionTableViewController.swift
//  ContactList
//
//  Created by Nasim Nozirov on 09.05.2022.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    var persons = Person.getPerson()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return persons.count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "section", for: indexPath)
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = person.phone
            content.image = UIImage(systemName: Contacts.phone.rawValue)
        default:
            content.text = person.email
            content.image = UIImage(systemName: Contacts.email.rawValue)
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}
