//
//  ItemTests.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

@testable import Mobiquity
import XCTest

class ItemTests: XCTestCase {
    
    var item: Item!

    override func setUpWithError() throws {
        item = Item(id: "1", owner: "owner", secret: "secret", server: "server", farm: 1, title: "title", isPublic: 1, isFriend: 0, isFamily: 0)
    }

    override func tearDownWithError() throws {
        item = nil
    }

    func testItemStruct() throws {
        XCTAssertEqual(item.id, "1")
        XCTAssertEqual(item.owner, "owner")
        XCTAssertEqual(item.secret, "secret")
        XCTAssertEqual(item.server, "server")
        XCTAssertEqual(item.farm, 1)
        XCTAssertEqual(item.title, "title")
        XCTAssertEqual(item.isPublic, 1)
        XCTAssertEqual(item.isFriend, 0)
        XCTAssertEqual(item.isFamily, 0)
    }

}
