//
//  SearchBarView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 12/01/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: ItemListViewModel
    @Binding var searchText: String
    @Binding var page: Int
    static let placeholderText = "Search .."
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 2)
             HStack {
                 Image(systemName: "magnifyingglass")
                 TextField(SearchBarView.placeholderText, text: $searchText, onCommit: {
                     page = 1
                     viewModel.loadData(searchParameters: SearchParameters(text: searchText, page: page))
                 })
                 NavigationLink(destination: SearchHistoryView(searchHistory: viewModel.fetchSearchHistory(), searchText: $searchText, page: $page)) {
                     Image(systemName: "gobackward").foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                     
                 }
             }
             .padding(.leading, 12)
             .padding(.trailing, 12)
        }
        .frame(height: 40)
        .padding()
    }
}
