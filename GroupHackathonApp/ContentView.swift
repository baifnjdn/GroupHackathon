//
//  ContentView.swift
//  GroupHackathonApp
//
//  Created by Jason on 2026-04-24.
//

import SwiftUI

struct ContentView: View {
    
    @State var choreManager = ChoreManager()
    var body: some View {
        
        VStack {
            
            HomePage()
            
        }
    }

}

#Preview {
    ContentView()
}
