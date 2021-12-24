//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/20/21.
//

@testable import PromptsCore
import XCTest
import ComposableArchitecture
import Models
import AppStateCore

class PromptCoreTests: XCTestCase {
    let initialDisplayPrompt = Prompt(text: "A test Prompt", category: Category.health)
    let promptTwo = Prompt(text: "Second Prompt", category: Category.money)
    let promptThree = Prompt(text: "Third Prompt", category: Category.managingEmotions)

    func testPromptStateDefaultValues() {
        let appState = AppState()
        
        XCTAssertEqual(appState.displayPrompt.text,  "What are you looking to gain from building a journaling habit?")
        XCTAssertEqual(appState.promptBacklog.count, 12)
    }
    
    func testMarkAsUsedActionSetsTheDateAndCountForDisplayPrompt() {
        var state = AppState()
        state.promptBacklog = [self.initialDisplayPrompt]
        state.displayPrompt = self.initialDisplayPrompt
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        let date = Date()
        store.send(.prompt(.markAsUsed(date))) {
            $0.promptBacklog[0].lastUsed = date
            $0.promptBacklog[0].timesUsed = 1
        }
    }

    func testToggleFavoriteSetsFavoriteToTrueIfItIsInitiallyFalse() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )

        store.send(.prompt(.toggleFavorite)) {
            $0.displayPrompt.isFavorite = true
        }
    }

    func testToggleFavoriteSetsFavoriteToTrueIfItIsInitiallyTrue() {
        var state = AppState()
        state.displayPrompt.isFavorite = true
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )

        store.send(.prompt(.toggleFavorite)) {
            $0.displayPrompt.isFavorite = false
        }
    }
    
    func testRefreshPromptSetsNewDisplayPromtButDoesNotAdvance() {
        var state = AppState()
        state.displayPrompt = initialDisplayPrompt
        state.promptBacklog = [promptTwo]
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )

        store.send(.prompt(.refreshPrompt)) {
            $0.displayPrompt = self.promptTwo
            $0.promptBacklog = [self.promptTwo, self.initialDisplayPrompt]
        }
    }

}
