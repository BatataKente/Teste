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
    
    private let alert = CustomAlert()
    
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
        nextButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
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
        
        checkValidReservation()
        
        self.view.setToDefaultBackgroundColor()
        
        view.createReservationCustomBar(spaceName: spaceDetails.space_name,
                                        localName: spaceDetails.local_name,
                                        spacePictures: spaceDetails.pictures,
                                        progressBarButtons: buttons) { _ in
            
            self.dismiss(animated: true)
        }
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        daysChoiceLabel.translatesAutoresizingMaskIntoConstraints = false
        capacityLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        schedulesStack.translatesAutoresizingMaskIntoConstraints = false

        bodyScrollView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        viewToScroll.translatesAutoresizingMaskIntoConstraints = false
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: CGFloat(52).generateSizeForScreen).isActive = true
        
        calendarView.topAnchor.constraint(equalTo: viewToScroll.topAnchor,
                                          constant: CGFloat(44).generateSizeForScreen).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor,
                                              constant: CGFloat(40).generateSizeForScreen).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: viewToScroll.trailingAnchor,
                                               constant: CGFloat(-40).generateSizeForScreen).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: CGFloat(338).generateSizeForScreen).isActive = true

        bodyScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(220).generateSizeForScreen).isActive = true
        bodyScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyScrollView.bottomAnchor.constraint(equalTo: nextButton.topAnchor).isActive = true
        
        viewToScroll.topAnchor.constraint(equalTo: bodyScrollView.contentLayoutGuide.topAnchor).isActive = true
        viewToScroll.leadingAnchor.constraint(equalTo: bodyScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        viewToScroll.trailingAnchor.constraint(equalTo: bodyScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        viewToScroll.bottomAnchor.constraint(equalTo: bodyScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        viewToScroll.widthAnchor.constraint(equalTo: bodyScrollView.frameLayoutGuide.widthAnchor).isActive = true

        daysChoiceLabel.topAnchor.constraint(equalTo: viewToScroll.topAnchor).isActive = true
        daysChoiceLabel.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor,
                                                 constant: CGFloat(20).generateSizeForScreen).isActive = true
        daysChoiceLabel.trailingAnchor.constraint(equalTo: viewToScroll.trailingAnchor,
                                                  constant: CGFloat(-20).generateSizeForScreen).isActive = true

        capacityLabel.topAnchor.constraint(equalTo: calendarView.bottomAnchor,
                                           constant: CGFloat(54).generateSizeForScreen).isActive = true
        capacityLabel.leadingAnchor.constraint(equalTo: daysChoiceLabel.leadingAnchor).isActive = true
        capacityLabel.trailingAnchor.constraint(equalTo: daysChoiceLabel.trailingAnchor).isActive = true

        lineView.topAnchor.constraint(equalTo: capacityLabel.bottomAnchor,
                                           constant: CGFloat(24).generateSizeForScreen).isActive = true
        lineView.leadingAnchor.constraint(equalTo: daysChoiceLabel.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: daysChoiceLabel.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: CGFloat(1).generateSizeForScreen).isActive = true

        schedulesStack.topAnchor.constraint(equalTo: lineView.bottomAnchor,
                                            constant: CGFloat(24).generateSizeForScreen).isActive = true
        schedulesStack.leadingAnchor.constraint(equalTo: lineView.leadingAnchor).isActive = true
        schedulesStack.trailingAnchor.constraint(equalTo: lineView.trailingAnchor).isActive = true
        schedulesStack.bottomAnchor.constraint(equalTo: viewToScroll.bottomAnchor,
                                               constant: -dropDownHeight).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        calendarView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
       
    @objc func nextTarget() {
        
        let reservation2View = Reservation2View()
        reservation2View.modalPresentationStyle = .fullScreen
        reservation2View.spaceDetail = self.spaceDetails
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
    
    func showAlert() {
        
        alert.showAlert(message: "Não ha horários para esse dia",
                        enterAttributed: "Ok",
                        on: self)
    }
    
    func deselectCell() {
        
        calendarView.deselectCell()
    }
    
    func checkValidReservation() {
        if ReservationList.reservationList != [] {
            nextButton.addTarget(nil, action: #selector(nextTarget),
                                 for: .touchUpInside)
            nextButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        } else {
            nextButton.removeTarget(nil, action: #selector(nextTarget),
                                 for: .touchUpInside)
            nextButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        }
    }
}
