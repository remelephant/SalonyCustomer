//
//  ModelStylist.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelStylist: Decodable {
    var id: Int?
    var name: String?
    var hours: [String: ModelWorkingHours]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case hours = "hours"
    }
}
