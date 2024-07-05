//
//  MeaningListRouter.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//  
//

import Foundation
import UIKit

class MeaningListRouter: MeaningListRouterProtocol {

    var viewController: MeaningListViewController?
    
    class func createMeaningListModule() -> MeaningListViewController {
        let ref = MeaningListViewController()
            let presenter: MeaningListPresenterProtocol & MeaningListInteractorOutputProtocol = MeaningListPresenter()
            let interactor: MeaningListInteractorInputProtocol = MeaningListInteractor()
            let router: MeaningListRouterProtocol = MeaningListRouter()
        ref.presenter = presenter
        router.viewController = ref
        presenter.view = ref
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return ref
    }
    
    func displayError(errorMessage: String) {
        self.viewController?.presentAlert(style:.error, message: errorMessage)
    }
}
