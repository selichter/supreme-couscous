//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

public struct Prompt: Identifiable {
    public let id: UUID = UUID()
    public let text: String
    public let category: Category
    public var lastUsed: Date?
    public var timesUsed: Int
    public var isFavorite: Bool
    
    public init(text: String,
                category: Category,
                lastUsed: Date? = nil,
                timesUsed: Int = 0,
                isFavorite: Bool = false) {
        self.text = text
        self.category = category
        self.lastUsed = lastUsed
        self.timesUsed = timesUsed
        self.isFavorite = isFavorite
        
    }
}

extension Prompt: Equatable {
    public static func == (lhs: Prompt, rhs: Prompt) -> Bool {
        return lhs.id == rhs.id &&
        lhs.text == rhs.text &&
        lhs.category == rhs.category &&
        lhs.lastUsed == rhs.lastUsed &&
        lhs.timesUsed == rhs.timesUsed &&
        lhs.isFavorite == rhs.isFavorite
    }
}
