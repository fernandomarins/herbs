//
//  HerbModel.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Foundation

struct Herbs: Codable {
    let herbs: [HerbModel]
}

struct HerbModel: Codable {
    let name: String
    let scientificName: String
    let properties: String
    let doses: String
    let functions: String
}
