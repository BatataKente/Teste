//
//  AvulsaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class SingleBookingViewModel {
    
    private let spaceId: Int
    
    private var reservationArray: [Reservations]
    
    var delegate: SingleBookingViewModelProtocol?
    
    private let timeStacksSize = CGSize(width: CGFloat(120).generateSizeForScreen,
                                        height: CGFloat(60).generateSizeForScreen)
    
    private let sessionManager = SessionManager()
    
    struct TimeStack {
        
        let stack: UIStackView
        let hourLabel: UILabel
    }
    
    private var userUUID: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return "User UUID unavailable"}
        
        return uuid
    }
    
    init(_ spaceId: Int,_ reservationArray: [Reservations]) {
        
        self.spaceId = spaceId
        self.reservationArray = reservationArray
    }
    
    private func createTimeStack(_ title: String?,_ checker: UIButton, hourArray: [String]) -> TimeStack {
        
        delegate?.reduceDropDown()
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(11).generateSizeForScreen)
        titleLabel.textColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        titleLabel.text = title
        
        let hourLabel = UILabel()
        hourLabel.font = UIFont(name: FontsBravve.medium.rawValue,
                                size: CGFloat(15).generateSizeForScreen)
        hourLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
       
        let stackView = UIStackView(arrangedSubviews: [titleLabel, hourLabel])
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        
        let verticalMargins = CGFloat(10).generateSizeForScreen
        let horizontalMargins = CGFloat(10).generateSizeForScreen
        
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins,
                                               left: horizontalMargins,
                                               bottom: verticalMargins,
                                               right: horizontalMargins)
        
        let dropDownButton = UIButton()
        dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
        
        let handler = {(action: UIAction) in
    
            var buttons = [UIButton]()
    
            for time in hourArray {
    
                let button = UIButton()
                button.setTitle(time, for: .normal)
                button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                     for: .normal)
                
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
        
        let entireDayStack = UIStackView(arrangedSubviews: [dayLabel, entireDayButton, entireDayLabel])
        
        dayLabel.constraintInsideTo(.width, entireDayStack, multiplier: 0.65)
        
        let timeLabel = UILabel()
        timeLabel.font = UIFont(name: FontsBravve.medium.rawValue,
                                size: CGFloat(16).generateSizeForScreen)
        timeLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        timeLabel.text = "Horários"
        
        let timesStack = UIStackView()
        timesStack.axis = .vertical
        
        let addtimeButton = UIButton()
        
        var hourInArray: [String] = []
        var hourOutArray: [String] = []
        
        let parameters = HoursParameters(space_id: self.spaceId, date: "\(year)-\(month)-\(day)", start_time: "08:00")
        
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
            
            self.delegate?.changeCollectionViewState()
            
            let handler = {(action: UIAction) in
                
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
                
                let trashHandler = {(action: UIAction) in
                    
                    print("buttonTapped")
                    
                    guard let inHour = timeInStack.hourLabel.text else {
                        print("Unable to find stack")
                        return }
                    
                    var inDate: String {
                        
                        guard let month = Int(month) else { return "" }
                        guard let day = Int(day) else { return "" }
                        if (month < 10 && day < 10) {
                            return "\(year)-0\(month)-0\(day)T\(inHour):00.000Z"
                        } else if month < 10 {
                            return "\(year)-0\(month)-\(day)T\(inHour):00.000Z"
                        } else if day < 10 {
                            return "\(year)-\(month)-0\(day)T\(inHour):00.000Z"
                        } else {
                            return "\(year)-\(month)-\(day)T\(inHour):00.000Z"
                        }
                    }
                    
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
                        }
                        } else {
                            print("Reservation not found")
                        }
                    
                    }
                    
                }
                
                let quitHandler = { (action: UIAction) in
                    
                    timeStack.removeFromSuperview()
                    hourInArray = []
                    hourOutArray = []
                }
                trashButton.addAction(UIAction(handler: trashHandler),
                                      for: .touchUpInside)
                quitButton.addAction(UIAction(handler: quitHandler),
                                     for: .touchUpInside)
                
                let checkHandler = {(action: UIAction) in
                    
                    guard let inHour = timeInStack.hourLabel.text else { return }
                    guard let outHour = timeOutStack.hourLabel.text else { return }
                    
                    if timeInStack.hourLabel.text != nil &&
                       timeOutStack.hourLabel.text != nil {
                        
                        let inDate = "\(year)-\(month)-\(day)T\(inHour):00+0000"
                        let outDate = "\(year)-\(month)-\(day)T\(outHour):00+0000"
                        
                        let dateFormatter = ISO8601DateFormatter()
                        let inDateFormatted = dateFormatter.date(from: inDate)
                        guard let date = inDateFormatted else {
                            print("Invalid indate format")
                            return
                        }
                        let timeInDate = dateFormatter.string(from: date)
                        
                        let outDateFormatted = dateFormatter.date(from: outDate)
                        
                        guard let outDateFormatted = outDateFormatted else {
                            print("Invalid outdate format")
                            return
                        }
                        let timeOutDate = dateFormatter.string(from: outDateFormatted)
                        
                        let parameters = ReservationParameters(uuid: self.userUUID, space_id: self.spaceId, reservation_type_id: 1, reservation_status_id: 1, space_contract_id: 2, rent_qty: 1, start_dt: timeInDate, end_dt: timeOutDate)
                        
                        self.sessionManager.postDataWithResponse(endpoint: .reservations, parameters: parameters) { (statusCode, error, reserve: Reservations?) in
                            print(reserve)
                            guard let reserve = reserve else { return }
                            self.reservationArray.append(reserve)
                            checkButton.isHidden = !checkButton.isHidden
                            trashButton.isHidden = !trashButton.isHidden
                            quitButton.isHidden = !quitButton.isHidden
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
            
            let chosedDayStack = UIStackView(arrangedSubviews: [entireDayStack, timeLabel, timesStack, addtimeButton])
            chosedDayStack.axis = .vertical
            
            stack.addArrangedSubview(chosedDayStack)
        }
    }
}

protocol SingleBookingViewModelProtocol {
    
    func reduceDropDown()
    
    func setupDropDown(_ dropDownButton: UIButton,_ buttons: [UIButton])
    
    func changeCollectionViewState()
}
