//
//  UtilsV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct UtilsStates: Codable {
     var id: Int?
     var code: String?
     var name: String?
     var message: String?
}

struct Cities: Codable {
     var id: Int?
     var name: String?
     var message: String?
}

struct MarketSegments: Codable {
     var id: Int?
     var name: String?
     var message: String?
}

struct CompanySizes: Codable {
     var id: Int?
     var name: String?
     var message: String?
}

struct CompanyClassifications: Codable {
     var id: Int?
     var code: String?
     var name: String?
     var message: String?
}

struct phoneNumber: Codable {
     var name: String?
     var phone_number: String?
     var email: String?
     var uuid: String?
     var is_active: Bool?
     var is_superuser: Bool?
     var message: String?
}

