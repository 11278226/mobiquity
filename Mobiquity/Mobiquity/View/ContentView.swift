//
//  ContentView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ItemListViewModel = ItemListViewModel()
    @State private var searchText = ""
    @State private var page: Int = 1
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 260
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
              title: Text("Error"),
              message: Text(viewModel.errorMessage ?? "")
            )
          })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
