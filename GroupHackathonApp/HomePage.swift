//
//  HomePage.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI

struct HomePage: View {
    
    @State var choreManager = ChoreManager()
    var body: some View {
        
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
                        Text(chore.deadline, format: .dateTime.hour().minute())
                    }
                    .padding(.vertical, 5)
                }
            }
            
            Spacer()
            
            
            
            
            Button {
                choreManager.addChore(name: "Clean dishes", personName: "Jason", deadline: Date.now)
                
            } label: {
                Image(systemName: "plus.circle")
                    .font(.title2)
            }

                        
        }
        .padding()
        .onAppear {
            // testing purposes
            choreManager.addChore(name: "Clean dishes", personName: "Jason", deadline: Date.now)
        }
    }

}

#Preview {
    HomePage()
}
