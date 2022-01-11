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
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 240
    
    init() {
        self.viewModel = ItemListViewModel()
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.datasource) { item in
                    CardView(item: item)
                        .frame(height: height)
                }
            }
            .padding()
        }.onAppear {
            viewModel.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
