//
//  ReservaFinalizadaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol ReservationCompletedViewModelProtocol {
    func changeUserNameTo(_ name: String)
    func goToNextScreen()
}

class ReservationCompletedViewModel {
    
    let sessionManager = APIService()
    
    var delegate: ReservationCompletedViewModelProtocol?
    
    //MARK: - createLabel
    func createLabel(placeHolderValue text: String) -> UILabel {
        let createLabel = UILabel()
        createLabel.font = UIFont(name: "Ubuntu-Regular", size: CGFloat(12).generateSizeForScreen)
        createLabel.text = text
        createLabel.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        createLabel.textColor = UIColor(named: ColorsBravve.white_white.rawValue)
        createLabel.adjustsFontSizeToFitWidth = true
        return createLabel
    }
    
    func getUserName() {
        
        guard let userUUID = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to unwrap user UUID")
            return
        }
        
        sessionManager.getData(uuid: userUUID, endpoint: .usersUuid) { (statusCode, error, user: User?) in
            guard let userName = user?.name else {
                print("Unable to unwrap username")
                return
            }
            
            let firstName = String(userName.split(separator: " ")[0])
            self.delegate?.changeUserNameTo(firstName)
        }
    }
    
    func getSpaceFacilities(spaceDetails: SpaceDetail?) -> [String] {
        guard let facilities = spaceDetails?.space_facilities else {
            print("Unable to unwrap space facilities")
            return []
        }
        var facilitiesArray: [String] = []
        
        for facility in facilities {
            guard let facilityName = facility.name else {
                print("Unable to unwrap facility name")
                return []
            }
            facilitiesArray.append(facilityName)
        }
        
        return facilitiesArray
    }
    
    func getDayOfTheWeek(_ date: String, format: String) -> String? {
        
        let weekDays = [
                "Domingo",
                "Segunda",
                "Terça",
                "Quarta",
                "Quinta",
                "Sexta",
                "Sábado"
            ]

            let formatter  = DateFormatter()
            formatter.dateFormat = format
            guard let myDate = formatter.date(from: date) else { return nil }
            
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDay = myCalendar.component(.weekday, from: myDate)
            
            
            return weekDays[weekDay-1]
    }
    
    func getReservationArray() -> [String] {
        var schedulingArray: [String] = []
        for reservation in ReservationList.reservationList {
            guard let dayOfTheWeek = getDayOfTheWeek(reservation.day, format: "dd-MM-yyyy") else {
                print("unable to get the day of the week")
                return []
            }
            for hour in reservation.hours {
                schedulingArray.append("\(dayOfTheWeek): \(hour.start_dt)h - \(hour.end_dt)h")
            }
        }
        return schedulingArray
    }
    
    func updateReservationList() {
        sessionManager.getDataArray(endpoint: .reservationsOpen) { (statusCode, error, openReservations: [Reservations]?) in
           
            guard let openReservations = openReservations else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            UserReservations.reservations = openReservations
            
            ReservationList.reservationList = []
            
            self.delegate?.goToNextScreen()
        }
    }
    
}
