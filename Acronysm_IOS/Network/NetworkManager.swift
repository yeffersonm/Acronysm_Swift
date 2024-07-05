//
//  NetworkManager.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import Moya
import Foundation

protocol Networkable {
    var provider: MoyaProvider<ApiService> { get }
    func fetchMeanings(acronysm: String, completion: @escaping (Result<[MeaningResponse], Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<ApiService>(plugins: [NetworkLoggerPlugin()])
    
    func fetchMeanings(acronysm: String, completion: @escaping (Result<[MeaningResponse], Error>) -> ()) {
        request(target: .searchMeaning(acronym: acronysm), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: ApiService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
