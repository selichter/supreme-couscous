//
//  AppState.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import SwiftUI

struct AppState {
    var displayPrompt: Prompt = Prompt(id: 20,
                                       text: "What are you looking to gain from building a journaling habit?",
                                       category: Category.selfDiscovery)
    var usedPrompts: [Prompt] = []
    var promptBacklog: [Prompt] = [
        Prompt(id: 0,
               text: "What do I know to be true that I didn’t know a year ago?",
               category: Category.selfDiscovery),
        Prompt(id: 1,
               text: "What distractions get in the way of being my most productive?", category: Category.health),
        Prompt(id: 2,
               text: "When do I feel most in tune with myself?",
               category: Category.selfDiscovery),
        Prompt(id: 3,
               text: "If someone described me, what would they say?",
               category: Category.selfDiscovery),
        Prompt(id: 4,
               text: "What can wait until next week?",
               category: Category.selfDiscovery),
        Prompt(id: 5,
               text: "How does every part of my body feel in this moment?",
               category: Category.selfDiscovery),
        Prompt(id: 6,
               text: "What emotions am I holding on to?",
               category: Category.managingEmotions),
        Prompt(id: 7,
               text: "How can I detach or neutralize this emotion?",
               category: Category.managingEmotions),
        Prompt(id: 8,
               text: "Why am I doing X?",
               category: Category.managingEmotions),
        Prompt(id: 9,
               text: "Why am I feeling this way?",
               category: Category.managingEmotions),
        Prompt(id: 10,
               text: "What can wait until next week?",
               category: Category.managingEmotions),
        Prompt(id: 11,
               text: "What is causing these feelings?",
               category: Category.managingEmotions)
    ]
    var entries: [Entry] = []
}

