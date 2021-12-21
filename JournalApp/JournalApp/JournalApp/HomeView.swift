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

struct HomeView: View {
    let store: Store<PromptsState, PromptsAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("Prompted")
                            .font(.largeTitle)
                            .bold()
                        
                        NavigationLink(destination: PromptsView(store: store)) {
                            VStack{
                                HStack {
                                    Text(viewStore.displayPrompt.category.rawValue)
                                        .accessibilityIdentifier("category")
                                    Spacer()
                                    Image(systemName: "arrow.clockwise")
                                        .onTapGesture {
                                            viewStore.send(.refreshPrompt)
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
                        .background(
                            RoundedRectangle(cornerRadius: 8).fill(.black)
                        )
                        }
                    }
                    
    //                VStack(alignment: .leading) {
    //                    Text("Recent Entries")
    //                    ForEach(store.value.entries) { entry in
    //                        HStack {
    //                            Text(entry.text)
    //                            Spacer()
    //                            Text(entry.date.getFormattedDate(format: "MMM dd, yyyy"))
    //                        }
    //
    //                    }
    //
    //                }
                }
                .padding(Spacing.defaultViewMargin/2)
            }

        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(store: Store(value: AppState(), reducer: appReducer))
//    }
//}
