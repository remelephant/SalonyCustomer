//
//  ModelSalon.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelSalon: Decodable {
    
    var id: Int64?
    var name: String?
    var block: String?
    var avenue: String?
    var street: String?
    var building: String?
    var province: String?
    var area: String?
    var country: String?
    var locationInstructions: String?
    var zipCode: String?
    var isFavorite: Bool?
    var isHome: Bool?
    var phone: String?
    var description: String?
    var instagram: String?
    var website: String?
    var longitude: Double?
    var latitude: Double?
    var minPrice: String?
    var url: String?
    var hidden: Bool?
    var type: Int?
    var profileImages: ModelImageMediaData?


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case block = "block"
        case avenue = "avenue"
        case street = "street"
        case building = "building"
        case province = "province"
        case area = "area"
        case country = "country"
        case locationInstructions = "location_instructions"
        case zipCode = "zip_code"
        case isFavorite = "is_favorite"
        case isHome = "is_home"
        case phone = "phone"
        case description = "description"
        case instagram = "instagram"
        case website = "website"
        case longitude = "lng"
        case latitude = "lat"
        case minPrice = "min_price"
        case url = "url"
        case hidden = "hidden"
        case type = "type"
        case profileImages = "profile_image_urls"
    }
}
