//
//  HomeFeedReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

func homeFeedReducer(value: inout AppState, action: AppAction) -> Void {
    switch action {
    case .homeFeed(.refreshPrompt):
        let initialPrompt = value.displayPrompt
        if let index = value.promptBacklog.indices.randomElement() {
            let prompt = value.promptBacklog.remove(at: index)
            value.displayPrompt = prompt
        }
        value.promptBacklog.append(initialPrompt)
    default:
        break
    }
}
