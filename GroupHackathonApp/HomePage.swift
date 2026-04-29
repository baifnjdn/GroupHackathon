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
    
    private func uniqueColor(id: UUID) -> Color {
        let data = id.uuid
        let bytes = [data.0, data.1, data.2, data.3,
                     data.4, data.5, data.6, data.7,
                     data.8, data.9, data.10, data.11,
                     data.12, data.13, data.14, data.15]
        
        let hue = Double(bytes[0]) / 255.0
        let saturation = 0.6 + Double(bytes[1]) / 255.0 * 0.4
        let brightness = 0.7 + Double(bytes[2]) / 255.0 * 0.3
        
        return Color(hue: hue, saturation: saturation, brightness: brightness).opacity(0.3)
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
                                    .background(uniqueColor(id: chore.person.id))
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
