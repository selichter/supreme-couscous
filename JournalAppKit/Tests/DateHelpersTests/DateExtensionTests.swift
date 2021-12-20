//
//  DateExtensionTests.swift
//  JournalAppTests
//
//  Created by Sarah Lichter on 12/16/21.
//

import XCTest
@testable import DateHelpers

class DateExtensionTests: XCTestCase {

    func testGetFormattedDateFormatsDate() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 2021,
                                            month: 2,
                                            day: 10)

        let date = calendar.date(from: dateComponents)!

        let dateString = date.getFormattedDate(format: "MM-dd-yyyy")
        XCTAssertEqual(dateString, "02-10-2021")
    }

    func testGetFormattedDateSpellsOutDate() {

        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 2021,
                                            month: 2,
                                            day: 10)

        let date = calendar.date(from: dateComponents)!

        let dateString = date.getFormattedDate(format: "MMMM d, yyyy")
        XCTAssertEqual(dateString, "February 10, 2021")

    }

}
