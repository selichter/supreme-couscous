//
//  AppReducer.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import ComposableArchitecture


let appReducer = Reducer.combine(
    promptReducer.pullback(
        state: \AppState.prompts,
        action: /AppAction.prompt,
        environment: { (_: AppEnvironment) in PromptsEnvironment() }
    ),
    entriesReducer.pullback(
        state: \AppState.entries,
        action: /AppAction.entry,
        environment: { (_: AppEnvironment) in EntriesEnvironment() }
    )
)
