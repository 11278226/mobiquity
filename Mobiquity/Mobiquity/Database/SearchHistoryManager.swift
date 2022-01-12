//
//  SearchHistoryManager.swift
//  Mobiquity
//
//  Created by Diarmuid O'Keeffe on 12/01/2022.
//

import Foundation
import SQLite
 
class SearchHistoryManager {

    private var db: Connection!
    private var searchHistory: Table!
    private var id: Expression<Int64>!
    private var name: Expression<String>!
     
    init () {
        do {
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            db = try Connection("\(path)/search_history.sqlite3")
            searchHistory = Table("searchHistory")
            id = Expression<Int64>("id")
            name = Expression<String>("name")
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                try db.run(searchHistory.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(name)
                })
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
 
    
}

extension SearchHistoryManager: SearchHistoryProtocol {
    func isExists(searchedText: String) -> Bool {
        var isExists: Bool = false
        do {
            let searchText: AnySequence<Row> = try db.prepare(searchHistory.filter(name.lowercaseString == searchedText.lowercased()))
            searchText.forEach({ (rowValue) in
                isExists = true
            })
        } catch {
            debugPrint(error.localizedDescription)
        }
        return isExists
    }
     
    func addSearchText(searchText: String) {
        do {
            try db.run(searchHistory.insert(name <- searchText))
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func fetchSearchHistory() -> [String] {
        guard let queryResults = try? db.prepare(searchHistory) else {
           return []
        }
        let searchHistory = queryResults.map { row -> String in
            return row[name]
        }
        return searchHistory
    }
}
