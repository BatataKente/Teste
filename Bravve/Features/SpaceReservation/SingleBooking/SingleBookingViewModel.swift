//
//  AvulsaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol SingleBookingViewModelProtocol {
    
    func deselectCell()
    func reduceDropDown()
    func setupDropDown(_ dropDownButton: UIButton,_ buttons: [UIButton])
    func changeCollectionViewState()
    func getSpaceContractId(spaceContractId: Int)
    func showAlert()
}


class SingleBookingViewModel {
    
    private let spaceId: Int
    
    private var reservationArray: [Reservations]
    
    var delegate: SingleBookingViewModelProtocol?
    
    private let timeStacksSize = CGSize(width: CGFloat(131).generateSizeForScreen,
                                        height: CGFloat(65).generateSizeForScreen)
    
    private let sessionManager = SessionManager()
    
    struct TimeStack {
        
        let stack: UIStackView
        let hourLabel: UILabel
    }
    
    private var userUUID: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return "User UUID unavailable"}
        
        return uuid
    }
    
    private var spaceContractId = 2
    
    private var month = ""
    private var day = ""
    private var year = ""
    private var spaceDetail: SpaceDetail
    
    init(_ spaceId: Int,_ reservationArray: [Reservations], spaceDetail: SpaceDetail) {
        
        self.spaceId = spaceId
        self.reservationArray = reservationArray
        self.spaceDetail = spaceDetail
    }
    
    private func createTimeStack(_ title: String?,_ checker: UIButton, hourArray: [String]) -> TimeStack {
        
        delegate?.reduceDropDown()
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(11).generateSizeForScreen)
        titleLabel.textColor = UIColor(named: ColorsBravve.profileLabel.rawValue)
        titleLabel.text = title
        
        let hourLabel = UILabel()
        hourLabel.font = UIFont(name: FontsBravve.medium.rawValue,
                                size: CGFloat(15).generateSizeForScreen)
        hourLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, hourLabel])
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 8
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        let verticalMargins = CGFloat(10).generateSizeForScreen
        let horizontalMargins = CGFloat(10).generateSizeForScreen
        
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins,
                                               left: horizontalMargins,
                                               bottom: verticalMargins,
                                               right: horizontalMargins)
        
        let dropDownButton = UIButton()
        dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                for: .normal)
        dropDownButton.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        
        let stack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
        stack.isLayoutMarginsRelativeArrangement = true
        
        
        stack.layoutMargins = UIEdgeInsets(top: verticalMargins,
                                           left: horizontalMargins,
                                           bottom: verticalMargins,
                                           right: horizontalMargins)
        
        let handler = {(action: UIAction) in
            
            var buttons = [UIButton]()
            
            for time in hourArray {
                
                let button = UIButton()
                button.setTitle(time, for: .normal)
                button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                     for: .normal)
                button.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
                let handler = {(action: UIAction) in
                    
                    self.delegate?.reduceDropDown()
                    hourLabel.text = time
                }
                
                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                buttons.append(button)
            }
            
            if !hourArray.isEmpty && !checker.isHidden {
                
                self.delegate?.setupDropDown(dropDownButton, buttons)
            }
        }
        
        dropDownButton.addAction(UIAction(handler: handler),
                                 for: .touchUpInside)
        
        return TimeStack(stack: stack,
                         hourLabel: hourLabel)
    }
    
    func setupSchedulesStack (stack: UIStackView,
                              _ day: String,
                              _ month: String,
                              _ year: String) {
        
        self.month = month
        self.day = day
        self.year = year
        
        let dayLabel = UILabel()
        dayLabel.font = UIFont(name: FontsBravve.medium.rawValue,
                               size: CGFloat(16).generateSizeForScreen)
        dayLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        dayLabel.text = "\(day)/\(month)/\(year)"
        dayLabel.textAlignment = .left
        
        let entireDayLabel = UILabel()
        entireDayLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                     size: CGFloat(15).generateSizeForScreen)
        entireDayLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        entireDayLabel.text = "Dia inteiro"
        entireDayLabel.textAlignment = .right
        
        let entireDayButton = UISwitch()
        entireDayButton.onTintColor = UIColor(named: ColorsBravve.blue.rawValue)
        entireDayButton.transform = CGAffineTransform(scaleX: 0.7059, y: 0.645)
        
        let entireDayStack = UIStackView(arrangedSubviews: [dayLabel])
        dayLabel.constraintInsideTo(.width, entireDayStack, multiplier: 0.65)
        dayLabel.constraintInsideTo(.leading, entireDayStack)
        
        let timeLabel = UILabel()
        timeLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                size: CGFloat(14).generateSizeForScreen)
        timeLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        timeLabel.text = "Horários"
        
        let timesStack = UIStackView()
        timesStack.axis = .vertical
        
        let addtimeButton = UIButton()
        
        var hourInArray: [String] = []
        var hourOutArray: [String] = []
        
        let entireDayButtonHandler = { (action: UIAction) in
            if entireDayButton.isOn {
                
                self.spaceContractId = 3
                self.delegate?.getSpaceContractId(spaceContractId: self.spaceContractId)
                
                guard let totalPrice = self.spaceDetail.daily_price else { return }
                
                let inDate = self.convertHour(hour: "01:00", day: day, month: month, year: year)
                let outDate = self.convertHour(hour: "23:00", day: day, month: month, year: year)
                
                let parameters = ReservationParameters(uuid: self.userUUID, space_id: self.spaceId, reservation_type_id: 1, reservation_status_id: 1, space_contract_id: self.spaceContractId, rent_qty: 1, start_dt: inDate, end_dt: outDate)
                
                self.sessionManager.postDataWithResponse(endpoint: .reservations, parameters: parameters) { (statusCode, error, reserve: Reservations?) in
                    guard let reserve = reserve else { return }
                    guard let reservationId = reserve.id else {
                        print(reserve.message as Any)
                        return }
                    
                    self.reservationArray.append(reserve)
                    
                    let reservationDate = ReservationDate(day: "\(day)-\(month)-\(year)", hours: [Hour(start_dt: "01:00", end_dt: "23:00", hour_price: totalPrice, reservationId: reservationId)], isEntireDay: true)
                    
                    ReservationList.reservationList.append(reservationDate)
                    print(ReservationList.reservationList)
                    
                    addtimeButton.isHidden = true
                    timeLabel.isHidden = true
                    
                    let trashButton = UIButton()
                    trashButton.setImage(UIImage(named: "trash"),
                                         for: .normal)
                    
                    let timeInStack = self.createTimeStack("Entrada", trashButton, hourArray: hourInArray)
                    
                    let timeOutStack = self.createTimeStack("Saída", trashButton, hourArray: hourOutArray)
                    
                    timeInStack.hourLabel.text = "01:00"
                    timeOutStack.hourLabel.text = "23:00"
                    
                    let timeStack = UIStackView(arrangedSubviews: [timeInStack.stack, timeOutStack.stack, trashButton])
                    timeStack.distribution = .fillProportionally
                    
                    timeInStack.stack.widthAnchorInSuperview(self.timeStacksSize.width)
                    timeInStack.stack.heightAnchorInSuperview(self.timeStacksSize.height)
                    timeOutStack.stack.widthAnchorInSuperview(self.timeStacksSize.width)
                    timeOutStack.stack.heightAnchorInSuperview(self.timeStacksSize.height)
                    
                    guard let dayFormatted = dayLabel.text?.replacingOccurrences(of: "/", with: "-") else { return }
                    
                    let inHourDay = day
                    let inHourMonth = month
                    let inHourYear = year
                    
                    let trashHandler = {(action: UIAction) in
                        
                        print("buttonTapped")
                        
                        guard let inHour = timeInStack.hourLabel.text else {
                            print("Unable to find stack")
                            return }
                        
                        let inDate = self.convertHour(hour: inHour, day: inHourDay, month: inHourMonth, year: inHourYear)
                        
                        for reservation in self.reservationArray {
                            guard let reservationStartDt = reservation.start_dt else {
                                print("Unable to unwrap start date")
                                return }
                            
                            if reservationStartDt == inDate {
                                
                                guard let reservationId = reservation.id else {
                                    print("Unable to find id")
                                    return }
                                self.sessionManager.deleteData(id: "\(reservationId)", endpoint: .reservationsId) { (statusCode, error) in
                                    
                                    timeStack.removeFromSuperview()
                                    hourInArray = []
                                    hourOutArray = []
                                    for reservation in ReservationList.reservationList {
                                        
                                        if reservation.day == dayFormatted {
                                            
                                            guard let index = ReservationList.reservationList.firstIndex(of: reservation) else {
                                                return }
                                            ReservationList.reservationList.remove(at: index)
                                            print(ReservationList.reservationList)
                                        }
                                    }
                                }
                            } else {
                                print("Reservation not found")
                            }
                            
                            self.spaceContractId = 2
                            self.delegate?.getSpaceContractId(spaceContractId: self.spaceContractId)
                            entireDayButton.isEnabled = true
                            entireDayButton.isOn = false
                            addtimeButton.isHidden = false
                            timeLabel.isHidden = false
                        }
                    }
                    trashButton.addAction(UIAction(handler: trashHandler), for: .touchUpInside)
                    
                    timesStack.addArrangedSubview(timeStack)
                    
                    entireDayButton.isEnabled = false
                    
                    print(self.spaceContractId)
                }
            }
            
        }
        
        entireDayButton.addAction(UIAction(handler: entireDayButtonHandler), for: .valueChanged)
        
        guard let spaceTypeContracts = spaceDetail.space_types_contracts else { return }
        for spaceContract in spaceTypeContracts {
            if spaceContract.id_contract == 3 {
                entireDayStack.addArrangedSubviews([entireDayButton, entireDayLabel])
            }
        }
        
        
        let parameters = HoursParameters(space_id: self.spaceId, date: "\(year)-\(month)-\(day)", start_time: "00:00")
        
        delegate?.changeCollectionViewState()
        
        self.sessionManager.postDataWithArrayResponse(endpoint: .reservationsHours, parameters: parameters) { (statusCode, error, hours: [ReservationHours]?) in
            guard let hours = hours else {
                
                self.delegate?.changeCollectionViewState()
                print(statusCode as Any)
                return
            }
            
            for hour in hours {
                
                guard let hourFlag = hour.flag else {return}
                guard let hourTime = hour.hour else {return}
                
                if hourFlag {
                    
                    guard let timeInt = Int(hourTime.split(separator: ":")[0]) else { return }
                    
                    let timeOut = timeInt + 1
                    hourOutArray.append("\(timeOut):00")
                    hourInArray.append(hourTime)
                    
                }
            }
            
            if hours.isEmpty {
                
                self.delegate?.changeCollectionViewState()
                self.delegate?.showAlert()
                self.delegate?.deselectCell()
                return
            }
            
            self.delegate?.changeCollectionViewState()
            
            let handler = {(action: UIAction) in
                
                var reservationDate = ReservationDate(day: "\(day)-\(month)-\(year)", hours: [], isEntireDay: false)
                
                let trashButton = UIButton()
                trashButton.setImage(UIImage(named: "trash"),
                                     for: .normal)
                trashButton.isHidden = true
                
                let checkButton = UIButton()
                checkButton.setImage(UIImage(named: "checkPink"),
                                     for: .normal)
                
                let timeInStack = self.createTimeStack("Entrada", checkButton, hourArray: hourInArray)
                
                let timeOutStack = self.createTimeStack("Saída", checkButton, hourArray: hourOutArray)
                
                let quitButton = UIButton()
                quitButton.setImage(UIImage(named: "xmarkPink"),
                                    for: .normal)
                
                let timeStack = UIStackView(arrangedSubviews: [timeInStack.stack, timeOutStack.stack, trashButton, checkButton, quitButton])
                timeStack.distribution = .fillProportionally
                
                timeInStack.stack.widthAnchorInSuperview(self.timeStacksSize.width)
                timeInStack.stack.heightAnchorInSuperview(self.timeStacksSize.height)
                timeOutStack.stack.widthAnchorInSuperview(self.timeStacksSize.width)
                timeOutStack.stack.heightAnchorInSuperview(self.timeStacksSize.height)
                
                guard let dayFormatted = dayLabel.text?.replacingOccurrences(of: "/", with: "-") else { return }
                
                let trashHandler = {(action: UIAction) in
                    
                    print("buttonTapped")
                    
                    guard let inHour = timeInStack.hourLabel.text else {
                        print("Unable to find stack")
                        return }
                    
                    let inDate = self.convertHour(hour: inHour, day: day, month: month, year: year)
                    
                    
                    for reservation in self.reservationArray {
                        guard let reservationStartDt = reservation.start_dt else {
                            print("Unable to unwrap start date")
                            return }
                        
                        if reservationStartDt == inDate {
                            
                            guard let reservationId = reservation.id else {
                                print("Unable to find id")
                                return }
                            self.sessionManager.deleteData(id: "\(reservationId)", endpoint: .reservationsId) { (statusCode, error) in
                                
                                timeStack.removeFromSuperview()
                                hourInArray = []
                                hourOutArray = []
                                for var reservation in ReservationList.reservationList {
                                    
                                    if reservation.day == dayFormatted {
                                        
                                        guard let reservationIndex = ReservationList.reservationList.firstIndex(of: reservation) else { return }
                                        for hour in reservation.hours {
                                            if hour.start_dt == inHour {
                                                guard let index = reservation.hours.firstIndex(of: hour) else { return }
                                                reservation.hours.remove(at: index)
                                                ReservationList.reservationList[reservationIndex] = reservation
                                                print(ReservationList.reservationList)
                                            }
                                        }
                                        
                                        if reservation.hours.isEmpty {
                                            guard let index = ReservationList.reservationList.firstIndex(of: reservation) else {
                                                return }
                                            ReservationList.reservationList.remove(at: index)
                                            print(ReservationList.reservationList)
                                        }
                                    }
                                }
                            }
                        } else {
                            print("Reservation not found")
                        }
                        
                    }
                    
                }
                
                let quitHandler = { (action: UIAction) in
                    
                    timeStack.removeFromSuperview()
                    self.delegate?.reduceDropDown()
                }
                trashButton.addAction(UIAction(handler: trashHandler),
                                      for: .touchUpInside)
                quitButton.addAction(UIAction(handler: quitHandler),
                                     for: .touchUpInside)
                
                let checkHandler = {(action: UIAction) in
                    
                    self.spaceContractId = 2
                    
                    guard let inHour = timeInStack.hourLabel.text else { return }
                    guard let outHour = timeOutStack.hourLabel.text else { return }
                    
                    if timeInStack.hourLabel.text != nil &&
                        timeOutStack.hourLabel.text != nil {
                        
                        let inDate = self.convertHour(hour: inHour, day: day, month: month, year: year)
                        let outDate = self.convertHour(hour: outHour, day: day, month: month, year: year)
                        
                        guard let inHourDouble = Double(inHour.split(separator: ":")[0]) else { return }
                        guard let outHourDouble = Double(outHour.split(separator: ":")[0]) else  { return }
                        let totalTime = outHourDouble - inHourDouble
                        guard let hourPrice = Double(self.spaceDetail.hourly_price ?? "0.0") else { return }
                        let totalPrice = totalTime * hourPrice
                        let totalTimeInt = Int(totalTime)
                        let totalPriceString = String(format: "%.2f", totalPrice)
                        
                        let parameters = ReservationParameters(uuid: self.userUUID, space_id: self.spaceId, reservation_type_id: 1, reservation_status_id: 1, space_contract_id: self.spaceContractId, rent_qty: totalTimeInt, start_dt: inDate, end_dt: outDate)
                        
                        self.sessionManager.postDataWithResponse(endpoint: .reservations, parameters: parameters) { (statusCode, error, reserve: Reservations?) in
                            guard let reserve = reserve else { return }
                            guard let reservationId = reserve.id else {
                                print(reserve.message as Any)
                                return }
                            self.reservationArray.append(reserve)
                            
                            var hasReservation = false
                            
                            reservationDate.hours.append(Hour(start_dt: inHour, end_dt: outHour, hour_price: totalPriceString, reservationId: reservationId))
                            
                            if ReservationList.reservationList.isEmpty {
                                ReservationList.reservationList.append(reservationDate)
                                hasReservation = true
                            } else {
                                for var reservation in ReservationList.reservationList {
                                    if reservation.day == reservationDate.day {
                                        guard let reservationIndex = ReservationList.reservationList.firstIndex(of: reservation) else { return }
                                        reservation.hours.append(Hour(start_dt: inHour, end_dt: outHour, hour_price: totalPriceString, reservationId: reservationId))
                                        ReservationList.reservationList[reservationIndex] = reservation
                                        hasReservation = true
                                    }
                                }
                            }
                            
                            if !hasReservation {
                                ReservationList.reservationList.append(reservationDate)
                                hasReservation = true
                            }
                            
                            checkButton.isHidden = !checkButton.isHidden
                            trashButton.isHidden = !trashButton.isHidden
                            quitButton.isHidden = !quitButton.isHidden
                            print(ReservationList.reservationList)
                        }
                    }
                }
                
                checkButton.addAction(UIAction(handler: checkHandler),
                                      for: .touchUpInside)
                
                timesStack.addArrangedSubview(timeStack)
            }
            
            addtimeButton.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            addtimeButton.setTitle("+ Adicionar horário", for: .normal)
            addtimeButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                        for: .normal)
            addtimeButton.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: 16)
            let chosedDayStack = UIStackView(arrangedSubviews: [entireDayStack, timeLabel, timesStack, addtimeButton])
            chosedDayStack.axis = .vertical
            
            stack.addArrangedSubview(chosedDayStack)
        }
    }
    
    func convertHour(hour: String, day: String, month: String, year: String) -> String {
        guard let month = Int(month) else { return "" }
        guard let day = Int(day) else { return "" }
        if (month < 10 && day < 10) {
            return "\(year)-0\(month)-0\(day)T\(hour):00.000Z"
        } else if month < 10 {
            return "\(year)-0\(month)-\(day)T\(hour):00.000Z"
        } else if day < 10 {
            return "\(year)-\(month)-0\(day)T\(hour):00.000Z"
        } else {
            return "\(year)-\(month)-\(day)T\(hour):00.000Z"
        }
    }
}
