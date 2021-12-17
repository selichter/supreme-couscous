//
//  Store.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import Foundation
import Combine

final class Store<Value, Action>: ObservableObject {
    @Published private(set) var value: Value
    let reducer: (inout Value, Action) -> Void
    
    init(value: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = value
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        self.reducer(&self.value, action)
    }
}

