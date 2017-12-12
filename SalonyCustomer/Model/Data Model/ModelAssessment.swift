//
//  ModelAssessment.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelAssessment {
    var levelOfService: Int?
    var arrivalOnTime: Int?
    var prices: Int?
    var cleanliness: Int?
    
    enum CodingKeys: String, CodingKey {
        case levelOfService = "level_of_service"
        case arrivalOnTime = "arrival_on_time"
        case prices = "prices"
        case cleanliness = "cleanliness"
    }
}
