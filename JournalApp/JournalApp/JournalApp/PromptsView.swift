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

struct PromptsView: View {
    let store: Store<PromptsState, PromptsAction>
    @State var textInput: String = "Write here..."
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(.vertical){
                VStack(alignment: .leading, spacing: 12) {
                    Text(viewStore.displayPrompt.text)
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
                            Text(viewStore.displayPrompt.lastUsed?.getFormattedDate(format: "MMM dd, yyyy") ?? "-")
                                .font(.callout)
                                .accessibilityIdentifier("lastUsed")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Num of Times Used")
                                .font(.caption)
                                
                            Text("\(viewStore.displayPrompt.timesUsed)")
                                .font(.callout)
                                .accessibilityIdentifier("count")
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Category")
                                .font(.caption)
                                
                            Text("\(viewStore.displayPrompt.category.rawValue)")
                                .font(.callout)
                                .accessibilityIdentifier("category")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Entry")
                            .font(.caption)
                        TextEditor(text: $textInput)
                            .background(Color.white)
                            .cornerRadius(Spacing.smallCornerRadius)
                            .foregroundColor(textInput == "Write here..." ? .gray : .black)
                            .accessibilityIdentifier("entryTextfield")
                            .frame(minHeight: 100)
                            .onTapGesture {
                                if textInput == "Write here..." {
                                    textInput = ""
                                }
                                
                            }
                        
    //                    Button("Save Entry") {
    //                        store.send(.entry(.createEntry(textInput, Date(), store.value.displayPrompt.id)))
    //                        store.send(.prompt(.markAsUsed(Date())))
    //                    }

                    }

                }
            }
            .padding(Spacing.defaultViewMargin)

        }
            
    }
}
//
//struct PromptsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PromptsView(store: Store(value: AppState(), reducer: appReducer))
//    }
//}
