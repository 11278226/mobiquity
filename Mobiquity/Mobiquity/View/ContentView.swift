//
//  ContentView.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ItemListViewModel
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let height: CGFloat = 150
    
    let cards: [Item] = [Item(title: "One"), Item(title: "Two"), Item(title: "Three"), Item(title: "Four"), Item(title: "Five"), Item(title: "Six"), Item(title: "Seven"), Item(title: "Eight"), Item(title: "Nine"), Item(title: "Ten")]
    
    init() {
        self.viewModel = ItemListViewModel(items: cards)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.datasource) { item in
                    CardView(title: item.title)
                        .frame(height: height)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
