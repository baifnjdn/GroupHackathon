//
//  AddChorePage.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-27.
//

import SwiftUI


struct AddChorePage: View {
    @Environment(\.dismiss) var dismiss
    @State var choreName: String = ""
    @State var personName: String = ""
    @State var dueDate: Date = Date.now
    @State private var choreAdded: Bool = false
    var addChore: (String, String, Date) -> Void
    
    
    var body: some View {
        
        ZStack {
            
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                
                Text("Add Chore")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("FontColor"))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Person Responsible:")
                        .bold()
                        .font(.title3)
                        .foregroundColor(Color("FontColor"))
                    
                    
                    TextField("Enter name...", text: $personName)
                        .padding()
                        .cornerRadius(12)
                    
                    Text("Chore Description:")
                        .bold()
                        .font(.title3)
                        .foregroundColor(Color("FontColor"))
                    
                    TextField("Enter chore description...", text: $choreName)
                        .padding()
                        .cornerRadius(12)
                    
                    DatePicker (
                        "Due Date:",
                        selection: $dueDate,
                        in: Date()...,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .bold()
                    .font(.title3)
                    .foregroundColor(Color("FontColor"))
                    
                }
                .padding()
                
                Spacer()
                
                Button {
                    addChore(choreName, personName, dueDate)
                    choreAdded = true
                    dismiss()
                    
                } label: {
                    Text("Add Chore")
                        .bold()
                        .foregroundColor(Color("AppBackground"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("FontColor"))
                        .cornerRadius(15)
                        .padding()
                }
                .disabled(choreName.isEmpty || personName.isEmpty)
            }
        }

    }
}

#Preview {
    AddChorePage(addChore: {a, b, c in})
}
