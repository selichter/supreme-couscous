//
//  Prompt.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import SwiftUI

struct Prompt: Identifiable {
    var id: Int
    let text: String
    let category: Category
    var lastUsed: Date?
    var textColor: Color = Color.white
    var timesUsed: Int = 0
    var isFavorite: Bool = false
}
