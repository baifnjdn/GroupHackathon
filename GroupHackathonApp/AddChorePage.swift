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
        
        VStack {
            
            Text("Add Chore")
                .font(.title)
                .bold()
                .padding()
            
            VStack(alignment: .leading) {
                Text("Person Responsible:")
                    .bold()
                    .font(.title3)
                TextField("Enter name...", text: $personName)
                
                Text("Chore Description:")
                    .bold()
                    .font(.title3)
                TextField("Enter chore description...", text: $choreName)
                
                DatePicker (
                    "Due Date:",
                    selection: $dueDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .bold()
                .font(.title3)
                
            }
            .padding()
            
            Spacer()
            
            Button {
                addChore(choreName, personName, dueDate)
                choreAdded = true
                dismiss()
                
            } label: {
                Text("Add Chore")
            }
            .disabled(choreName.isEmpty || personName.isEmpty)
        }

    }
}

#Preview {
    AddChorePage(addChore: {a, b, c in})
}
