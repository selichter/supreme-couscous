//
//  EntryReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import Models
import ComposableArchitecture


public enum EntryAction {
    case createEntry(String, Date, UUID, UUID)
}

public struct EntriesEnvironment {
    public init() {}
}


public struct EntriesState {
    public var entries: [Entry] = []
    
    public init(entries: [Entry]) {
        self.entries = entries
    }
}

extension EntriesState: Equatable {
    public static func == (lhs: EntriesState, rhs: EntriesState) -> Bool {
        return lhs.entries == rhs.entries
    }
}


public let entriesReducer = Reducer<EntriesState, EntryAction, EntriesEnvironment> { state, action, _ in
  switch action {
  case let .createEntry(entryText, entryDate, promptId, entryId):
      let entry = Entry(text: entryText, date: entryDate, promptId: promptId, id: entryId)
      state.entries.append(entry)
      print("oh look - entries!")
      dump(state.entries)
      return .none
  }
}
