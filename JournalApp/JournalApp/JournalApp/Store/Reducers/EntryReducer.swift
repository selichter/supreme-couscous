//
//  EntryReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import Models
import ComposableArchitecture


enum EntryAction {
    case createEntry(String, Date, UUID, UUID)
}

struct EntriesEnvironment { }


struct EntriesState {
    var entries: [Entry] = []
}

extension EntriesState: Equatable {
    static func == (lhs: EntriesState, rhs: EntriesState) -> Bool {
        return lhs.entries == rhs.entries
    }
}


let entriesReducer = Reducer<EntriesState, EntryAction, EntriesEnvironment> { state, action, _ in
  switch action {
  case let .createEntry(entryText, entryDate, promptId, entryId):
      let entry = Entry(text: entryText, date: entryDate, promptId: promptId, id: entryId)
      state.entries.append(entry)
      print("oh look - entries!")
      dump(state.entries)
      return .none
  }
}
