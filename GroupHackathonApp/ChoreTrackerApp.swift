//
//  ChoreTrackerApp.swift
//  ChoreTrackerApp
//
//  Created by Jason on 2026-04-24.
//

import SwiftUI
import SwiftData


@main
struct ChoreTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
        .modelContainer(for: Chore.self)
    }
}
