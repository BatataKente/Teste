//
//  TokenModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

public struct AccessToken: Codable {
    var access_token: String
    var message: String?
}
