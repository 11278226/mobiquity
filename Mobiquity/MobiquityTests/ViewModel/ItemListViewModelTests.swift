//
//  ItemListViewModelTests.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

@testable import Mobiquity
import XCTest

class ItemListViewModelTests: XCTestCase {

    let itemOne: Item = Item(title: "One")
    let itemTwo: Item = Item(title: "Two")
    var itemListViewModel: ItemListViewModel!
    
    override func setUpWithError() throws {
        itemListViewModel = ItemListViewModel(items: [itemOne, itemTwo])
    }

    override func tearDownWithError() throws {
        itemListViewModel = nil
    }

    func testDataSource() throws {
        XCTAssertEqual(itemListViewModel.datasource.count, 2)
        XCTAssertEqual(itemListViewModel.datasource[0].id, itemOne.id)
        XCTAssertEqual(itemListViewModel.datasource[1].id, itemTwo.id)
    }

}
