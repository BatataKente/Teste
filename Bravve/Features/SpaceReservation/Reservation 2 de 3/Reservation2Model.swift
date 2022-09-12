//
//  Reserva2Model.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

struct ReservationDate: Equatable {
    var day: String
    var hours: [Hour]
    var isEntireDay: Bool
}

struct Hour: Equatable {
    var start_dt: String
    var end_dt: String
    var hour_price: String
    var reservationId: Int
}
