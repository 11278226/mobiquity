//
//  SearchHistoryView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 12/01/2022.
//

import SwiftUI

struct SearchHistoryView: View {
    @Environment(\.presentationMode) var presentation
    var searchHistory: [String]
    @Binding var searchText: String
    @Binding var page: Int
    static let navigationTitle = "Search History"
    
    var body: some View {
        List {
            ForEach(searchHistory, id: \.self) { text in
                Text(text)
                    .onTapGesture {
                        searchText = text
                        page = 1
                        self.presentation.wrappedValue.dismiss()
                    }
            }
        }
        .navigationTitle(SearchHistoryView.navigationTitle)
    }
}
