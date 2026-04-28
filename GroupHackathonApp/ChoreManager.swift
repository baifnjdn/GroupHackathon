//
//  ChoreManager.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI

@Observable
class ChoreManager {
    var chores: [Chore] = []
    var people: [String: Person] = [:]
    
    
    func addChore(choreName: String, personName: String, dueDate: Date) {
        
        var person: Person
        
        if let alreadyExist = people[personName] {
            person = alreadyExist
        } else {
            person = Person(name: personName)
            people[personName] = person
        }
        
        let chore = Chore(
            name: choreName,
            person: person,
            dueDate: dueDate
        )
        
        chores.append(chore)
        person.chores.append(chore)
        chores.sort(by: { $0.dueDate < $1.dueDate })
    }
    
    func completeChore(choreNumber: Int) {
        if choreNumber >= chores.count {
            print("Invalid Index")
            return
        }
        
        chores[choreNumber].isCompleted = true
    }
    
}
