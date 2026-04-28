//
//  HomePage.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI

struct HomePage: View {
    
    
    @State var choreManager: ChoreManager
    
    private func dateFormatStyle(date: Date) -> Date.FormatStyle {
        
        // Display date depending on if the day / month / year are the same as the current time
        // E.g. don't need to display due day if it's today
        
        if Calendar.current.component(.year, from: Date.now) != Calendar.current.component(.year, from: date) {
            return .dateTime.year().month().day()
        }
        if Calendar.current.component(.month, from: Date.now) != Calendar.current.component(.month, from: date) {
            return .dateTime.month().day().hour()
        }
        if Calendar.current.component(.day, from: Date.now) != Calendar.current.component(.day, from: date) {
            return .dateTime.day().hour().minute()
        }
        return .dateTime.hour().minute()
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text(Date.now, format: .dateTime.day().month().hour().minute())
                    .bold()
                    .font(.title)
                    .padding()
                
                
                Grid {
                    GridRow {
                        Text("Chore")
                        Text("In-charge")
                        Text("Due")
                    }
                    Divider()
                    
                    ForEach(choreManager.chores) {
                        chore in
                        GridRow {
                            Text(chore.name)
                            Text(chore.person.name)
                            
                            Text(chore.dueDate, format: dateFormatStyle(date: chore.dueDate))

                            
                        }
                        .padding(.vertical, 5)
                    }
                }
                
                Spacer()
                
                
                
                NavigationLink {
                    AddChorePage(addChore: choreManager.addChore)
                } label: {
                    Text("Add Chore")
                    Image(systemName: "plus.circle")
                        .font(.title2)
                }
                
                
            }
            .padding()
        }
        .onAppear() {
            // testing purposes
            choreManager.addChore(choreName: "Do dishes", personName: "Jason", dueDate: Date(timeIntervalSinceNow: 0))
            choreManager.addChore(choreName: "Clean floor", personName: "Jason", dueDate: Date(timeIntervalSinceNow: 3600*24*3))
            choreManager.addChore(choreName: "Something", personName: "Jason", dueDate: Date(timeIntervalSinceNow: 3600))
            choreManager.addChore(choreName: "Something else", personName: "Jason", dueDate: Date(timeIntervalSinceNow: 3600*24))
        }
    }
}
