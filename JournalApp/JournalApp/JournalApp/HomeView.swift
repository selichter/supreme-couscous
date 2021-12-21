//
//  HomeView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI
import Models
import ComposableArchitecture
import PromptsCore
import AppStateCore
import Styleguide

struct HomeView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Prompted")
                            .font(.largeTitle)
                            .bold()
                        
                        NavigationLink(destination: PromptsView(store: store, displayPrompt: viewStore.displayPrompt)) {
                            VStack{
                                HStack {
                                    Text(viewStore.displayPrompt.category.rawValue)
                                        .accessibilityIdentifier("category")
                                    Spacer()
                                    Image(systemName: "arrow.clockwise")
                                        .onTapGesture {
                                            viewStore.send(.prompt(.refreshPrompt))
                                        }
                                }
                                .font(.body)
                                
                                Text(viewStore.displayPrompt.text)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .font(.title)
                                    .textCase(.uppercase)
                                    .lineSpacing(2)
                                    .padding(.bottom)
                                    .accessibilityIdentifier("prompt")
                        }
                        .foregroundColor(.white)
                        .padding(Spacing.defaultViewMargin)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.black))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recent Entries")
                        ForEach(viewStore.appEntries) { entry in
                            HStack {
                                Text(entry.text)
                                Spacer()
                                Text(entry.date.getFormattedDate(format: "MMM dd, yyyy"))
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Browse Categories")
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(Category.allCases, id: \.self) { category in
                                        NavigationLink(destination: CategoryDetailView(category: category.rawValue)) {
                                            Text(category.rawValue)
                                                .accessibilityIdentifier("category\(category.rawValue)")
                                        }
                                    }
                                }
                            }.accessibility(identifier: "categoryScroll")
                    }
                }
                .padding(Spacing.defaultViewMargin/2)
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()))
    }
}
