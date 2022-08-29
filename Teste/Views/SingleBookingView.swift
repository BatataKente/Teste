//
//  AvulsaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//


import UIKit

class SingleBookingView: UIViewController {
    
    struct TimeStack {
        
        let stack: UIStackView
        let hourLabel: UILabel
    }
    
    private let sessionManager = SessionManager()
    
    private var theme = MyTheme.light
    private var capacityNumber: Int {
        guard let seats_qty = spaceDetails.seats_qty else { return 0 }
        return seats_qty
    }
    private let dropDownHeight = CGFloat(160).generateSizeForScreen
    private let timeStacksSize = CGSize(width: CGFloat(120).generateSizeForScreen,
                                        height: CGFloat(60).generateSizeForScreen)
    private let spaceDetails: SpaceDetail
    
    private let spaceId: Int
    
    private var reservationArray: [Reservations]
    
    private var userUUID: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return "User UUID unavailable"}
        
        return uuid
    }
    
    init(_ spaceDetails: SpaceDetail, spaceId: Int) {
        self.spaceDetails = spaceDetails
        
        self.spaceId = spaceId
        
        self.reservationArray = []
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var  buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.walletGray.rawValue, IconsBravve.calendarBlue.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditGray.rawValue])
        
        return buttons
    }()
    
    private lazy var schedulesStack: UIStackView = {
        
        let schedulesStack = UIStackView()
        schedulesStack.axis = .vertical
        
        return schedulesStack
    }()
    
    private let daysChoiceLabel: UILabel = {
        
       let daysChoiceLabel = UILabel()
        daysChoiceLabel.text = "Escolha dia e hora"
        daysChoiceLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        daysChoiceLabel.textAlignment = .left
        return daysChoiceLabel
    }()
    
    private lazy var capacityLabel: UILabel = {
        
       let capacityLabel = UILabel()
        capacityLabel.text = "Capacidade: \(capacityNumber) pessoas"
        capacityLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        capacityLabel.textAlignment = .left
        
        return capacityLabel
    }()
    
    private let lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = .gray
        
        return lineView
    }()
    
    private lazy var calendarView: CalendarView = {
        
        let calendarView = CalendarView(theme: MyTheme.dark)
        calendarView.delegate = self
        
        return calendarView
    }()
    
    private lazy var bodyScrollView: UIScrollView = {
        
        let bodyScrollView = UIScrollView()
        bodyScrollView.delegate = self
        
        return bodyScrollView
    }()
    
    private let viewToScroll: UIView = {
        
        let viewToScroll = UIView()
        return viewToScroll
    }()
    
    private lazy var dropDown: UIScrollView = {
        
        let dropDown = UIScrollView()
        dropDown.delegate = self
        
        return dropDown
    }()
    
    private let nextButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor = Style.bgColor
        view.addSubviews([bodyScrollView, nextButton])
        bodyScrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([calendarView, daysChoiceLabel, capacityLabel, lineView, schedulesStack, dropDown])
        self.nextButton.setToBottomButtonKeyboardDefault("Próxima Etapa", backgroundColor: .buttonPink)
        
        nextButton.addTarget(nil, action: #selector(nextTarget),
                             for: .touchUpInside)
        
        self.view.setToDefaultBackgroundColor()
        
        view.createReservationCustomBarAPI(spaceName: spaceDetails.space_name, localName: spaceDetails.local_name, imageURL: spaceDetails.pictures?[0].url, progressBarButtons: buttons) { _ in
            
            self.dismiss(animated: true)
        }
        
        calendarView.constraintInsideTo(.top, viewToScroll, 44)
        calendarView.constraintInsideTo(.leading, viewToScroll, 40)
        calendarView.constraintInsideTo(.trailing, viewToScroll, 40)
        calendarView.heightAnchorInSuperview(338)

        bodyScrollView.constraintInsideTo(.top, view, 220)
        bodyScrollView.constraintInsideTo(.leading, view)
        bodyScrollView.constraintInsideTo(.trailing, view)
        bodyScrollView.constraintOutsideTo(.bottom, nextButton)
        
        viewToScroll.constraintInsideTo(.top, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, bodyScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, bodyScrollView.frameLayoutGuide)
    
        daysChoiceLabel.constraintInsideTo(.top, viewToScroll)
        daysChoiceLabel.constraintInsideTo(.leading, viewToScroll, 20)
        daysChoiceLabel.constraintInsideTo(.trailing, viewToScroll, 20)
        
        capacityLabel.constraintOutsideTo(.top, calendarView, 54)
        capacityLabel.constraintInsideTo(.leading, daysChoiceLabel)
        capacityLabel.constraintInsideTo(.trailing, daysChoiceLabel)

        lineView.constraintOutsideTo(.top, capacityLabel, 24)
        lineView.constraintInsideTo(.leading, daysChoiceLabel)
        lineView.constraintInsideTo(.trailing, daysChoiceLabel)
        lineView.heightAnchorInSuperview(1)
        
        schedulesStack.constraintOutsideTo(.top, lineView, 24)
        schedulesStack.constraintInsideTo(.leading, lineView)
        schedulesStack.constraintInsideTo(.trailing, lineView)
        schedulesStack.constraintInsideTo(.bottom, viewToScroll, dropDownHeight)
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        calendarView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func nextTarget() {
        
        let reservation2View = Reservation2View()
        reservation2View.modalPresentationStyle = .fullScreen
        
        self.present(reservation2View, animated: true)
    }
    
    private func createTimeStack(_ title: String?,_ checker: UIButton, hourArray: [String]) -> TimeStack {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        
        let hourLabel = UILabel()
       
        let stackView = UIStackView(arrangedSubviews: [titleLabel, hourLabel])
        stackView.axis = .vertical
        
        let dropDownButton = UIButton()
        dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
        
        let handler = {(action: UIAction) in
            
            let dropDownButtonCenter = self.schedulesStack.convert(dropDownButton.center, from: dropDownButton.superview)
    
            var buttons = [UIButton]()
    
            for time in hourArray {
    
                let button = UIButton()
                button.setTitle(time, for: .normal)
                button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                     for: .normal)
                
                let handler = {(action: UIAction) in
                    
                    self.dropDown.frame.size = .zero
                    hourLabel.text = time
                }
    
                button.addAction(UIAction(handler: handler), for: .touchUpInside)
    
                buttons.append(button)
            }
            
            if !hourArray.isEmpty && !checker.isHidden {
                
                self.dropDown.turnIntoAList(buttons)
                
                self.dropDown.showLikeAWindow(size: CGSize(width: dropDownButton.superview?.frame.size.width ?? 0,
                                                           height: self.dropDownHeight),
                                              origin: CGPoint(x: dropDownButton.superview?.frame.maxX ?? 0,
                                                              y: self.schedulesStack.frame.minY + dropDownButtonCenter.y + dropDownButton.frame.height/2),
                                              .downLeft)
            }
        }
        
        dropDownButton.addAction(UIAction(handler: handler),
                                 for: .touchUpInside)

        return TimeStack(stack: stack,
                         hourLabel: hourLabel)
    }
}

