//
//  ContentView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ItemListViewModel
    @State private var searchText = ""
    @State private var page: Int = 1
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 300
    
    init() {
        self.viewModel = ItemListViewModel()
    }
    
    var body: some View {
        VStack {
            SearchBarView(viewModel: viewModel, searchText: $searchText, page: $page)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.datasource) { item in
                        CardView(item: item)
                            .frame(height: height)
                    }
                    EndListView()
                        .onAppear {
                            if !viewModel.datasource.isEmpty {
                                page += 1
                                viewModel.loadData(searchParameters: SearchParameters(text: searchText, page: page))
                            }
                        }
                }
                .padding()
            }.onAppear {
                viewModel.loadData(searchParameters: SearchParameters(text: searchText, page: page))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
