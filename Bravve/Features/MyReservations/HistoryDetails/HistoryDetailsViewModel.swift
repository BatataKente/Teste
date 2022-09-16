//
//  HistoryDetailsViewModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 25/08/22.
//

import Foundation

class HistoryDetailsViewModel {
    
    func getReservation(currentReservation: inout Reservations?) -> Reservations? {
        for reservation in UserReservations.reservationsHistory {
            if reservation.id == UserReservations.reservationHistoryID {
                currentReservation = reservation
            }
        }
        return currentReservation
    }
    
    func getHourString(date: String?) -> String {
        guard let date = date else { return "" }
        
        let separatedDate = date.components(separatedBy: "T")
        let separatedHour = separatedDate[1].components(separatedBy: ":")
        let hourString = "\(separatedHour[0]):\(separatedHour[1])"
        
        return hourString
    }
    
    func getDateString(date: String?) -> String {
        guard let date = date else { return "" }
        
        let separatedDate = date.components(separatedBy: "T")
        let formatDate = separatedDate[0].components(separatedBy: "-")
        let dateString = "\(formatDate[2])/\(formatDate[1])/\(formatDate[0])"
        
        return dateString
    }
    
    func sortBusinessHours(businessHours: inout [SpaceBusinessHours]) {
        businessHours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            
            print(lhs)
            print(rhs)
            return lhsWeekDay < rhsWeekDay
        }
    }
    
    func createBusinessHoursArray(businessHours: [SpaceBusinessHours]) -> [String] {
        
        var textArray: [String] = []
        
        for business_hour in businessHours {

            if business_hour.flag_closed_day != nil {
                if !business_hour.flag_closed_day! {
                    textArray.append("\(business_hour.day_name ?? ""): \(business_hour.start_time ?? "")h - \(business_hour.end_time ?? "")h")
                }
            }
        }
        if !textArray.isEmpty {
            return textArray
        } else {
            return [" "]
        }
       
    }
}
