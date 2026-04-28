//
//  Person.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI
import SwiftData


@Model
class Person {
    
    var id = UUID()
    var name: String
    var chores: [Chore] = []
    
    init(name: String) {
        self.name = name
    }
    
}
