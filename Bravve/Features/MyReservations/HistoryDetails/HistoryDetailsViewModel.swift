//
//  HistoryDetailsViewModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 25/08/22.
//

import UIKit

class HistoryDetailsViewModel {
    
    func getReservation(currentReservation: inout Reservations?) -> Reservations? {
        for reservation in UserReservations.reservationsHistory {
            if reservation.id == UserReservations.reservationHistoryID {
                currentReservation = reservation
            }
        }
        return currentReservation
    }
    
    func getHourString(date: String?) -> String {
        guard let date = date else { return "" }
        
        let separatedDate = date.components(separatedBy: "T")
        let separatedHour = separatedDate[1].components(separatedBy: ":")
        let hourString = "\(separatedHour[0]):\(separatedHour[1])"
        
        return hourString
    }
    
    func getDateString(date: String?) -> String {
        guard let date = date else { return "" }
        
        let separatedDate = date.components(separatedBy: "T")
        let formatDate = separatedDate[0].components(separatedBy: "-")
        let dateString = "\(formatDate[2])/\(formatDate[1])/\(formatDate[0])"
        
        return dateString
    }
    
    func sortBusinessHours(businessHours: inout [SpaceBusinessHours]) {
        businessHours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            
            print(lhs)
            print(rhs)
            return lhsWeekDay < rhsWeekDay
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
    
    func createSeeButtonsStackView(_ range: ClosedRange<Int>,
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
        moreButton.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
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
}
