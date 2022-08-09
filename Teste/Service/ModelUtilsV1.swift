//
//  ModelUtilsV1.swift
//  TestB
//
//  Created by user220237 on 8/5/22.
//

import Foundation

struct UtilsStates: Codable {
     var id: Int?
     var code: String?
     var name: String?
}

struct Cities: Codable {
     var id: Int?
     var name: String?
}

struct MarketSegments: Codable {
     var id: Int?
     var name: String?
}

struct CompanySizes: Codable {
     var id: Int?
     var name: String?
}

struct CompanyClassifications: Codable {
     var id: Int?
     var code: String?
     var name: String?
}

struct phoneNumber: Codable {
     var name: String?
     var phone_number: String?
     var email: String?
     var uuid: String?
     var is_active: Bool?
     var is_superuser: Bool?
}

