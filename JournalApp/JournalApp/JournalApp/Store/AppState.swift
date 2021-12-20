//
//  AppState.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import SwiftUI
import Models
import ComposableArchitecture


struct AppState {
    var displayPrompt: Prompt = Prompt(text: "What are you looking to gain from building a journaling habit?",
                                       category: Category.selfDiscovery)
    var usedPrompts: [Prompt] = []
    var promptBacklog: [Prompt] = [Prompt(text: "What do I know to be true that I didn’t know a year ago?",
                                          category: Category.selfDiscovery),
                                   Prompt(text: "What distractions get in the way of being my most productive?", category: Category.health),
                                   Prompt(text: "When do I feel most in tune with myself?",
                                          category: Category.selfDiscovery),
                                   Prompt(text: "If someone described me, what would they say?",
                                          category: Category.selfDiscovery),
                                   Prompt(text: "What can wait until next week?",
                                          category: Category.selfDiscovery),
                                   Prompt(text: "How does every part of my body feel in this moment?",
                                          category: Category.selfDiscovery),
                                   Prompt(text: "What emotions am I holding on to?",
                                          category: Category.managingEmotions),
                                   Prompt(text: "How can I detach or neutralize this emotion?",
                                          category: Category.managingEmotions),
                                   Prompt(text: "Why am I doing X?",
                                          category: Category.managingEmotions),
                                   Prompt(text: "Why am I feeling this way?",
                                          category: Category.managingEmotions),
                                   Prompt(text: "What can wait until next week?",
                                          category: Category.managingEmotions),
                                   Prompt(text: "What is causing these feelings?",
                                          category: Category.managingEmotions)]
    
    var appEntries: [Entry] = []
    
    var prompts: PromptsState {
        get {
            .init(promptBacklog: self.promptBacklog,
                  displayPrompt: self.displayPrompt,
                  usedPrompts: self.usedPrompts)
        }
        set {
            self.displayPrompt = newValue.displayPrompt
            self.usedPrompts = newValue.usedPrompts
            self.promptBacklog = newValue.promptBacklog
        }
    }
    
    var entries: EntriesState {
        get {
            .init(entries: self.appEntries)
        }
        set {
            self.appEntries = newValue.entries
        }
    }
    
}

extension AppState: Equatable {
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        return lhs.displayPrompt == rhs.displayPrompt &&
        lhs.promptBacklog == rhs.promptBacklog &&
        lhs.usedPrompts == rhs.usedPrompts
    }
}

struct AppEnvironment {}
