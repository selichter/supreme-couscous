//
//  PromptsView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/16/21.
//

import SwiftUI
import Models

struct PromptsView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    @State var textInput: String = "Write here..."
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 12) {
                Text(store.value.displayPrompt.text)
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
                        Text(store.value.displayPrompt.lastUsed?.getFormattedDate(format: "MMM dd, yyyy") ?? "-")
                            .font(.callout)
                            .accessibilityIdentifier("lastUsed")
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Num of Times Used")
                            .font(.caption)
                            
                        Text("\(store.value.displayPrompt.timesUsed)")
                            .font(.callout)
                            .accessibilityIdentifier("count")
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Category")
                            .font(.caption)
                            
                        Text("\(store.value.displayPrompt.category.rawValue)")
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
                    
                    Button("Save Entry") {
                        store.send(.entry(.createEntry(textInput, Date(), store.value.displayPrompt.id)))
                        store.send(.prompt(.markAsUsed))
                    }

                }

            }
        }
        .padding(Spacing.defaultViewMargin)
            
    }
}

struct PromptsView_Previews: PreviewProvider {
    static var previews: some View {
        PromptsView(store: Store(value: AppState(), reducer: appReducer))
    }
}
