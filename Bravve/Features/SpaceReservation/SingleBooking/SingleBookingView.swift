//
//  AvulsaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//


import UIKit

class SingleBookingView: UIViewController {
    
    private var capacityNumber: Int {
        guard let seats_qty = spaceDetails.seats_qty else { return 0 }
        return seats_qty
    }
    private let dropDownHeight = CGFloat(160).generateSizeForScreen
    private let spaceDetails: SpaceDetail
    
    private let spaceId: Int
    private var spaceContractId: Int
    
    private var userUUID: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return "User UUID unavailable"}
        
        return uuid
    }
    
    private var reservationArray: [Reservations]
    
    init(_ spaceDetails: SpaceDetail, spaceId: Int) {
        
        self.spaceDetails = spaceDetails
        
        self.spaceId = spaceId
        
        self.reservationArray = []
        
        self.spaceContractId = 2
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var  buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.walletGray.rawValue, IconsBravve.calendarBlue.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditGray.rawValue])
        
        let handler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return buttons
    }()
    
    private lazy var schedulesStack: UIStackView = {
        
        let schedulesStack = UIStackView()
        schedulesStack.axis = .vertical
        
        return schedulesStack
    }()
    
    private let daysChoiceLabel: UILabel = {
        
       let daysChoiceLabel = UILabel()
        daysChoiceLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                      size: CGFloat(15).generateSizeForScreen)
        daysChoiceLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        daysChoiceLabel.text = "Escolha dia e hora"
        daysChoiceLabel.textAlignment = .left
        return daysChoiceLabel
    }()
    
    private lazy var capacityLabel: UILabel = {
        
       let capacityLabel = UILabel()
        capacityLabel.font = UIFont(name: FontsBravve.medium.rawValue,
                                      size: CGFloat(15).generateSizeForScreen)
        capacityLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        capacityLabel.text = "Capacidade: \(capacityNumber) pessoas"
        capacityLabel.textAlignment = .left
        
        return capacityLabel
    }()
    
    private let lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = .gray
        
        return lineView
    }()
    
    private lazy var calendarView: CalendarView = {
        
        let calendarView = CalendarView()
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
    
    private let nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Próxima Etapa", for: .normal)
        nextButton.setTitleColor(UIColor(named: "white"), for: .normal)
        nextButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        nextButton.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,size: CGFloat(16).generateSizeForScreen)
        return nextButton
    }()
    
    
    private lazy var tabBar = TabBarClosed(self, itemImagesNames: [
        ButtonsBravve.locationGray.rawValue,
        ButtonsBravve.calendarButtonPink.rawValue,
        ButtonsBravve.userLoginGray.rawValue
    ])
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    private lazy var singleBookingViewModel = SingleBookingViewModel(spaceId,
                                                                     reservationArray, spaceDetail: spaceDetails)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "My Calender"
        singleBookingViewModel.delegate = self
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.setToDefaultBackgroundColor()
        view.addSubviews([bodyScrollView, tabBar, nextButton])
        bodyScrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([calendarView, daysChoiceLabel, capacityLabel, lineView, schedulesStack, dropDown])
        
        tabBar.selectedItem = tabBar.items?[0]
        
        nextButton.addTarget(nil, action: #selector(nextTarget),
                             for: .touchUpInside)
        
        self.view.setToDefaultBackgroundColor()
        
        view.createReservationCustomBarAPI(spaceName: spaceDetails.space_name, localName: spaceDetails.local_name, imageURL: spaceDetails.pictures?[0].url, progressBarButtons: buttons) { _ in
            
            self.dismiss(animated: true)
        }
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        nextButton.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        nextButton.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        nextButton.constraintOutsideTo(.bottom, tabBar)
        nextButton.heightAnchorInSuperview(CGFloat(52).generateSizeForScreen)
        
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
        
        singleBookingViewModel.setupSchedulesStack(stack: schedulesStack, day, month, year)
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

extension SingleBookingView: SingleBookingViewModelProtocol {
    
    func reduceDropDown() {
        
        self.dropDown.frame.size = .zero
    }
    
    func setupDropDown(_ dropDownButton: UIButton,_ buttons: [UIButton]) {
        
        let dropDownButtonCenter = schedulesStack.convert(dropDownButton.center, from: dropDownButton.superview)
        self.dropDown.turnIntoAList(buttons)

        self.dropDown.showLikeAWindow(size: CGSize(width: dropDownButton.superview?.frame.size.width ?? 0,
                                                   height: self.dropDownHeight),
                                      origin: CGPoint(x: dropDownButton.superview?.frame.maxX ?? 0,
                                                      y: self.schedulesStack.frame.minY + dropDownButtonCenter.y + dropDownButton.frame.height/2),
                                      .downLeft)
    }
    
    func changeCollectionViewState() {
        
        calendarView.myCollectionView.isUserInteractionEnabled = !calendarView.myCollectionView.isUserInteractionEnabled
    }
    
    func getSpaceContractId(spaceContractId: Int) {
        self.spaceContractId = spaceContractId
    }
}