extension SingleBookingView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}

extension SingleBookingView: CalendarViewProtocol {
    
    func chosedDays(_ day: String,_ month: String,_ year: String) {
        
        self.dropDown.frame.size = .zero
        
        let dayLabel = UILabel()
        dayLabel.text = "\(day)/\(month)/\(year)"
        
        let entireDayButton = UISwitch()
        entireDayButton.onTintColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let dayLabelStack = UIStackView(arrangedSubviews: [dayLabel, entireDayButton])
        dayLabelStack.distribution = .fillProportionally
        dayLabelStack.backgroundColor = .red
        
        let timeLabel = UILabel()
        timeLabel.text = "Horários"
        
        let timesStack = UIStackView()
        timesStack.axis = .vertical
        
        let addtimeButton = UIButton()
        
        var hourInArray: [String] = []
        var hourOutArray: [String] = []
        
        let parameters = HoursParameters(space_id: self.spaceId, date: "\(year)-\(month)-\(day)", start_time: "08:00")
        
        calendarView.myCollectionView.isUserInteractionEnabled = false
        
        self.sessionManager.postDataWithArrayResponse(endpoint: .reservationsHours, parameters: parameters) { (statusCode, error, hours: [ReservationHours]?) in
            guard let hours = hours else {
                
                self.calendarView.myCollectionView.isUserInteractionEnabled = true
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
            
            self.calendarView.myCollectionView.isUserInteractionEnabled = true
            
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
            
            let chosedDayStack = UIStackView(arrangedSubviews: [dayLabelStack, timeLabel, timesStack, addtimeButton])
            chosedDayStack.axis = .vertical
            
            self.schedulesStack.addArrangedSubview(chosedDayStack)

        }
    }
    
    func unchoseDays(_ day: String,_ month: String,_ year: String) {
        
        for view in self.schedulesStack.arrangedSubviews {
            
            if let chosedDayStack = view as? UIStackView {
                
                if let dayLabelStack = chosedDayStack.arrangedSubviews[0] as? UIStackView {
                    
                    if let dayLabel = dayLabelStack.arrangedSubviews[0] as? UILabel {
                        
                        if let text = dayLabel.text {
                            
                            if text.contains(day) && text.contains(month) && text.contains(year) {
                                
                                chosedDayStack.removeFromSuperview()
                            }
                        }
                    }
                }
            }
        }
    }
}
