//
//  SearchHistoryProtocol.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 12/01/2022.
//

import Foundation

protocol SearchHistoryProtocol {
    func fetchSearchHistory() -> [String]
    func addSearchText(searchText: String)
    func isExists(searchedText: String) -> Bool
}
