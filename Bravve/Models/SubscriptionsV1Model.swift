//
//  SubscriptionsV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct Subscription: Codable {
    var id: Int?
    var name: String?
    var credit_amount: Int?
    var price: Int?
}
