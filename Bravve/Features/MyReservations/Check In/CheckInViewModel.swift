//
//  CheckInViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

protocol CheckInViewModelProtocol {
    func showCheckinAlert()
    func showCheckinAlertFail(message: String)
}

class CheckInViewModel {
    
    var delegate: CheckInViewModelProtocol?
    
    private let sessionManager = SessionManager()
    
    func makeCheckin() {
        
        guard let userUUID = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to unwrap user UUID.")
            return
        }
        
        guard let reservationID = UserReservations.reservationID else {
            print("Unable to unwrap reservation id.")
            return
        }
        
        let checkInDate = Date()
        let formatter = ISO8601DateFormatter()
        let checkInTs = formatter.string(from: checkInDate)
        
//        let mockCheckInTs = "2022-09-12T14:00:00.000Z"
        
        let parameters = RegisterCheckinParameters(uuid: userUUID, reservation_id: reservationID, checkin_ts: checkInTs)
        
        sessionManager.postDataWithResponse(endpoint: .reservationsCheckins, parameters: parameters) { (statusCode, error, message: CheckInResponseMessage?) in
            guard let statusCode = statusCode else {
                print("Unable to unwrap statusCode")
                return
            }
            
            if statusCode == 204 {
                
                for reservation in UserReservations.reservations {
                    if reservation.id == reservationID {
                        guard let index = UserReservations.reservations.firstIndex(of: reservation) else {
                            print("Unable to unwrap reservation index.")
                            return
                        }
                        
                        UserReservations.reservations[index].checkin_ts = checkInTs
                    }
                }
                self.delegate?.showCheckinAlert()
            } else {
                
                guard let message = message?.message else {
                    print("Unable to unwrap message")
                    return
                }

                self.delegate?.showCheckinAlertFail(message: message)
            }

        }
    }
}
