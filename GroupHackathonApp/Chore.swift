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
    var deadline: Date
    
    
    init(name: String, person: Person, deadline: Date) {
        self.name = name
        self.person = person
        self.deadline = deadline
    }
}
