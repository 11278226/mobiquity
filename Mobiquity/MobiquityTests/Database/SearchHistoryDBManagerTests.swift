//
//  SearchHistoryDBManagerTests.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 13/01/2022.
//

@testable import Mobiquity
import XCTest

class SearchHistoryDBManagerTests: XCTestCase {
    
    var dbManager: SearchHistoryDBManager!
    let searchText = "Searching"

    override func setUpWithError() throws {
        dbManager = SearchHistoryDBManager()
    }

    override func tearDownWithError() throws {
        dbManager.removeTextFromSearchHistory(text: searchText)
        dbManager = nil
    }

    func testAddSearchText_fetchSearchHistory() throws {
        if !dbManager.isExists(searchedText: searchText) {
            dbManager.addSearchText(searchText: searchText)
        }
        let searchHistory = dbManager.fetchSearchHistory()
        let searchTextFound = searchHistory.filter { searchText.contains($0) }.count != 0
        XCTAssertTrue(searchTextFound)
    }
    
    func testIsExists_removeTextFromSearchHistory() throws {
        if dbManager.isExists(searchedText: searchText) {
            dbManager.removeTextFromSearchHistory(text: searchText)
        }
        dbManager.addSearchText(searchText: searchText)
        
        XCTAssertTrue(dbManager.isExists(searchedText: searchText))
        
        dbManager.removeTextFromSearchHistory(text: searchText)
        
        XCTAssertTrue(!dbManager.isExists(searchedText: searchText))
    }
    
}
