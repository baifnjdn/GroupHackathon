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
    var colorTag: Color {
        let data = id.uuid
        
        let hue = Double(data.0) / 255.0
        let saturation = 0.6 + Double(data.1) / 255.0 * 0.4
        let brightness = 0.7 + Double(data.2) / 255.0 * 0.3
        
        return Color(hue: hue, saturation: saturation, brightness: brightness).opacity(0.3)
    }
    
    init(name: String) {
        self.name = name
    }
    
}
