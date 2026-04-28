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
    
    private func personColor(for name: String) -> Color {
        let colors: [Color] = [
            .pink.opacity(0.65),
            .blue.opacity(0.65),
            .purple.opacity(0.65),
            .orange.opacity(0.65),
            .green.opacity(0.65),
            .yellow.opacity(0.75)
        ]
        
        let index = abs(name.hashValue) % colors.count
        return colors [index]
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text("FairShare")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.font)
                    .padding()
                
                Divider()
                
                Text(Date.now, format: .dateTime.day().month().hour().minute())
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.font)
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
                        if !chore.isCompleted {
                            
                            GridRow {
                                
                                Text(chore.name)
                                    .frame(maxWidth: .infinity)
                                Text(chore.person.name)
                                    .bold()
                                    .padding(8)
                                    .background(personColor(for: chore.person.name))
                                    .cornerRadius(10)
                                
                                Text(chore.dueDate, format: dateFormatStyle(date: chore.dueDate))
                                
                                
                                MenuComponent(delete: {choreManager.deleteChore(id: chore.id)}, edit: {})
                                    .padding(.horizontal, 8)
                            }
                            .padding(.vertical, 5)
                            .onTapGesture(count: 2) {
                                withAnimation {
                                    choreManager.completeChore(id: chore.id)
                                }
                            }
                        }
                    
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
                .foregroundStyle(.font)
                
                
                
            }
            .background(.appBackground)
        }
        .onAppear() {
            // testing purposes
            choreManager.addChore(choreName: "Do dishes", personName: "Jason", dueDate: Date(timeIntervalSinceNow: 0))
            choreManager.addChore(choreName: "Clean floor", personName: "Adeline", dueDate: Date(timeIntervalSinceNow: 3600*24*3))
            choreManager.addChore(choreName: "Something", personName: "Precious", dueDate: Date(timeIntervalSinceNow: 3600))
            choreManager.addChore(choreName: "Something else", personName: "Harjap", dueDate: Date(timeIntervalSinceNow: 3600*24))
        }
        
        
    }
}
