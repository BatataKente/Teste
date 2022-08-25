//
//  CorporatesV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct CorporatesAmount: Codable {
    var amount: Int?
    var message: String?
}

struct CorporateCompanyMarketSegment: Codable {
    var id: Int?
    var name: String?
    var message: String?
}

struct CorporateCompanySize: Codable {
    var id: Int?
    var name: String?
    var message: String?
}

struct CorporateCompanyClassification: Codable {
    var id: Int?
    var code: String?
    var name: String?
    var message: String?
}

struct CorporateCompanyType: Codable {
    var id: Int?
    var name: String?
    var message: String?
}

struct CorporateAddress: Codable {
    var postal_code: String?
    var street: String?
    var street_number: Int?
    var neighboorhood: String?
    var complement: String?
    var state_id: Int?
    var state_code: String?
    var state_name: String?
    var city_id: Int?
    var city_name: String?
    var message: String?
}

struct CorporateAdministrator: Codable {
    var uuid: String?
    var name: String?
    var phone_number: String?
    var email: String?
    var message: String?
}

struct Corporates: Codable {
    var id: Int?
    var social_name: String?
    var registered_number: String?
    var market_segment: CorporateCompanyMarketSegment?
    var company_size: CorporateCompanySize?
    var company_classification: CorporateCompanyClassification?
    var company_type: CorporateCompanyType?
    var address: CorporateAddress?
    var administrator_corporate: CorporateAdministrator?
    var message: String?
}

struct CorporateFinancial: Codable {
    var id: Int?
    var name: String?
    var position: String?
    var work_mail: String?
    var phone_number: String?
    var bank_name: String?
    var bank_branch: String?
    var bank_account: String?
    var message: String?
}

struct CorporateContacts: Codable {
    var id: Int?
    var name: String?
    var position: String?
    var phone_number: String?
    var mail: String?
    var message: String?
}

struct CorporateEmployees: Codable {
    var uuid: Int?
    var name: String?
    var phone_number: String?
    var mail: String?
    var message: String?
}
