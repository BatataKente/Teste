//
//  CheckOutViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

protocol CheckOutViewModelProtocol {
    func showSuccessAlert()
    func showFailAlert(message: String)
}

class CheckOutViewModel {
    
    private let sessionManager = SessionManager()
    
    var delegate: CheckOutViewModelProtocol?
    
    func makeCheckOut() {
        
        guard let userUUID = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to unwrap user UUID")
            return
        }
        
        guard let reservationID = UserReservations.reservationID else {
            print("Unable to unwrap reservation id")
            return
        }
        
        let checkOutDate = Date()
        let formatter = ISO8601DateFormatter()
        let checkOutTs = formatter.string(from: checkOutDate)
        
        let parameters = RegisterCheckoutParameters(uuid: userUUID, reservation_id: reservationID, checkout_ts: checkOutTs)
        
        sessionManager.postDataWithResponse(endpoint: .reservationsCheckouts, parameters: parameters) { (statusCode, error, message: CheckOutErrorMessage?) in
            
            guard let statusCode = statusCode else {
                print("Unable to unwrap statusCode")
                return
            }
            
            if statusCode == 204 {
                self.delegate?.showSuccessAlert()
            } else {
                guard let message = message?.message else {
                    print("Unable to unwrap error message.")
                    return
                }
                self.delegate?.showFailAlert(message: message)
            }

        }
        
        sessionManager.getDataArray(endpoint: .reservationshistory){ (statusCode, error, openReservations: [Reservations]?) in

            guard let openReservations = openReservations else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            UserReservations.reservationsHistory = openReservations
        }
    }
    
    func openDoor() {
        guard let userUUID = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to unwrap user uuid")
            return
        }
        
        guard let reservationID = UserReservations.reservationID else {
            print("Unable to unwrap reservation id")
            return
        }
        
        guard let spaceID = UserReservations.spaceDetail?.id else {
            print("Unable to unwrap space id")
            return
        }
        
        guard let doors = UserReservations.spaceDetail?.doors else {
            print("Unable to unwrap doors array")
            return
        }
        
        if !doors.isEmpty {
            guard let doorId = doors[0].door_id else {
                print("Unable to unwrap door_id")
                return
            }
            
            let parameters = OpenDoorLockParameters(uuid: userUUID, reservation_id: reservationID, space_id: spaceID, door_lock_type_id: doorId)
            
            sessionManager.postDataWithResponse(endpoint: .reservationsDoorlocks, parameters: parameters) { (statusCode, error, message: CheckOutErrorMessage?) in
                
                guard let statusCode = statusCode else {
                    print("Unable to unwrap status code")
                    return
                }
                
                if statusCode == 204 {
                    print("Door opened!")
                } else {
                    guard let errorMessage = message?.message else {
                        print("Unable to unwrap error message")
                        return
                    }
                    print(errorMessage)

                }

            }
        }
        
        
                
    }
    
    func getReservation(currentReservation: inout Reservations?) -> Reservations? {
        for reservation in UserReservations.reservations {
            if reservation.id == UserReservations.reservationID {
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
