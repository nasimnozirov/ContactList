//
//  Models.swift
//  ContactList
//
//  Created by Nasim Nozirov on 06.05.2022.
//

import Foundation

struct Person {
    let name: String
    let surName: String
    let phone: String
    let email: String
    let image: String
    
    var fullName: String {
        "\(name) \(surName)"
    }
    
    static func getPerson() -> [Person] {
        var infoPerson:[Person] = []

        let names = DataService.shared.names.shuffled()
        let surNames = DataService.shared.names.shuffled()
        let phones = DataService.shared.numberPhones.shuffled()
        let emails = DataService.shared.emails.shuffled()
        let images = DataService.shared.images.shuffled()
        
        let iterationCount = min(
            names.count,
            surNames.count,
            phones.count,
            emails.count,
            images.count
           )
        
        for index in 0..<iterationCount {
            let person = Person(
                name: names[index],
                surName: surNames[index],
                phone: phones[index],
                email: emails[index],
                image: images[index]
            )
            infoPerson.append(person)
        }
        return infoPerson
    }
}

enum Contacts: String {
    case phone = "phone"
    case email = "tray"
}
