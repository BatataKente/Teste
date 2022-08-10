//
//  ModelUsersV1.swift
//  TestB
//
//  Created by user220237 on 8/5/22.
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

struct UUID: Codable {
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

struct CreditWallet: Codable {
    var wp_account_id: Int?
    var corporate_name: String?
    var credit_amount: Double?
}

struct ForgotPasswordParameters: Codable {
    var phone_number: String
    var email: String
}

struct ConfirmForgotPasswordParameters: Codable {
    var new_password: String
    var code: String
}

struct LoginParameters: Codable {
    var email: String
    var password: String
}

struct Token: Codable {
    var token: String?
}

struct UserParameters: Codable {
    var name: String
    var phone_number: String
    var email: String
    var password: String
}

struct UpdatePasswordParameters: Codable {
    var previous_password: String
    var new_password: String
}

struct ValidateUserParameter: Codable {
    var code: String
}
	
