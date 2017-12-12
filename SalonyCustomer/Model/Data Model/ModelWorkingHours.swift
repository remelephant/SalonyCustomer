//
//  ModelWorkingHours.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelWorkingHours: Decodable {
    var to: String?
    var from: String?
    
    enum CodingKeys: String, CodingKey {
        case to = "to"
        case from = "from"
    }
}
