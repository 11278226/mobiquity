//
//  CardViewTests.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

@testable import Mobiquity
import XCTest

class CardViewTests: XCTestCase {
    
    var cardView: CardView!

    override func setUpWithError() throws {
        cardView = CardView_Previews.previews
    }

    override func tearDownWithError() throws {
        cardView = nil
    }

    func testPreview() throws {
        XCTAssertEqual(cardView.title, CardView_Previews.previews.title)
    }
}
