//
//  LoginModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

struct ForgotPasswordParameters: Codable {
    var phone_number: String
    var email: String
}

struct ConfirmForgotPasswordParameters: Codable {
    var email: String
    var new_password: String
    var code: String
}

struct LoginParameters: Codable {
    var email: String
    var password: String
}

struct Token: Codable {
    var token: String?
    var message: String?
}
