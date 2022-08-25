//
//  SitesV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct SiteClassification: Codable {
    var id: Int?
    var name: String?
    var message: String?
}

struct Sites: Codable {
    var id: Int?
    var partner_id: Int?
    var business_name: String?
    var registered_number: String?
    var private_room_qty: Int?
    var meeting_room_qty: Int?
    var shared_desk_qty: Int?
    var classification_id: Int?
    var classification_name: String?
    var address: Address?
    var message: String?
}

struct Address: Codable {
    var street: String?
    var street_number: Int?
    var neiborhood: String?
    var complement: String?
    var postal_code: String?
    var state_id: Int?
    var city_id: Int?
    var latitude: String?
    var longitude: String?
    var message: String?
}

struct Contact: Codable {
    var name: String?
    var email: String?
    var phone_number: String?
    var site_contact_type: Int?
    var id: Int?
    var message: String?
}
