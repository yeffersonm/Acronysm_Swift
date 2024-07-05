//
//  MeaningListInteractor.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//  
//

import Foundation

class MeaningListInteractor: MeaningListInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: MeaningListInteractorOutputProtocol?
    var networkManager: NetworkManager = NetworkManager()
    
    func fetchAcronysm(dataString: String) {
        networkManager.fetchMeanings(acronysm: dataString.isEmpty ? "OMG" : dataString) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.presenter?.validateData(dataModel: model)
                }
            case .failure(let error):
                self?.presenter?.validateError(error: error.localizedDescription)
            }
        }
    }
    
}
