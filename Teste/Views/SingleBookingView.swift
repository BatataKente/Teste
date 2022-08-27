//
//  AvulsaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//


import UIKit

class SingleBookingView: UIViewController {
    
    private let sessionManager = SessionManager()
    
    private var hourInArray: [String] = []
    private var hourOutArray: [String] = []
    
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
    
    private let singleBookingViewModel = SingleBookingViewModel()
    
    init(_ spaceDetails: SpaceDetail, spaceId: Int) {
        self.spaceDetails = spaceDetails
        
        self.spaceId = spaceId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool {
        
        true
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
        
        let reservation2View = Reservas2()
        reservation2View.modalPresentationStyle = .fullScreen
        
        self.present(reservation2View, animated: true)
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
        
        if singleBookingViewModel.bringTheStackWithThisDate(views: schedulesStack.arrangedSubviews, day, month, year) == nil {
            
            let dayLabel = UILabel()
            dayLabel.text = "\(day)/\(month)/\(year)"
            
            let entireDayLabel = UILabel()
            entireDayLabel.text = "Dia inteiro"
            
            let dayLabelStack = UIStackView(arrangedSubviews: [dayLabel, entireDayLabel])
            
            let timeLabel = UILabel()
            timeLabel.text = "Horários"
            
            let timesStack = UIStackView()
            timesStack.axis = .vertical
            
            let addtimeButton = UIButton()
            
            self.hourInArray = []
            self.hourOutArray = []
            
            let parameters = HoursParameters(space_id: self.spaceId, date: "\(year)-\(month)-\(day)", start_time: "08:00")
            
            calendarView.myCollectionView.isUserInteractionEnabled = false
            self.sessionManager.postDataWithArrayResponse(endpoint: .reservationsHours, parameters: parameters) { (statusCode, error, hours: [ReservationHours]?) in
                guard let hours = hours else {
                    
                    print(statusCode as Any)
                    return
                }
                
                for hour in hours {
                    
                    guard let hourFlag = hour.flag else { return }
                    guard let hourTime = hour.hour else { return }
                    
                    if hourFlag {
                        
                        guard let timeInt = Int(hourTime.split(separator: ":")[0]) else { return }
                        
                        let timeOut = timeInt + 1
                        self.hourOutArray.append("\(timeOut):00")
                        self.hourInArray.append(hourTime)
                    }
                }
                
                self.calendarView.myCollectionView.isUserInteractionEnabled = true
                
                let handler = {(action: UIAction) in
                    
                    let timeInStack: UIStackView = {
                                    
                        let inLabel = UILabel()
                        inLabel.text = "Entrada"
                        
                        let hourLabel = UILabel()
                       
                        let stackView = UIStackView(arrangedSubviews: [inLabel, hourLabel])
                        stackView.axis = .vertical
                        
                        let dropDownButton = UIButton()
                        dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                                for: .normal)
                        
                        let timeInStack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
                        
                        let handler = {(action: UIAction) in
                            
                            let dropDownButtonCenter = self.schedulesStack.convert(dropDownButton.center, from: dropDownButton.superview)
                    
                            var buttons = [UIButton]()
                    
                            for time in self.hourInArray {
                    
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
                            
                            if !self.hourInArray.isEmpty {
                                
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
     
                        return timeInStack
                    }()
                    
                    
                    let timeOutStack: UIStackView = {
                                    
                        let inLabel = UILabel()
                        inLabel.text = "Saída"
                        
                        let hourLabel = UILabel()
                        
                        let stackView = UIStackView(arrangedSubviews: [inLabel, hourLabel])
                        stackView.axis = .vertical
                        
                        let dropDownButton = UIButton()
                        dropDownButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                                                for: .normal)
                        
                        let timeOutStack = UIStackView(arrangedSubviews: [stackView, dropDownButton])
                        
                        let handler = {(action: UIAction) in
                            
                            let dropDownButtonCenter = self.schedulesStack.convert(dropDownButton.center, from: dropDownButton.superview)
                    
                            var buttons = [UIButton]()
                    
                            for time in self.hourOutArray {
                    
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
                    
                            if !self.hourInArray.isEmpty {
                                
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
            
                        return timeOutStack
                    }()
                    
                    
                    let trashButton = UIButton()
                    trashButton.setImage(UIImage(named: ButtonsBravve.alert.rawValue),
                                            for: .normal)
                    
                    let timeStack = UIStackView(arrangedSubviews: [timeInStack, timeOutStack, trashButton])
                    timeStack.distribution = .fillProportionally
                    
                    timeInStack.widthAnchorInSuperview(self.timeStacksSize.width)
                    timeInStack.heightAnchorInSuperview(self.timeStacksSize.height)
                    timeOutStack.widthAnchorInSuperview(self.timeStacksSize.width)
                    timeOutStack.heightAnchorInSuperview(self.timeStacksSize.height)
                    
                    let handler = {(action: UIAction) in
                        
                        timeStack.removeFromSuperview()
                        self.hourInArray = []
                        self.hourOutArray = []
                    }
                    
                    trashButton.addAction(UIAction(handler: handler), for: .touchUpInside)
                    
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
    }
    
    func unchoseDays(_ day: String,_ month: String,_ year: String) {
        
        guard let stack = singleBookingViewModel.bringTheStackWithThisDate(views: schedulesStack.arrangedSubviews, day, month, year) else {return}
        stack.removeFromSuperview()
    }
}
