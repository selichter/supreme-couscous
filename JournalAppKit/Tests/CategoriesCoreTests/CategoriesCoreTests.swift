//
//  CategoriesCoreTests.swift
//  
//
//  Created by Sarah Lichter on 12/21/21.
//

import XCTest
import ComposableArchitecture
import Models
import AppStateCore
@testable import CategoriesCore

class CategoriesCoreTests: XCTestCase {

    func testFilterByCategorySetsFilterCategoryOnState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        
        store.send(.category(.filterByCategory("Health"))) {
            $0.filterCategory = "Health"
        }
    }

}
