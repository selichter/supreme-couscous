//
//  PromptReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

func promptReducer(value: inout AppState, action: AppAction) -> Void {
    switch action {
    case .prompt(.advancePrompt):
        value.usedPrompts.append(value.displayPrompt)
        if let index = value.promptBacklog.indices.randomElement() {
            let prompt = value.promptBacklog.remove(at: index)
            value.displayPrompt = prompt
        }
    case .prompt(.markAsUsed):
        value.displayPrompt.lastUsed = Date()
        value.displayPrompt.timesUsed += 1
    case .prompt(.toggleFavorite):
        value.displayPrompt.isFavorite.toggle()
    default:
        break
    }
}

