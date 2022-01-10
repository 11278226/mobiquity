//
//  ItemViewModel.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import SwiftUI

class ItemListViewModel: ListViewModelProtocol {
  @Published private(set) var datasource: [Item] = []

    init(items: [Item]) {
        self.datasource = items
    }
}
