//
//  ChoreManager.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI
import SwiftData

@Observable
class ChoreManager {
    var chores: [Chore] = []
    var people: [String: Person] = [:]
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
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
        saveChore(chore: chore)
    }
    
    func completeChore(choreNumber: Int) {
        if choreNumber >= chores.count {
            print("Invalid Index")
            return
        }
        
        chores[choreNumber].isCompleted = true
    }
    

    
    func saveChore(chore: Chore) {
        context.insert(chore)
        do {
            
            try context.save()
            
            print("Chore saved")
            
//            let chore = try context.fetch(FetchDescriptor<Chore>())
//            print("After save fetch:", chore.count)
        } catch {
            print("Failed to save folder.")
        }
        

    }
    
    func loadChores() {
        do {
            
            let descriptor = FetchDescriptor<Chore>()
            let savedChores = try context.fetch(descriptor)
            
            print("Successfully \(savedChores.count) chores")
            
            // automatically generates the people as well
            for chore in savedChores {
                addChore(choreName: chore.name, personName: chore.person.name, dueDate: chore.dueDate)
            }
            
        } catch {
            
            print("Failed to load folder.")
        }
        
        return
    }
}
