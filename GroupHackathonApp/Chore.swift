//
//  Chore.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI

@Observable
class Chore: Identifiable {
    
    var id = UUID()
    var isCompleted: Bool = false
    var name: String
    var person: Person
    var dueDate: Date
    
    
    init(name: String, person: Person, dueDate: Date) {
        self.name = name
        self.person = person
        self.dueDate = dueDate
    }
}
