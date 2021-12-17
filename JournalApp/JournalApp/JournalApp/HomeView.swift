//
//  HomeView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI
import Models

struct HomeView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Prompted")
                        .font(.largeTitle)
                        .bold()
                    
                    NavigationLink(destination: PromptsView(store: store)) {
                        VStack{
                            HStack {
                                Text(store.value.displayPrompt.category.rawValue)
                                    .accessibilityIdentifier("category")
                                Spacer()
                                Image(systemName: "arrow.clockwise")
                                    .onTapGesture {
                                        store.send(.homeFeed(.refreshPrompt))
                                    }
                            }
                            .font(.body)
                            
                            Text(store.value.displayPrompt.text)
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
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(.black)
                    )
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Recent Entries")
                    ForEach(store.value.entries) { entry in
                        HStack {
                            Text(entry.text)
                            Spacer()
                            Text(entry.date.getFormattedDate(format: "MMM dd, yyyy"))
                        }
                        
                    }
                    
                }
            }
            .padding(Spacing.defaultViewMargin/2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: Store(value: AppState(), reducer: appReducer))
    }
}
