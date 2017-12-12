//
//  ModelImage.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelImage: Decodable {
    var id: Int?
    var images: ModelImageMediaData?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "image_urls"
    }
}
