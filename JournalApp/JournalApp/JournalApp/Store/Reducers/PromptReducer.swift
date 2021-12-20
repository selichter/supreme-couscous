//
//  PromptReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import Models
import ComposableArchitecture


struct PromptsEnvironment { }


struct PromptsState {
    var promptBacklog: [Prompt] = []
    var displayPrompt: Prompt
    var usedPrompts: [Prompt] = []
}

extension PromptsState: Equatable {
    static func == (lhs: PromptsState, rhs: PromptsState) -> Bool {
        return lhs.displayPrompt == rhs.displayPrompt &&
        lhs.usedPrompts == rhs.usedPrompts &&
        lhs.promptBacklog == rhs.promptBacklog
    }
}

enum PromptsAction {
    case advancePrompt
    case markAsUsed(Date)
    case toggleFavorite
    case refreshPrompt
}


let promptReducer = Reducer<PromptsState, PromptsAction, PromptsEnvironment> { state, action, _ in
  switch action {
  case .advancePrompt:
      state.usedPrompts.append(state.displayPrompt)
      if let index = state.promptBacklog.indices.randomElement() {
          let prompt = state.promptBacklog.remove(at: 0)
          state.displayPrompt = prompt
      }
      return .none
  case let .markAsUsed(date):
      state.displayPrompt.lastUsed = date
      state.displayPrompt.timesUsed += 1
      return .none
  case .toggleFavorite:
      state.displayPrompt.isFavorite.toggle()
      return .none
  case .refreshPrompt:
      let initialPrompt = state.displayPrompt
      if let index = state.promptBacklog.indices.randomElement() {
          let prompt = state.promptBacklog.remove(at: 0)
          state.displayPrompt = prompt
      }
      state.promptBacklog.append(initialPrompt)
      return .none
  }
}
