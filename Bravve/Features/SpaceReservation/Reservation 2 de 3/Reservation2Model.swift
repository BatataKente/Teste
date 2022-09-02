//
//  Reserva2Model.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

struct ReservationDate {
    var day: String
    var hours: [Hour]
}

struct Hour {
    var start_dt: String
    var end_dt: String
    var hour_price: String
}
