//
//  MeaningListEntity.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit

struct MeaningResponse: Codable {
    let lfs: [LfsResp]?
}

struct LfsResp: Codable {
    let lf: String?
    let freq: Int?
    let since: Int?
    let vars: [VarLfs]?
}

struct VarLfs: Codable {
    let lf: String?
    let freq: Int?
    let since: Int?
}
