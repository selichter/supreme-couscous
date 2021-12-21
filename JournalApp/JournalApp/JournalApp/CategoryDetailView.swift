//
//  CategoryView.swift
//  JournalApp
//
//  Created by Sarah Lichter on 12/21/21.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: String
    var body: some View {
        VStack {
            Text("Category Detail")
            Text(category)
        }
        
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: "A category")
    }
}
