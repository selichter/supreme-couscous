//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation

public struct Entry: Identifiable {
    public var id: UUID
    public var text: String
    public var date: Date
    public var promptId: UUID
    
    public init(text: String,
                date: Date,
                promptId: UUID,
                id: UUID) {
        self.text = text
        self.date = date
        self.promptId = promptId
        self.id = id
        
    }
}

extension Entry: Equatable {
    
}
