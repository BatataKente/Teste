//
//  ModelReservationsV1.swift
//  TestB
//
//  Created by user220237 on 8/8/22.
//

import Foundation

struct Reservations: Codable {
    var id: Int?
    var uuid: String?
    var space_id: Int?
    var reservation_type_id: Int?
    var reservation_status_id: Int?
    var space_contract_id: Int?
    var rent_qty: Int?
    var start_dt: String?
    var end_dt: String?
}
