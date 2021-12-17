//
//  EntryReducerTests.swift
//  JournalAppTests
//
//  Created by Sarah Lichter on 12/16/21.
//

import XCTest
@testable import JournalApp

class EntryReducerTests: XCTestCase {

    func testCreateEntryAddsEntryToEntriesInState() {
        var state = AppState()
        let initialPrompt = state.displayPrompt
        
        let entryText = "Entry Text"
        let date = Date()
        
        XCTAssertEqual(state.entries.count, 0)
        entryReducer(value: &state, action: AppAction.entry(.createEntry(entryText, date, initialPrompt.id)))
        
        XCTAssertEqual(state.entries.count, 1)
        let newEntry = state.entries.first
        
        XCTAssertEqual(newEntry?.text, entryText)
        XCTAssertEqual(newEntry?.date, date)
        XCTAssertEqual(newEntry?.promptId, initialPrompt.id)
    }

}
