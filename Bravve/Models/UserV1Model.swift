//
//  UserV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct Hobbies: Codable {
    var hobbie: Int?
    var name: String?
}

struct Interests: Codable {
    var interest: Int?
    var name: String?
}

struct Occupations: Codable {
    var occupation: Int?
    var name: String?
}

struct WorkModels: Codable {
    var id: Int?
    var name: String?
}

struct Amount: Codable {
    var amount: Int?
}

struct User: Codable {
    var name: String?
    var phone_number: String?
    var email: String?
    var is_active: Bool?
    var is_superuser: Bool?
    var occupation: Occupations?
    var work_model: WorkModels?
    var hobbies: [Hobbies]?
    var interests: [Interests]?
    var uuid: String?
}

struct Pictures: Codable {
    var uuid: String?
    var picture: String?
    var name: String?
    var description: String?
    var is_active: Bool?
}

struct UploadPicture: Codable {
    var uuid: String?
    var filename: String?
    var content_type: String?
}

struct CreditWallet: Codable {
    var wp_account_id: Int?
    var corporate_name: String?
    var credit_amount: Double?
}

struct UserParameters: Codable {
    var name: String
    var phone_number: String
    var email: String
    var password: String
}

struct UpdateUserParameters: Codable {
    var name: String
    var phone_number: String
    var email: String
    var is_active: Bool
    var is_superuser: Bool
    var occupation: Occupations
    var work_model: WorkModels
    var hobbies: [Hobbies]
    var interests: [Interests]
}

struct UpdatePasswordParameters: Codable {
    var previous_password: String
    var new_password: String
}

struct ValidateUserParameter: Codable {
    var code: String
}
    
