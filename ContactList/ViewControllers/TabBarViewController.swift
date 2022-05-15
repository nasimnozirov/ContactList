//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Nasim Nozirov on 09.05.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewControllers()
    }
    
    private func showViewControllers() {
        guard let contactListVC = viewControllers?.first as? ContactListViewController else { return }
        guard let sectionVC = viewControllers?.last as? SectionTableViewController else { return }
        
        let persons = Person.getPerson()
        contactListVC.persons = persons
        sectionVC.persons = persons
    }
}
