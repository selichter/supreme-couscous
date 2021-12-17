//
//  JournalAppUITests.swift
//  JournalAppUITests
//
//  Created by Sarah Lichter on 12/16/21.
//

import XCTest

class JournalAppUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        app.launch()
    }

    func testPromptIsDisplayedOnHomeFeed() throws {
        XCTAssertEqual(app.staticTexts["category"].label, "Self-Discovery")
        XCTAssertEqual(app.staticTexts["prompt"].label, "What are you looking to gain from building a journaling habit?")
    }
    
    func testTappingRefreshIconChangesPrompt() {
        let initialPrompt = app.staticTexts["prompt"].label
        XCTAssertEqual(initialPrompt, "What are you looking to gain from building a journaling habit?")
        app.images["Refresh"].tap()
        
        XCTAssertNotEqual(initialPrompt, app.staticTexts["prompt"].label)
        
    }
    
    func testNavigateToPromptDetailViewAndVerifyElements() {
        app.staticTexts["prompt"].tap()
        
        app.staticTexts["prompt"].waitForExistence(timeout: 2)
        XCTAssertEqual(app.staticTexts["prompt"].label, "What are you looking to gain from building a journaling habit?")
        
        XCTAssert(app.staticTexts["Num of Times Used"].exists)
        XCTAssertEqual(app.staticTexts["count"].label, "0")
        
        XCTAssert(app.staticTexts["Last Used"].exists)
        XCTAssertEqual(app.staticTexts["lastUsed"].label, "-")
        
        XCTAssert(app.staticTexts["Category"].exists)
        XCTAssertEqual(app.staticTexts["category"].label, "Self-Discovery")
        
        let entryText = "Sample Entry Text"
        let entryTextView = app.textViews["entryTextfield"]
        entryTextView.doubleTap()
        entryTextView.typeText(entryText)
        app.buttons["Save Entry"].tap()
        
        XCTAssertEqual(app.staticTexts["count"].label, "1")
        let dateformat = DateFormatter()
        dateformat.dateFormat = "MMM dd, yyyy"
        let expectedDate = dateformat.string(from: Date())
        XCTAssertEqual(app.staticTexts["lastUsed"].label, expectedDate)
        
        app.navigationBars.buttons["Back"].tap()
        XCTAssert(app.staticTexts[entryText].exists)
    }

}
