//
//  ModelService.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelService: Decodable {
    var id: Int?
    var name: String?
    var price: String?
    var duration: Int?
    var isHome: Bool?
    var categoryName: String?
    var description: String?
    var stylists: [ModelStylist]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case duration = "duration"
        case isHome = "is_home"
        case categoryName = "category_name"
        case description = "description"
        case stylists = "stylists"
    }
}
