//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI
import ComposableArchitecture
import AppStateCore

@main
struct JournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(
                initialState: AppState(),
                reducer: appReducer,
                environment: AppEnvironment()
              )
            )
        }
    }
}
