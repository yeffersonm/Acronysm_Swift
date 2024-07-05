//
//  Enviroment.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 2/07/24.
//


import UIKit

public enum Environment {
    
    enum Keys {
        enum Plist {
            static let baseURL = "URLBASE"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static var baseUrl: String {
        guard let baseUrl = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist file for this environment")
        }
        return baseUrl
    }
    
}
