//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/20/21.
//

import XCTest
import ComposableArchitecture
import Models
@testable import EntriesCore
import AppStateCore

class EntriesCoreTests: XCTestCase {

    func testCreateEntryAddsEntryToEntriesInState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        let entryText = "Entry Text"
        let entryDate = Date()
        let entryId = UUID()
        
        let expectedEntry = Entry(text: entryText, date: entryDate, promptId: state.displayPrompt.id, id: entryId)
        
        
        store.send(.entry(.createEntry(entryText, entryDate, state.displayPrompt.id, entryId))) {
            $0.appEntries = [expectedEntry]
            
        }
    }

}
