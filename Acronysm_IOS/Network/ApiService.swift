//
//  ApiService.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit
import Moya

enum ApiService {
    case searchMeaning(acronym: String)
}

extension ApiService: TargetType {
    var baseURL: URL { return URL(string: Environment.baseUrl)! }
    
    var path: String {
        switch self {
        case .searchMeaning(let acrnym):
            return "?sf=" + String(acrnym)
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .searchMeaning:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
