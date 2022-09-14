
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//

import UIKit
import SwiftUI

class BookingDetailsView: UIViewController {
    
    let customBar = UIView()
    
    private let customAlertCancel: CustomAlert = CustomAlert()
    private let customAlertOk: CustomAlert = CustomAlert()
    private var space: SpaceDetail = SpaceDetail()
    public var currentReservation: Reservations?
    public var currentSpace = UserReservations.spaceDetail
    
    let sessionManager = SessionManager()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    lazy var checkIN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check-in", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonCheckInTap), for: .touchUpInside)
        return button
    }()
    
    lazy var lineView1:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView2:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView3:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView4:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView5:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        lb.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var reserveCollection: UICollectionView = {
        
        let itemsize = 300
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        layoutCollection.itemSize = CGSize(width: itemsize, height: itemsize)
        layoutCollection.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        collection.register(BookingDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        guard let pictures = currentReservation?.picture else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        return pageControl
    }()
    
    lazy var infoLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var bdStackDataLabel: UILabel = {
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    lazy var bdStackViewBookingTypeLabel: UILabel = {
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    lazy var bookingDetailsDataStackView: UIStackView = {

        let stackView = UIStackView(arrangedSubviews: [bdStackDataLabel, bdStackViewBookingTypeLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var checkOutStackViewHourLabel: UILabel = {
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    lazy var checkOutStackView: UIStackView = {
        
        let checkOut = UILabel()
        checkOut.text = "Check-out"
        checkOut.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        checkOut.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let stackView = UIStackView(arrangedSubviews: [checkOut, checkOutStackViewHourLabel])
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var checkInStackViewHourLabel: UILabel = {
        let lb = UILabel()
        lb.text = " "
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return lb
    }()
    
    lazy var checkInStackView: UIStackView = {
        
        let checkIn = UILabel()
        checkIn.text = "Check-in"
        checkIn.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        checkIn.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let stackView = UIStackView(arrangedSubviews: [checkIn, checkInStackViewHourLabel])
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var items = [UIStackView]()
    
    var businessDays = [" "]
    var seatsQty = " "
    var spaceAddress = " "
    
    lazy var localDetailsStackView: UIStackView = {

        let textColor = UIColor(named: ColorsBravve.textField.rawValue)

        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)

        items.append(createStackView(seatsQty, UIImage(named: IconsBravve.users.rawValue), textColor: textColor))
        items.append(createStackView(spaceAddress, UIImage(named: IconsBravve.map.rawValue), textColor: textColor))
        
        items.append(createStackView(businessDays[0], UIImage(named: IconsBravve.clockReserv.rawValue), textColor: textColor))
        
        if businessDays != [] {
        for i in 0...businessDays.count-1 {

            items.append(createStackView(businessDays[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                         isHidden: true,
                                         textColor: textColor))
        }
        }

        let buttons = createSeeButtonsStackView(3...items.count-1, items: items)
        
        
        let stackView = UIStackView(arrangedSubviews: [title] + items + [buttons])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var spaceContactName = " "
    var spaceContactRole = " "
    
    lazy var responsableStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Responsável"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        
        let responsableLabel = UILabel()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]

        let atritutedString1 = NSMutableAttributedString(string: "\(spaceContactName)\n", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: spaceContactRole, attributes: attrs2 as [NSAttributedString.Key : Any])

        atritutedString1.append(atritutedString2)
        responsableLabel.attributedText = atritutedString1
        responsableLabel.numberOfLines = 0
        
        
        let informations = UILabel()
        informations.text = "Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através dos contatos abaixo."
        informations.numberOfLines = 0
        informations.font = UIFont(name: FontsBravve.light.rawValue, size: 12)
        informations.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let button = createSeeButton(smallText: informations.text ?? "", fullText: " ", actionLabel: informations)
   
        let stackView = UIStackView(arrangedSubviews: [title, responsableLabel, informations, button] )
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var spaceContactPhone = " "
    var spaceContactEmail = " "
    
    lazy var contactsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Contatos"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 12)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        var contacts = [UIStackView]()
        
        contacts.append(createStackView(spaceContactPhone, UIImage(named: IconsBravve.cellphone.rawValue), textColor: textColor))
        contacts.append(createStackView(spaceContactEmail, UIImage(named: IconsBravve.email.rawValue), textColor: textColor))
        
        let stackView = UIStackView(arrangedSubviews: [title] + contacts)
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var detailLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes da sua reserva"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.calendar.rawValue)
        
        return image
    }()
    
    lazy var payFormLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Forma de pagamento"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var imagePay: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.receipt.rawValue)
        
        return image
    }()
    
    lazy var numberPeopleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.users.rawValue)
        
        return image
    }()
    
    lazy var creditCard: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cartão de crédito"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    var paymentAmount = " "
    
    lazy var totalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " R$ \(paymentAmount)", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        lb.attributedText = atritutedString1
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var creditCardTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = " "
        tf.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        tf.backgroundColor = UIColor(named: ColorsBravve.backgroundCard.rawValue)
        tf.isUserInteractionEnabled = false
        return tf
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar Reserva", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor(named: ColorsBravve.white_white.rawValue), for: .normal)
        
        button.addTarget(self, action: #selector(cancelBooking), for: .touchUpInside)
        
        return button
    }()
    
    private let viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        
        return scroll
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func loadView() {
        super.loadView()
        getReservation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        
        setupViews()
        setupDefaults()
        setupContraints()
    }
    
    func getReservation() {
        
        for reservation in UserReservations.reservations {
            if reservation.id == UserReservations.reservationID {
                currentReservation = reservation
            }
        }
        
        guard let bookingTypeLabel = currentReservation?.space_contract_id else { return }
        var bookingTypeName = ""
        
        switch bookingTypeLabel {
            case 1: bookingTypeName = "Por 30 min"
            case 2: bookingTypeName = "Por hora"
            case 3: bookingTypeName = "Diária"
            case 4: bookingTypeName = "Mensal"
            case 5: bookingTypeName = "Por hora - Workpass"
            case 6: bookingTypeName = "Diária - Workpass"
            case 7: bookingTypeName = "Mensal - Workpass"
            default: bookingTypeName = " "
        }
        
        guard let seats = currentReservation?.seats_qty else { return }
        guard let street = currentReservation?.space_address?.street else { return }
        guard let streetNumber = currentReservation?.space_address?.street_number else { return }
        guard let neighborhood = currentReservation?.space_address?.neighborhood else { return }
        guard let complement = currentReservation?.space_address?.complement else { return }
        guard let postalCode = currentReservation?.space_address?.postal_code else { return }
        guard let city = currentReservation?.space_address?.city_name else { return }
        guard let state = currentReservation?.space_address?.state_name else { return }
        guard let reservationStartDt = currentReservation?.start_dt else { return }
        guard let reservationEndDt = currentReservation?.end_dt else { return }
        guard let payment = currentReservation?.payment_amount else { return }
        
        let separatedStartDate = reservationStartDt.components(separatedBy: "T")
        let separatedEndDate = reservationEndDt.components(separatedBy: "T")
        
        let formatStartDate = separatedStartDate[0].components(separatedBy: "-")
        
        let startDate = "\(formatStartDate[2])/\(formatStartDate[1])/\(formatStartDate[0])"
  
        let separatedStartHour = separatedStartDate[1].components(separatedBy: ":")
        let separatedEndHour = separatedEndDate[1].components(separatedBy: ":")
        
        let startHour = "\(separatedStartHour[0]):\(separatedStartHour[1])"
        let endHour = "\(separatedEndHour[0]):\(separatedEndHour[1])"
        
        guard var business_hours = currentSpace?.space_business_hours else { return }
        business_hours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            return lhsWeekDay < rhsWeekDay
        }
        
        var texts:[String] {
            var textArray: [String] = []
            
            for business_hour in business_hours {
                
                if business_hour.flag_closed_day != nil {
                    if !business_hour.flag_closed_day! {
                        textArray.append("\(business_hour.day_name ?? ""): \(business_hour.start_time ?? "")h - \(business_hour.end_time ?? "")h")
                    }
                }
            }
            return textArray
        }
        if texts != [] {
            businessDays = texts
        } else {
            businessDays = [" "]
        }
        
        titleLabel.text = currentReservation?.space_category?.name?.uppercased() ?? ""
        titleLabel.backgroundColor = titleLabel.getTitleLabelBackgroundColor(currentReservation?.space_category?.name?.uppercased() ?? "")
        descriptLabel.text = currentReservation?.slogan
        infoLocalLabel.text = currentReservation?.local_name
        nameLocalLabel.text = currentReservation?.description
        bdStackDataLabel.text = startDate
        bdStackViewBookingTypeLabel.text = bookingTypeName
        checkInStackViewHourLabel.text = startHour
        checkOutStackViewHourLabel.text = endHour
        seatsQty = "Até \(seats) pessoas"
        spaceAddress = "\(street), \(complement), \(streetNumber), \(neighborhood), \(city) \n \(state) \(postalCode), BR"
        spaceContactName = currentReservation?.space_contact?.name ?? " "
        spaceContactRole = " "
        spaceContactPhone = currentReservation?.space_contact?.phone ?? " "
        spaceContactEmail = currentReservation?.space_contact?.email ?? " "
        paymentAmount = payment.replacingOccurrences(of: ".", with: ",")
        creditCard.text = currentReservation?.payment_type_name ?? ""
    }
    

    
    /// This function creates the checkIN Button alert, as well as the alert message, its response buttons and their action
    @objc func buttonCheckInTap(){
        customAlertOk.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Para realizar o Check-in, é necessário permissão de uso da câmera do celular.", enterAttributed: "Permitir", enterHandler: UIAction(handler: { _ in
            let vc = CheckInQrCodeViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }), cancelAttributed: "Negar", cancelHandler: UIAction(handler: { _ in
            self.customAlertOk.dismissAlert()
        }), on: self)
    }
    
    
    /// This function adds view elements
    func setupViews(){
        view.addSubview(checkIN)
        tabBar.selectedItem = tabBar.items?[1]
        view.addSubview(customBar)
        view.addSubview(tabBar)
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, pageControl, infoLocalLabel,
                          nameLocalLabel, detailLocalLabel, imageDetail, lineView1, lineView2, imagePay, payFormLabel,
                          creditCard, creditCardTextField, totalLabel, lineView3, lineView4, bookingDetailsDataStackView,
                          checkInStackView, checkOutStackView, lineView5, cancelButton, localDetailsStackView,
                          responsableStackView, contactsStackView
                         ])
        
    }
    
    /// This function creates StackView for Location Details, where each StackView has a description image and a text with the details
    /// - Parameters:
    ///   - text: text description
    ///   - image: image description
    ///   - isHidden: StackView with image and text
    ///   - textColor:Label's color
    /// - Returns: This funtion returns StackViews with images and text with local details
    private func createStackView(_ text: String,
                                 _ image: UIImage? = nil,
                                 isHidden: Bool = false,
                                 textColor: UIColor? = .white) -> UIStackView {
        
        let stackView = UIStackView()
        
        if let image = image {
            
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.image = image
            
            stackView.addArrangedSubview(imageView)
            
            imageView.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        }
        
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(12).generateSizeForScreen)
        label.textColor = textColor
        
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.isHidden = isHidden
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }
    
    /// This function creates the action of the see more and see less button, displaying from the data that comes from the API, the days and hours of operation of the place
    /// - Parameters:
    ///   - range: The range is the days and hours of operation of the place
    ///   - items: StackView
    ///   - titleColor: button's color
    ///   - downButtonImages: the arrow corresponding to the action of the button (down arrow)
    ///   - upButtonImages: the arrow corresponding to the action of the button (up arrow)
    /// - Returns: This function returns the action on the button and displays the data, days and hours of operation of the place or not
    private func createSeeButtonsStackView(_ range: ClosedRange<Int>,
                                           items: [UIStackView],
                                           titleColor: ColorsBravve = .buttonPink,
                                           downButtonImages: ButtonsBravve = .arrowDownPink,
                                           upButtonImages: ButtonsBravve = .arrowUpPink) -> UIStackView {

        let moreButton = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: ColorsBravve.buttonPink.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais ",
            attributes: yourAttributes)
        moreButton.setAttributedTitle(attributeString, for: .normal)
        moreButton.setImage(UIImage(named: downButtonImages.rawValue),
                            for: .normal)
        moreButton.imageView?.contentMode = .scaleAspectFit
        moreButton.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        moreButton.titleLabel?.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)

        moreButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        moreButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        moreButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        moreButton.imageView?.constraintInsideTo(.height, moreButton.titleLabel,
                                                 multiplier: 0.5)
        moreButton.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)

        let lessButton = UIButton()
        attributeString = NSMutableAttributedString(
            string: "Ver Menos ",
            attributes: yourAttributes)
        lessButton.setAttributedTitle(attributeString, for: .normal)
        lessButton.setImage(UIImage(named: upButtonImages.rawValue),
                            for: .normal)
        lessButton.imageView?.contentMode = .scaleAspectFit
        lessButton.isHidden = true
        lessButton.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        lessButton.titleLabel?.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)

        lessButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        lessButton.imageView?.constraintInsideTo(.height, lessButton.titleLabel,
                                                 multiplier: 0.5)
        lessButton.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)
        
        let seeMoreHandler = {(action: UIAction) in

            for i in range {

                items[i].isHidden = false
            }
            moreButton.isHidden = true
            lessButton.isHidden = false
        }

        let seeLessHandler = {(action: UIAction) in

            for i in range {

                items[i].isHidden = true
            }
            moreButton.isHidden = false
            lessButton.isHidden = true
        }

        moreButton.addAction(UIAction(handler: seeMoreHandler), for: .touchUpInside)
        lessButton.addAction(UIAction(handler: seeLessHandler), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [moreButton, lessButton])

        return stackView
    }
    
    /// This function creates the action of the see more and see less button, modifying the way of displaying the text that comes from the API
    /// - Parameters:
    ///   - smallText: compressed form of the text coming from the API
    ///   - fullText: full form of the text coming from the API
    ///   - actionLabel: Toggles between smallText and full depending on the action the button currently has
    /// - Returns: The button that is modified to see more or less and the text that obeys the command of the button
    private func createSeeButton(smallText: String, fullText: String, actionLabel: UILabel) -> UIButton {
        let button = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: ColorsBravve.buttonPink.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais ",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        attributeString = NSMutableAttributedString(
            string: "Ver Menos ",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .selected)
        
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue),
                            for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowUpPink.rawValue),
                            for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)
        
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                                 multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)
        let handler = {(action: UIAction) in
            button.isSelected = !button.isSelected
            if button.isSelected {
                actionLabel.text = fullText
            } else {
                actionLabel.text = smallText
            }
        }
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        return button
    }
    
    /// This function handles the cancelbooking button alert. The message, buttons and their actions
    @objc func cancelBooking(){
        customAlertCancel.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Certeza que deseja cancelar essa reserva? Entraremos em contato para confirmar o cancelamento!", enterAttributed: "Voltar", enterHandler: UIAction(handler: { _ in
            self.customAlertCancel.dismissAlert()
        }), cancelAttributed: "Cancelar Reserva", cancelHandler: UIAction(handler: { _ in
            
            self.cancelReservation()
            
            let vc = BookingHistoryView()
            vc.modalPresentationStyle = .fullScreen
            self.customAlertCancel.dismissAlert()
            self.present(vc, animated: true)
        }), on: self)
        Flags.shared.flagReservation = 2
    }
    
    func cancelReservation() {
        
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return }
        guard let reservationId = self.currentReservation?.id else {
            return
        }

        let parameters = CancelReservationParameters(uuid: uuid, reservations_id: [reservationId])
        
        self.sessionManager.postDataWithResponse(endpoint: .reservationsCancellations, parameters: parameters) {(statusCode, error, reservations: CancelReservationParameters?) in
            
            guard let reservations = reservations else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                print("kaj \(parameters)")
                print("kaj \(reservations)")
                return
            }
            
        }
    }
    
    
    /// This function deals with the customBar, its title, its back button and the action it has
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            self.dismiss(animated: true)
            
        }
    }
    
    /// This function has all the constraints of the BookingDetails view elements
    func setupContraints(){
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, checkIN)

        viewInScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 24),
                        
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            descriptLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            reserveCollection.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveCollection.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            reserveCollection.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            reserveCollection.heightAnchor.constraint(equalToConstant: 300),
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
            infoLocalLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor,constant: 52.5),
            infoLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 7),
            nameLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 32),
            detailLocalLabel.leadingAnchor.constraint(equalTo: imageDetail.trailingAnchor,constant: 9),
            
            bookingDetailsDataStackView.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor, constant: CGFloat(27).generateSizeForScreen),
            bookingDetailsDataStackView.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: CGFloat(20).generateSizeForScreen),

            checkInStackView.topAnchor.constraint(equalTo: bookingDetailsDataStackView.topAnchor),
            checkInStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-108).generateSizeForScreen),

            checkOutStackView.topAnchor.constraint(equalTo: bookingDetailsDataStackView.topAnchor),
            checkOutStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-24).generateSizeForScreen),
                        
            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            creditCardTextField.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            lineView1.topAnchor.constraint(equalTo: bookingDetailsDataStackView.bottomAnchor,constant: 17),
            lineView1.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView1.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView2.topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lineView2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView2.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
            
            localDetailsStackView.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 15),
            localDetailsStackView.leadingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            localDetailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-76).generateSizeForScreen),
            
            lineView3.topAnchor.constraint(equalTo: localDetailsStackView.bottomAnchor,constant: 16),
            lineView3.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView3.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            
            responsableStackView.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 15),
            responsableStackView.leadingAnchor.constraint(equalTo: lineView3.leadingAnchor),
            responsableStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-78).generateSizeForScreen),
            
            lineView4.topAnchor.constraint(equalTo: responsableStackView.bottomAnchor,constant: CGFloat(16).generateSizeForScreen),
            lineView4.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView4.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView4.heightAnchor.constraint(equalToConstant: 0.5),
            
            contactsStackView.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 15),
            contactsStackView.leadingAnchor.constraint(equalTo: lineView4.leadingAnchor),
            contactsStackView.trailingAnchor.constraint(equalTo: lineView4.trailingAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: contactsStackView.bottomAnchor,constant: 21.5),
            cancelButton.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            cancelButton.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            cancelButton.heightAnchor.constraint(equalToConstant: 52),
            cancelButton.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -40),
            
            checkIN.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            checkIN.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            checkIN.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            checkIN.heightAnchor.constraint(equalToConstant: 52),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension BookingDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pictures = currentReservation?.picture else { return 0 }

        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? BookingDetailsCollectionViewCell
        
        guard let pictures = currentReservation?.picture else { return UICollectionViewCell() }
        guard let picture = pictures[indexPath.row].url else { return UICollectionViewCell() }
        

        cell?.imageView.sd_setImage(with: URL(string: picture))
        
        return cell ?? UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        var roundedIndex = 0.0
        if index < 0.2 {
            roundedIndex = round(index)
        } else {
            roundedIndex = ceil(index)
        }
        
        self.pageControl.currentPage = Int(roundedIndex)
    }
    
}





