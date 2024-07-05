//
//  MeaningListProtocols.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//  
//

import Foundation
import UIKit

protocol MeaningListViewControllerProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MeaningListPresenterProtocol? { get set }
    func receiveData(data:[LfsResp])
    func emptyTable()
}

protocol MeaningListRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    var viewController: MeaningListViewController? { get set }
    static func createMeaningListModule() -> MeaningListViewController
    func displayError(errorMessage:String)
}

protocol MeaningListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MeaningListViewControllerProtocol? { get set }
    var interactor: MeaningListInteractorInputProtocol? { get set }
    var router: MeaningListRouterProtocol? { get set }    
    func viewDidLoad()
    func FindMeaning(meaning:String)
}

protocol MeaningListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func validateData(dataModel:[MeaningResponse])
    func validateError(error:String)
}

protocol MeaningListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MeaningListInteractorOutputProtocol? { get set }
    func fetchAcronysm(dataString: String)
}
