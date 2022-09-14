//
//  ReservationsV1Model.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 09/08/22.
//

import Foundation

struct Reservations: Codable, Equatable {
    var id: Int?
    var uuid: String?
    var space_id: Int?
    var space_name: String?
    var local_name: String?
    var slogan: String?
    var description: String?
    var seats_qty: Int?
    var space_category: SpaceCategory?
    var space_type: SpaceType?
    var space_classification: SpaceClassification?
    var space_noise_level: SpaceNoise?
    var reservation_type_id: Int?
    var reservation_status_id: Int?
    var reservation_status_name: String?
    var space_contract_id: Int?
    var space_contract_name: String?
    var rent_qty: Int?
    var start_dt: String?
    var end_dt: String?
    var checkin_ts: String?
    var checkout_ts: String?
    var payment_type_id: Int?
    var payment_type_name: String?
    var payment_amount: String?
    var space_contact: SpaceContact?
    var picture: [SpacePicture]?
    var space_address: SpaceAddress?
    var message: String?
}

struct ReservationsListaParameter: Codable {
    var queryType: String
}

struct SpaceAddress: Codable, Equatable {
    var street: String?
    var street_number: Int?
    var neighborhood: String?
    var complement: String?
    var postal_code: String?
    var state_name: String?
    var city_name: String?
    var message: String?
}

struct HoursParameters: Codable {
    var space_id: Int
    var date: String
    var start_time: String
}

struct ReservationHours: Codable {
    var hour: String?
    var flag: Bool?
    var message: String?
}

struct ReservationParameters: Codable {
    var uuid: String
    var space_id: Int
    var reservation_type_id: Int
    var reservation_status_id: Int
    var space_contract_id: Int
    var rent_qty: Int
    var start_dt: String
    var end_dt: String
}

struct UpdateReservationParameters: Codable {
    var id: Int
    var uuid: String
    var space_id: Int
    var reservation_type_id: Int
    var reservation_status_id: Int
    var space_contract_id: Int
    var rent_qty: Int
    var start_dt: String
    var end_dt: String
    var bill_items: BillItems
}

struct UpdatedReservation: Codable {
    var id: Int?
    var uuid: String?
    var space_id: Int?
    var reservation_type_id: Int?
    var reservation_status_id: Int?
    var space_contract_id: Int?
    var rent_qty: Int?
    var start_dt: String?
    var end_dt: String?
    var bill_items: BillItems?
    var message: String?
}


struct BillItems: Codable {
    var id: Int
    var reservation_id: Int
    var gross_amont: Double
    var net_amont: Double
    var payment_id: Int
    var message: String?
}

struct CancelReservationParameters: Codable {
    var uuid: String
    var reservations_id: [Int]
}

struct RegisterCheckinParameters: Codable {
    var uuid: String
    var reservation_id: Int
    var checkin_ts: String
}

struct RegisterCheckoutParameters: Codable {
    var uuid: String
    var reservation_id: Int
    var checkout_ts: String
}

struct OpenDoorLockParameters: Codable {
    var uuid: String
    var reservation_id: Int
    var space_id: Int
    var door_lock_type_id: Int
}

struct ReservationPaymentParameters: Codable {
    var reservations_id: [Int]
    var card_payment: CardPayment
}

struct CardPayment: Codable {
    var card_number: String
    var card_expiration: String
    var card_security_code: String
    var holder_name: String
    var holder_document: String
    var charged_amount: Double
    var country_code: String
    var message: String?
}

struct WorkPassPaymentParameters: Codable {
    var reservations_id: [Int]
    var wp_account_id: Int
}

struct PaymentSummary: Codable {
    var wp_account: WPAccount?
    var space_address: SpaceAddress?
    var space_name: String?
    var local_name: String?
    var slogan: String?
    var description: String?
    var space_facilities: [SpaceFacility]?
    var message: String?
}

struct WPAccount: Codable {
    var wp_account_id: Int?
    var corporate_business_name: String?
    var credit_amount: Double?
    var wp_account_type_id: Int?
    var wp_account_type_name: String?
    var message: String?
}
