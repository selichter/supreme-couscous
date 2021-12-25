//
//  PromptsView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI
import Models
import ComposableArchitecture
import DateHelpers
import PromptsCore
import AppStateCore
import EntriesCore
import Styleguide

struct PromptsView: View {
    let store: Store<AppState, AppAction>
    @State var textInput: String = "Write here..."
    var displayPrompt: Prompt
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(.vertical){
                VStack(alignment: .leading, spacing: Spacing.stackElementSpacing) {
                    Text(displayPrompt.text)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .textCase(.uppercase)
                        .lineSpacing(2)
                        .accessibilityIdentifier("prompt")
                        .padding(.bottom)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Last Used")
                                .font(.caption)
                            Text(displayPrompt.lastUsed?.getFormattedDate(format: "MMM dd, yyyy") ?? "-")
                                .font(.callout)
                                .accessibilityIdentifier("lastUsed")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Num of Times Used")
                                .font(.caption)
                                
                            Text("\(displayPrompt.timesUsed)")
                                .font(.callout)
                                .accessibilityIdentifier("count")
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Category")
                                .font(.caption)
                                
                            Text("\(displayPrompt.category.rawValue)")
                                .font(.callout)
                                .accessibilityIdentifier("category")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Entry")
                            .font(.caption)
                        TextEditor(text: $textInput)
                            .background(Color.white)
                            .cornerRadius(Spacing.cornerRadus)
                            .foregroundColor(textInput == "Write here..." ? .gray : .black)
                            .accessibilityIdentifier("entryTextfield")
                            .frame(minHeight: 100)
                            .onTapGesture {
                                if textInput == "Write here..." {
                                    textInput = ""
                                }
                                
                            }
                        
                        Button("Save Entry") {
                            viewStore.send(.entry(.createEntry(textInput, Date(), displayPrompt.id, UUID())))
                            viewStore.send(.prompt(.markAsUsed(Date())))
                        }

                    }

                }
            }
            .padding(Spacing.defaultViewMargin)

        }
            
    }
}

struct PromptsView_Previews: PreviewProvider {
    static var previews: some View {
        PromptsView(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()), displayPrompt: Prompt(text: "Display", category: Category.money))
    }
}
