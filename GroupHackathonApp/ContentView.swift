//
//  ContentView.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-24.
//

import SwiftUI

struct LoadingView: View {
    @State var choreManager: ChoreManager?
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            if let existChoreManager = choreManager {
                ContentView(choreManager: existChoreManager)
            }
        }
        .onAppear {
            choreManager = ChoreManager(context: context)
            choreManager?.loadChores()
        }
    }
}

struct ContentView: View {
    
    @State var choreManager: ChoreManager
    init(choreManager: ChoreManager) {
        // Allows @State to have an inital value that depends on parameters
        
        self._choreManager = State(
            initialValue: choreManager)
    }
    
    var body: some View {
        
        VStack {
            
            HomePage(choreManager: choreManager)
            
            
        }
    }

}

#Preview {
    LoadingView()
}
