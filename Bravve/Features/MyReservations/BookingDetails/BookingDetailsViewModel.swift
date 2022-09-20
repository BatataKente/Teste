//
//  DetalhesReservaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol BookingDetailsViewModelProtocol {
    
    func updateView(_ currentReservation: Reservations?, startDate: String, bookingTypeName: String, startHour: String, endHour: String)
    func goToBookingHistory()
    func unableToCancelMessage(message: String)
    
}

class BookingDetailsViewModel {
    
    let customAlertCancel = CustomAlert()
    let customAlertOk = CustomAlert()
    let unableToCancelMessageAlert = CustomAlert()
    
    var items = [UIStackView]()
    let customBar = UIView()
    
    var spaceContactName = " "
    var spaceContactRole = " "
    var paymentAmount = " "
    var businessDays = [SpaceBusinessHours]()
    var seatsQty = " "
    var spaceAddress = " "
    var spaceContactPhone = " "
    var spaceContactEmail = " "
    
    var space: SpaceDetail = SpaceDetail()
    var currentReservation: Reservations?
    public var currentSpace = UserReservations.spaceDetail
    
    var delegate: BookingDetailsViewModelProtocol?
    
    private let sessionManager = APIService()
    
    private func sortBusinessHours(businessHours: inout [SpaceBusinessHours]) {
        businessHours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            
            print(lhs)
            print(rhs)
            return lhsWeekDay < rhsWeekDay
        }
    }
    
    private func createFacilitiesArray(facilities: [SpaceFacility]?) -> [String] {
        
        var textArray: [String] = []
        
        guard let facilities = facilities else {
            return []
        }
        
        for facility in facilities {
            guard let facilityName = facility.name else { return [] }
            textArray.append(facilityName)
        }
        
        return textArray
    }
    
    private func addItemsInStructureStackView(texts: [String], items: inout [UIStackView], structureStackView: UIStackView, textColor: UIColor?, title: UILabel, seeMoreColor: ColorsBravve, arrowUpImage: UIImage?, arrowDownImage: UIImage?) {
        
        if texts.count < 7 {
            for text in texts {
                items.append(createStackView(text, textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
                
            }
            structureStackView.addArrangedSubviews([title] + items)
        } else {
            for i in 0...5 {
                
                items.append(createStackView(texts[i], textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
            }
            
            for i in 6...texts.count - 1 {
                
                items.append(createStackView(texts[i], isHidden: true, textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
            }
            
            let button = createSeeButtonsStackView(6...items.count-1, items: items, titleColor: seeMoreColor, arrowDownImage: arrowDownImage, arrowUpImage: arrowUpImage)
            structureStackView.addArrangedSubviews([title] + items + [button])
        }
    }
    
    private func createItensStackView(itens: inout [UIStackView], texts: [String]? = nil, attributedTexts: [NSAttributedString]? = nil, textColor: UIColor, seats_qty: Int, street: String, neighborhood: String, streetNumber: Int, cityName: String, stateName: String, postalCode: String) {
        
        if let texts = texts {
            
            itens.append(createStackView("Até \(seats_qty) pessoas",
                                         UIImage(named: IconsBravve.users.rawValue),
                                         textColor: textColor))
            itens.append(createStackView("\(street), \(neighborhood), nº\(streetNumber), \(cityName). \(stateName) \(postalCode), BR",
                                         UIImage(named: IconsBravve.map.rawValue),
                                         textColor: textColor))
            if !texts.isEmpty {
                itens.append(createStackView(texts[0], UIImage(named: IconsBravve.clockReserv.rawValue),
                                             textColor: textColor))
                
                for i in 1...texts.count-1 {
                    
                    itens.append(createStackView(texts[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                                 isHidden: true,
                                                 textColor: textColor))
                }
            }
        }
        if let attributedTexts = attributedTexts {
            
            itens.append(createStackView("Até \(seats_qty) pessoas",
                                         UIImage(named: IconsBravve.users.rawValue),
                                         textColor: textColor))
            itens.append(createStackView("\(street), \(neighborhood), nº\(streetNumber), \(cityName). \(stateName) \(postalCode), BR",
                                         UIImage(named: IconsBravve.map.rawValue),
                                         textColor: textColor))
            if !attributedTexts.isEmpty {
                itens.append(createStackView(attributedText: attributedTexts[0], UIImage(named: IconsBravve.clockReserv.rawValue),
                                             textColor: textColor))
                
                for i in 1...attributedTexts.count-1 {
                    
                    itens.append(createStackView(attributedText: attributedTexts[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                                 isHidden: true,
                                                 textColor: textColor))
                }
            }
        }
    }
    
    func createStackView(_ text: String? = nil, attributedText: NSAttributedString? = nil,
                         _ image: UIImage? = nil,
                         isHidden: Bool = false,
                         textColor: UIColor? = .white,
                         font: UIFont? = UIFont(name: FontsBravve.regular.rawValue,
                                                size: CGFloat(12).generateSizeForScreen)) -> UIStackView {
        
        let stackView = UIStackView()
        
        let label = UILabel()
        if let text = text {
            
            label.text = text
            label.font = font
            label.textColor = textColor
        }
        if let attributedText = attributedText {label.attributedText = attributedText}
        label.numberOfLines = 0
        
        
        if let image = image {
            
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.image = image
            
            stackView.addArrangedSubviews([imageView, label])
            stackView.spacing = CGFloat(10).generateSizeForScreen
            stackView.isHidden = isHidden
            
            imageView.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        } else {
            
            let line = UIView()
            line.backgroundColor = textColor
            
            stackView.addArrangedSubviews([label, line])
            stackView.axis = .vertical
            stackView.isHidden = isHidden
            stackView.spacing = CGFloat(8).generateSizeForScreen
            
            line.heightAnchor.constraint(equalToConstant: CGFloat(1).generateSizeForScreen).isActive = true
            line.widthAnchor.constraint(equalToConstant: CGFloat(280).generateSizeForScreen).isActive = true
            
        }
        
        return stackView
        
    }
    
    /// This function creates the action of the see more and see less button, modifying the way of displaying the text that comes from the API
    /// - Parameters:
    ///   - smallText: compressed form of the text coming from the API
    ///   - fullText: full form of the text coming from the API
    ///   - actionLabel: Toggles between smallText and full depending on the action the button currently has
    /// - Returns: The button that is modified to see more or less and the text that obeys the command of the button
    func createSeeButton(smallText: String, fullText: String, actionLabel: UILabel) -> UIButton {
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
    
    func createSeeButtonsStackView(_ range: ClosedRange<Int>,
                                   items: [UIView],
                                   titleColor: ColorsBravve = .pink_cyan,
                                   arrowDownImage: UIImage? = UIImage(named: ButtonsBravve.arrowDownPink.rawValue),
                                   arrowUpImage: UIImage? = UIImage(named: ButtonsBravve.arrowUpPink.rawValue)) -> UIButton{
        
        let button = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: titleColor.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        attributeString = NSMutableAttributedString(
            string: "Ver Menos",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .selected)
        button.setImage(arrowDownImage,
                        for: .normal)
        button.setImage(arrowUpImage,
                        for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        let handler = {(action: UIAction) in
            
            for i in range {
                
                items[i].isHidden = !items[i].isHidden
            }
            button.isSelected = !button.isSelected
        }
        
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return button
    }
    
    func createLabel(_ text: String?,
                     _ font: UIFont? = UIFont(name: FontsBravve.regular.rawValue,
                                              size: CGFloat(12).generateSizeForScreen),
                     textColor: UIColor? = UIColor(named: ColorsBravve.progressBarLabel.rawValue)) -> UILabel {
        
        let label = UILabel()
        label.text = text ?? " "
        label.font = font
        label.numberOfLines = 0
        label.textColor = textColor
        
        return label
    }
    
    func createBusinessHoursArray(businessHours: [SpaceBusinessHours]) -> [NSMutableAttributedString] {
        
        var texts: [NSMutableAttributedString] = []
        
        let regularFont = UIFont(name: FontsBravve.regular.rawValue,
                                 size: CGFloat(12).generateSizeForScreen)
        let boldFont = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        for business_hour in businessHours {
            
            if business_hour.flag_closed_day != nil {
                
                if !business_hour.flag_closed_day! {
                    
                    let text = NSMutableAttributedString(string: "\(business_hour.day_name ?? ""): ",
                                                         attributes: [.font: regularFont as Any])
                    text.append(NSMutableAttributedString(string: "\(business_hour.start_time ?? "")h",
                                                          attributes: [.font: boldFont as Any]))
                    text.append(NSMutableAttributedString(string: " - ",
                                                          attributes: [.font: regularFont as Any]))
                    text.append(NSMutableAttributedString(string: "\(business_hour.end_time ?? "")h",
                                                          attributes: [.font: boldFont as Any]))
                    
                    texts.append(text)
                }
            }
        }
        
        return texts
    }
    
    func cancelReservation() {
        
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else { return }
        guard let reservationId = self.currentReservation?.id else {
            return
        }
        
        let parameters = CancelReservationParameters(uuid: uuid, reservations_id: [reservationId])
        
        self.sessionManager.postDataWithResponse(endpoint: .reservationsCancellations, parameters: parameters) {(statusCode, error, message: AlertMessage?) in
            
            guard let statusCode = statusCode else { return }
            if statusCode == 204 {
                
                self.sessionManager.getDataArray(endpoint: .reservationshistory){ (statusCode, error, historyReservations: [Reservations]?) in
                    
                    guard let historyReservations = historyReservations else {
                        print(statusCode as Any)
                        print(error?.localizedDescription as Any)
                        return
                    }
                    UserReservations.reservationsHistory = historyReservations
                    self.delegate?.goToBookingHistory()
                }
                
            } else {
                guard let cancelMessage = message?.message else {
                    print(statusCode as Any)
                    print(error?.localizedDescription as Any)
                    return
                }
                self.delegate?.unableToCancelMessage(message: cancelMessage)
            }
        }
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
        
        delegate?.updateView(currentReservation, startDate: startDate, bookingTypeName: bookingTypeName, startHour: startHour, endHour: endHour)
        
        businessDays = business_hours
        seatsQty = "Até \(seats) pessoas"
        spaceAddress = "\(street), \(complement), \(streetNumber), \(neighborhood), \(city) \n \(state) \(postalCode), BR"
    }
}
