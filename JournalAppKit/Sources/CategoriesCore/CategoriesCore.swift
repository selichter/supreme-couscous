//
//  File.swift
//  
//
//  Created by Sarah Lichter on 12/21/21.
//

import Foundation
import Models
import ComposableArchitecture


public enum CategroyAction {
    case filterByCategory(String)
    
}

public struct CategroyEnvironment {
    public init() {}
}

public struct CategoriesState {
    public var filterCategroy: String
    
    public init(filterCategory: String = Category.all.rawValue) {
        self.filterCategroy = filterCategory
    }
}

public let categoryReducer = Reducer<CategoriesState, CategroyAction, CategroyEnvironment> { state, action, _ in
  switch action {
  case let .filterByCategory(category):
      state.filterCategroy = category
      return .none
  }
}
