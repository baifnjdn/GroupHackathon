//
//  EditChorePage.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-29.
//


import SwiftUI


struct EditChorePage: View {
    @Environment(\.dismiss) var dismiss
    @State var choreName: String = ""
    @State var personName: String = ""
    @State var dueDate: Date = Date.now
    @State private var choreAdded: Bool = false
    var addChore: (String, String, Date) -> Void
    var deleteChore: () -> Void
    
    init(choreName: String, personName: String, addChore: @escaping (String, String, Date) -> Void, deleteChore: @escaping () -> Void) {
        // Allows @State to have an inital value that depends on parameters
        
        self._choreName = State(
            initialValue: choreName)
        
        self._personName = State(
            initialValue: personName)
        
        self.addChore = addChore
        
        self.deleteChore = deleteChore
    }
    
    var body: some View {
        
        ZStack {
            
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                
                Text("Edit Chore")
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
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .bold()
                    .font(.title3)
                    .foregroundColor(Color("FontColor"))
                    
                }
                .padding()
                
                Spacer()
                
                Button {
                    deleteChore()
                    addChore(choreName, personName, dueDate)
                    choreAdded = true
                    dismiss()
                    
                } label: {
                    Text("Edit Chore")
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
