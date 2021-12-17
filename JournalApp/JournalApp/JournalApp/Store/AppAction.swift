//
//  AppAction.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

enum AppAction {
    case prompt(PromptsAction)
    case homeFeed(HomeFeedAction)
    case entry(EntryAction)
}
