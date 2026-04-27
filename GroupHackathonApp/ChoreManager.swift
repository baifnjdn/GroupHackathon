//
//  ChoreManager.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI

class ChoreManager {
    var chores: [Chore] = []
    var people: [String: Person] = [:]
    
    
    func addChore(name: String, personName: String, deadline: Date) {
        
        var person: Person
        
        if let alreadyExist = people[personName] {
            person = alreadyExist
        } else {
            person = Person(name: name)
            people[name] = person
        }
        
        let chore = Chore(
            name: name,
            person: person,
            deadline: deadline
        )
        
        chores.append(chore)
        person.chores.append(chore)
    }
    
    func completeChore(choreNumber: Int) {
        if choreNumber >= chores.count {
            print("Invalid Index")
            return
        }
        
        chores[choreNumber].isCompleted = true
    }
    
}
