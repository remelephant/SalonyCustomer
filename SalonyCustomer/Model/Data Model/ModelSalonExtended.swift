//
//  ModelSalonExtended.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class ModelSalonExtended: Decodable {
    
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
    
    // extended Salon model
    var id: Int?
    var hours: [String: ModelWorkingHours]?
    var created: String?
    var updated: String?
    var completed: Bool?
    var depositPercent: String?
    var depositFixed: String?
    var bookingAlertEnabled: Bool?
    var reviewsArePrivate: Bool?
    var distanceMeasureIsTime: Bool?
    var homeServiceTravelFeeEnabled: Bool?
    var homeServiceMinAppointmentPriceEnabled: Bool?
    var timeslotStap: Int?
    var leadTime: Int?
    var reviewsCount: Int?
    var provinceID: Int?
    var areaID: Int?
    var rating: Double?
//    var assessmentFields: ModelAssessment?
    var services: [ModelService]?
//    var stylists: [ModelStylist]
    
    enum CodingKeys: String, CodingKey {
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
        
        // Extended
        case id = "id"
        case hours = "hours"
        case created = "created_at"
        case updated = "updated_at"
        case completed = "completed"
        case depositPercent = "deposit_percent"
        case depositFixed = "deposit_fixed"
        case bookingAlertEnabled = "booking_alert_enabled"
        case reviewsArePrivate = "reviews_are_private"
        case distanceMeasureIsTime = "distance_measure_is_time"
        case homeServiceTravelFeeEnabled = "home_service_travel_fee_enabled"
        case homeServiceMinAppointmentPriceEnabled = "home_service_min_appointment_price_enabled"
        case timeslotStap = "timeslot_step"
        case leadTime = "lead_time"
        case reviewsCount = "reviews_count"
        case provinceID = "province_id"
        case areaID = "area_id"
        case rating = "rating"
//        case assessmentFields = "assessment_fields"
        case services = "services"
//        case stylists = "stylists"
    }
}
