//
//  EntryReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

func entryReducer(value: inout AppState, action: AppAction) -> Void {
    switch action {
    case let .entry(.createEntry(entryText, entryDate, promptId)):
        let entry = Entry(text: entryText, date: entryDate, promptId: promptId)
        value.entries.append(entry)
        print("oh look - entries!")
        dump(value.entries)
    default:
        break
    }
}
