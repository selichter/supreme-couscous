//
//  HomeFeedReducerTests.swift
//  JournalAppTests
//
//  Created by Sarah Lichter on 12/16/21.
//

import XCTest
@testable import JournalApp

class HomeFeedReducerTests: XCTestCase {

    func testRefreshPromptSwitchesDisplayPromptButDoesNotAddItToUsedList() {
        var state = AppState()
        let initialPrompt = state.displayPrompt
        
        
        homeFeedReducer(value: &state, action: AppAction.homeFeed(.refreshPrompt))

        XCTAssertNotEqual(state.displayPrompt.id, initialPrompt.id)
        XCTAssertFalse(state.usedPrompts.contains(where: {$0.id == initialPrompt.id}))
        XCTAssert(state.promptBacklog.contains(where: {$0.id == initialPrompt.id}))
    }

}
