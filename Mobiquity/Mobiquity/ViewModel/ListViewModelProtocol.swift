//
//  ListViewModelProtocol.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

import Foundation

protocol ListViewModelProtocol: ObservableObject {
    associatedtype DataItem

    var datasource: DataItem { get }
    func loadData(searchParameters: SearchParameters)
}
