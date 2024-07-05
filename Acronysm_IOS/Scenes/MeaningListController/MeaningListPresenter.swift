//
//  MeaningListPresenter.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//  
//

import Foundation

class MeaningListPresenter  {
    // MARK: Properties
    weak var view: MeaningListViewControllerProtocol?
    var interactor: MeaningListInteractorInputProtocol?
    var router: MeaningListRouterProtocol?
}

extension MeaningListPresenter: MeaningListPresenterProtocol {
    
    func viewDidLoad() {
        FindMeaning(meaning: "")
    }
    
    func FindMeaning(meaning: String) {
        interactor?.fetchAcronysm(dataString:meaning)
    }
}

extension MeaningListPresenter: MeaningListInteractorOutputProtocol {
    
    func validateData(dataModel:[MeaningResponse]) {
        if let meaningData = dataModel.first {
            if let lfs = meaningData.lfs {
                if lfs.count > 0 {
                    self.view?.receiveData(data: lfs)
                    return
                }
            }
        }
        self.view?.emptyTable()
    }
    
    func validateError(error: String) {
        self.router?.displayError(errorMessage:error)
    }
}
