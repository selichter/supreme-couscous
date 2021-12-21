//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/20/21.
//

import Foundation
import Models
import ComposableArchitecture


public struct PromptsEnvironment {
    public init() {}
}

public struct PromptsState {
    public var promptBacklog: [Prompt] = []
    public var displayPrompt: Prompt
    public var usedPrompts: [Prompt] = []
    
    public init(promptBacklog: [Prompt],
                displayPrompt: Prompt,
                usedPrompts: [Prompt]) {
        self.promptBacklog = promptBacklog
        self.usedPrompts = usedPrompts
        self.displayPrompt = displayPrompt
    }
}

extension PromptsState: Equatable {
    public static func == (lhs: PromptsState, rhs: PromptsState) -> Bool {
        return lhs.displayPrompt == rhs.displayPrompt &&
        lhs.usedPrompts == rhs.usedPrompts &&
        lhs.promptBacklog == rhs.promptBacklog
    }
}

public enum PromptsAction {
    case advancePrompt
    case markAsUsed(Date)
    case toggleFavorite
    case refreshPrompt
}


public let promptReducer = Reducer<PromptsState, PromptsAction, PromptsEnvironment> { state, action, _ in
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

