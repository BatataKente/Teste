//
//  ModelPartnersV1.swift
//  TestB
//
//  Created by user220237 on 8/8/22.
//

import Foundation

struct PartnersList: Codable {
    var id: Int?
    var social_name: String?
    var registered_number: String?
    var market_segment: PartnerMarketSegment?
    var company_size: PartnerCompanySize?
    var company_classification: PartnerCompanySize?
    var administrator_partner: AdministratorPartner?
}

struct PartnerMarketSegment: Codable {
    var id: Int?
    var name: String?
}

struct PartnerCompanySize: Codable {
    var id: Int?
    var name: String?
}

struct PartnerCompanyClassification: Codable {
    var id: Int?
    var code: String?
    var name: String?
}

struct AdministratorPartner: Codable {
    var name: String?
    var phone_number: String?
    var email: String?
    var uuid: String?
}



struct PartnersAmount: Codable {
    var amount: Int?
}

struct PartnersFinancial: Codable {
    var id: Int?
    var name: String?
    var position: String?
    var work_email: String?
    var phone_number: String?
    var bank_name: String?
    var bank_branch: String?
    var bank_account: String?
}

struct PartnersContacts: Codable {
    var id: Int?
    var partner_id: Int?
    var name: String?
    var position: String?
    var work_email: String?
    var phone_number: String?
}

struct PartnerDoorLockManufacture: Codable {
    var id: Int?
    var name: Int?
}

struct PartnersDoorlocks: Codable {
    var id: Int?
    var door_lock_serial: Int?
    var door_lock_code: String?
    var door_lock_key: String?
    var door_lock_manufacture: PartnerDoorLockManufacture?
}











