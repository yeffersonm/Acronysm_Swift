//
//  MeaningListPresenterTest.swift
//  Acronysm_IOSTests
//
//  Created by MacBooK Pro on 4/07/24.
//

import XCTest
@testable import Acronysm_IOS

final class MeaningListPresenterTest: XCTestCase {
    var sut: MeaningListPresenter!
    var routerMock: RouterMock!
    var viewMock : ViewMock!
    var interactorMock:InteractorMock!
    
    override func setUpWithError() throws {
        viewMock = ViewMock()
        routerMock = RouterMock()
        interactorMock = InteractorMock()
        sut = MeaningListPresenter()
        sut.view = viewMock
        sut.router = routerMock
        sut.interactor = interactorMock
    }
    
    override func tearDownWithError() throws {
        viewMock = nil
        routerMock = nil
        interactorMock = nil
        sut = nil
    }
    
    
    func test_ViewDidload() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorMock.fetchAcronysmWascalled)
    }
    
    func test_validateDataSuccces(){
        sut.validateData(dataModel: [MeaningResponse(lfs: [LfsResp(lf: "Dummy", freq: 3, since: 1800, vars: nil)])])
        XCTAssertTrue(viewMock.receiveDataWascalled)
    }
    
    func test_validateDataEmpty(){
        sut.validateData(dataModel: [])
        XCTAssertTrue(viewMock.emptyTableWascalled)
    }
    
    func test_fetchAcronysmFail(){
        sut.validateError(error: "Error")
        XCTAssertTrue(routerMock.displayErrorWascalled)
    }
    
}

class InteractorMock:MeaningListInteractorInputProtocol {
    var presenter: MeaningListInteractorOutputProtocol?
    var fetchAcronysmWascalled = false
    
    func fetchAcronysm(dataString: String) {
        fetchAcronysmWascalled = true
    }
}

class RouterMock:MeaningListRouterProtocol{
    var viewController: MeaningListViewController?
    var displayErrorWascalled = false
    
    static func createMeaningListModule() -> MeaningListViewController {
        return MeaningListViewController()
    }
    
    func displayError(errorMessage: String) {
        displayErrorWascalled = true
    }
}

class ViewMock: MeaningListViewControllerProtocol {
    var presenter: MeaningListPresenterProtocol?
    var receiveDataWascalled = false
    var emptyTableWascalled = false
    
    func receiveData(data: [LfsResp]) {
        receiveDataWascalled = true
    }
    
    func emptyTable() {
        emptyTableWascalled = true
    }
}
