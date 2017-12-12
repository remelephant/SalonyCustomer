//
//  ModelImageMediaData.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelImageMediaData: Decodable {
    var original: String?
    var thump: String?
    var medium: String?
    var large: String?
    
    enum CodingKeys: String, CodingKey {
        case original = "original"
        case thump = "thumb"
        case medium = "medium"
        case large = "large"
    }
}
