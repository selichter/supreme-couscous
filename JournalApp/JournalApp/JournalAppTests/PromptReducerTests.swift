//
//  PromptReducerTests.swift
//  JournalAppTests
//
//  Created by Sarah Lichter on 12/16/21.
//

import XCTest
@testable import JournalApp

class PromptReducerTests: XCTestCase {

    func testAdvancePromptActionUpdatesDisplayPrompt() {
        var state = AppState()
        let initialPrompt = state.displayPrompt
        
        let effects = promptReducer(value: &state, action: AppAction.prompt(.advancePrompt))

        XCTAssertNotEqual(state.displayPrompt.id, initialPrompt.id)
        XCTAssert(state.usedPrompts.contains(where: {$0.id == initialPrompt.id}))
    }
    
    func testMarkAsUsedActionSetsTheDateAndCountForDisplayPrompt() {
        var state = AppState()
        XCTAssertNil(state.displayPrompt.lastUsed)
        XCTAssertEqual(state.displayPrompt.timesUsed, 0)
        XCTAssertEqual(state.displayPrompt.id, 20)
        
        let effects = promptReducer(value: &state, action: AppAction.prompt(.markAsUsed))
        
        XCTAssertNotNil(state.displayPrompt.lastUsed)
        XCTAssertEqual(state.displayPrompt.timesUsed, 1)
        XCTAssertEqual(state.displayPrompt.id, 20)
    }
    
    func testToggleFavoriteSetsFavoriteToTrueIfItIsInitiallyFalse() {
        var state = AppState()
        XCTAssertFalse(state.displayPrompt.isFavorite)
        XCTAssertEqual(state.displayPrompt.id, 20)
        
        let effects = promptReducer(value: &state, action: AppAction.prompt(.toggleFavorite))
        
        XCTAssert(state.displayPrompt.isFavorite)
        XCTAssertEqual(state.displayPrompt.id, 20)
    }
    
    func testToggleFavoriteSetsFavoriteToTrueIfItIsInitiallyTrue() {
        var state = AppState()
        state.displayPrompt.isFavorite = true
        XCTAssert(state.displayPrompt.isFavorite)
        XCTAssertEqual(state.displayPrompt.id, 20)
        
        let effects = promptReducer(value: &state, action: AppAction.prompt(.toggleFavorite))
        
        XCTAssertFalse(state.displayPrompt.isFavorite)
        XCTAssertEqual(state.displayPrompt.id, 20)
    }

}
