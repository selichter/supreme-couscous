//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI

@main
struct JournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(store: Store(value: AppState(), reducer: appReducer))
        }
    }
}
