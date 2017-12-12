//
//  ModelSalonCollection.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelSalonCollection: Decodable {
    var salons: [ModelSalon]?
    
    enum CodingKeys: String, CodingKey {
        case salons = "salons"
    }
}
