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
    
    public init(promptBacklog: [Prompt],
                displayPrompt: Prompt) {
        self.promptBacklog = promptBacklog
        self.displayPrompt = displayPrompt
    }
}

extension PromptsState: Equatable {
    public static func == (lhs: PromptsState, rhs: PromptsState) -> Bool {
        return lhs.displayPrompt == rhs.displayPrompt &&
        lhs.promptBacklog == rhs.promptBacklog
    }
}

public enum PromptsAction {
    case markAsUsed(Date)
    case toggleFavorite
    case refreshPrompt
    case getByCategory(String)
}


public let promptReducer = Reducer<PromptsState, PromptsAction, PromptsEnvironment> { state, action, _ in
  switch action {
  case let .markAsUsed(date):
      if var selectedPrompt = state.promptBacklog.first(where: { $0.id == state.displayPrompt.id}) {
          selectedPrompt.timesUsed += 1
          selectedPrompt.lastUsed = date
          
          state.promptBacklog.removeAll {$0.id == state.displayPrompt.id}
          state.promptBacklog.append(selectedPrompt)
      }
      state.displayPrompt.lastUsed = date
      state.displayPrompt.timesUsed += 1
      return .none
  case .toggleFavorite:
      state.displayPrompt.isFavorite.toggle()
      return .none
  case .refreshPrompt:
      let initialPrompt = state.displayPrompt
      let sorted = state.promptBacklog.sorted { $0.timesUsed < $1.timesUsed }
      if let minTimesCounted = sorted.first?.timesUsed {
          let filtered = state.promptBacklog.filter { $0.timesUsed == minTimesCounted}
          state.displayPrompt = filtered.randomElement() ?? Prompt(text: "uhhhh", category: Category.money)
      }
      state.promptBacklog.append(initialPrompt)
      return .none
  case let .getByCategory(category):
      return .none
  }
}

