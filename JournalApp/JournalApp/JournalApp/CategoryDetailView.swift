//
//  CategoryView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/21/21.
//

import SwiftUI
import ComposableArchitecture
import AppStateCore
import Models
import Styleguide

struct CategoryDetailView: View {
    let store: Store<AppState, AppAction>
    let category: String
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading, spacing: Spacing.stackElementSpacing) {
                Text(category)
                    .font(.largeTitle)
                    .bold()
                    .center(.horizontal)
                
                Text("Prompts in Category:")
                    .font(.title3)
                    .bold()
                
                ForEach(viewStore.prompts.promptBacklog.filter{ $0.category.rawValue == category }) { prompt in
                    if prompt.category.rawValue == category {
                        Text(prompt.text)
                    }
                }
                Spacer()
            }.padding(Spacing.defaultViewMargin)

        }
        
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(
                           store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()), category: "A category")
    }
}
