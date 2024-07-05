//
//  MeaningListInteractorTest.swift
//  Acronysm_IOSTests
//
//  Created by MacBooK Pro on 4/07/24.
//

import XCTest
@testable import Acronysm_IOS

class MeaningListInteractorTests: XCTestCase {
    
    var sut: MeaningListInteractor!
    var mockPresenter: MockPresenter!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUpWithError() throws {
        mockPresenter = MockPresenter()
        mockNetworkManager = MockNetworkManager()
        sut = MeaningListInteractor()
        sut.presenter = mockPresenter
        sut.networkManager = mockNetworkManager
    }
    
    override func tearDownWithError() throws {
        mockPresenter = nil
        mockNetworkManager = nil
        sut = nil
    }
    
    func testFetchAcronysmSuccess() {
        let expectation = self.expectation(description: "Fetch acronym success")
        mockNetworkManager.shouldSucceed = true
        sut.fetchAcronysm(dataString: "OMG")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.mockPresenter.validateDataWascalled)
            XCTAssertFalse(self.mockPresenter.validateErrorWascalled)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchAcronysmFailure() {
        let expectation = self.expectation(description: "Fetch acronym failure")
        mockNetworkManager.shouldSucceed = false
        sut.fetchAcronysm(dataString: "OMG")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(self.mockPresenter.validateDataWascalled)
            XCTAssertTrue(self.mockPresenter.validateErrorWascalled)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}

class MockPresenter: MeaningListInteractorOutputProtocol {
    var validateDataWascalled = false
    var validateErrorWascalled = false
    func validateData(dataModel: [MeaningResponse]) {
        validateDataWascalled = true
    }
    
    func validateError(error: String) {
        validateErrorWascalled = true
    }
}

class MockNetworkManager: NetworkManager {
    var shouldSucceed = true
    
    override func fetchMeanings(acronysm: String, completion: @escaping (Result<[MeaningResponse], Error>) -> Void) {
        if shouldSucceed {
            completion(.success([MeaningResponse(lfs: [LfsResp(lf: String(), freq: 0, since: 0, vars: nil)])]))
        } else {
            completion(.failure(NSError(domain: "Test", code: 0, userInfo: nil)))
        }
    }
}
