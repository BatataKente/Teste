//
//  SpacesV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct SpaceType: Codable {
    var id: Int?
    var name: String?
}

struct SpaceClassification: Codable {
    var id: Int?
    var name: String?
}

struct SpaceCategory: Codable {
    var id: Int?
    var name: String?
}

struct SpaceFacility: Codable {
    var id: Int?
    var name: String?
}

struct SpaceNoise: Codable {
    var id: Int?
    var name: String?
}

struct SpaceContract: Codable {
    var id_contract: Int?
    var name_contracts: String?
}

struct SpaceBusinessHours: Codable {
    var week_day: Int?
    var day_name: String?
    var start_time: String?
    var end_time: String?
    var flag_closed_day: Bool?
}

struct Door: Codable {
    var door_id: Int?
    var door_type: Int?
    var door_lock_serial: String?
    var door_lock_code: String?
    var door_lock_key: String?
    var door_lock_manufacture: DoorLockManufacture?
}

struct DoorLockManufacture: Codable {
    var id: Int?
    var name: String?
}

struct PartnerSiteAddress: Codable {
    var address_id: Int?
    var business_name: String?
    var address: PartnerAddress?
}

struct PartnerAddress: Codable {
    var street: String?
    var street_number: Int?
    var neighborhood: String?
    var complement: String?
    var postal_code: String?
    var state_id: Int?
    var state_name: String?
    var city_id: Int?
    var city_name: String?
    var latitude: String?
    var longitude: String?
}

struct SpaceContact: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
}

struct SpacePicture: Codable {
    var id: Int?
    var space_id: Int?
    var picture_uuid: String?
    var name: String?
    var url: String?
    var is_cover_photo: Bool?
}

struct SpaceDetail: Codable {
    var id: Int?
    var local_name: String?
    var space_name: String?
    var slogan: String?
    var description: String?
    var size_mt2: Int?
    var seats_qty: Int?
    var allow_half_slot: Bool?
    var favorite_space: Bool?
    var hourly_price: String?
    var daily_price: String?
    var monthly_price: String?
    var allow_workpass: Bool?
    var hourly_credits: String?
    var daily_credits: String?
    var monthly_credits: String?
    var is_active: Bool?
    var has_qrcode: Bool?
    var partner_site_id: Int?
    var space_category: SpaceCategory?
    var space_type: SpaceType?
    var space_classification: SpaceClassification?
    var space_noise_level: SpaceNoise?
    var space_facilities: [SpaceFacility]?
    var space_business_hours: [SpaceBusinessHours]?
    var space_types_contracts: [SpaceContract]?
    var doors: [Door]?
    var partner_site_address: PartnerSiteAddress?
    var contact: [SpaceContact]?
    var pictures: [SpacePicture]?
}

struct Space: Codable {
    var id: Int?
    var seats_qty: Int?
    var space_name: String?
    var local_name: String?
    var slogan: String?
    var description: String?
    var hourly_price: String?
    var daily_price: String?
    var monthly_price: String?
    var allow_workpass: Bool?
    var hourly_credits: String?
    var daily_credits: String?
    var monthly_credits: String?
    var is_active: Bool?
    var favorite_space: Bool?
    var partner_site_id: Int?
    var partner_site_address: PartnerSiteAddress?
    var space_category: SpaceCategory?
    var space_type: SpaceType?
    var space_classification: SpaceClassification?
    var space_noise_level: SpaceNoise?
    var space_pictures: [SpacePicture]?
}

struct SpaceListParameters: Codable {
    var space_state_id: Int?
    var space_city_id: Int?
    var allow_workpass: Bool?
    var seats_qty: Int?
    var space_type_id: Int?
    var space_classification_id: Int?
    var space_category_id: Int?
    var space_facilities_id: [Int]?
    var space_noise_level_id: Int?
    var space_contract_Type: Int?
}

struct SpaceFavoriteParameters: Codable {
    var space_id: Int
    var uuid: String
}
