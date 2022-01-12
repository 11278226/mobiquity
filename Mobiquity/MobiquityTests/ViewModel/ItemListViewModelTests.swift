//
//  ItemListViewModelTests.swift
//  MobiquityTests
//
//  Created by Diarmuid O'Keeffe on 10/01/2022.
//

@testable import Mobiquity
import XCTest

class ItemListViewModelTests: XCTestCase {
    
    var repository: FlickrRepositoryProtocol!
    var mockServiceClient: MockServiceClient!
    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?
    
    var itemListViewModel: ItemListViewModel!
    
    override func setUpWithError() throws {
        mockServiceClient = MockServiceClient(clientService: MockService(), error: false)
        repository = FlickrRepository(client: mockServiceClient)
        itemListViewModel = ItemListViewModel(repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        successExpectation = nil
        failureExpectation = nil
        itemListViewModel = nil
    }
    
    func testSuccessLoadData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        mockServiceClient.error = false
        successExpectation = expectation(description: "Get Movies Success")
        itemListViewModel.loadData(searchParameters: SearchParameters(text: ""))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.successExpectation?.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertTrue(itemListViewModel.datasource.count > 0)
    }
    
    func testFailureLoadData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let mockServiceClient = MockServiceClient(clientService: MockService(), error: true)
        let repository = FlickrRepository(client: mockServiceClient)
        let itemListViewModel = ItemListViewModel(repository: repository)
        failureExpectation = expectation(description: "Get Movies Failure")
        itemListViewModel.loadData(searchParameters: SearchParameters(text: ""))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.failureExpectation?.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(itemListViewModel.datasource.count, 0)
    }

}
