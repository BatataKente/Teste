//
//  DetalhesAbertoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class DetailsClosedViewModel {
    
    func verifyContacts(_ contacts: [SpaceContact]?) -> [SpaceContact] {
        
        if let spaceContact = contacts {

            if !spaceContact.isEmpty {

                return spaceContact
            }
        }
        
        return [SpaceContact(id: 0,
                             name: " ",
                             email: " ",
                             phone: " ",
                             message: " ")]
    }
    
    private func createStackView(_ text: String? = nil, attributedText: NSAttributedString? = nil,
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
    
    func createSeeButtonsStackView(_ range: ClosedRange<Int>,
                                   itens: [UIStackView],
                                   titleColor: ColorsBravve = .pink_cyan,
                                   arrowDownImage: UIImage?,
                                   arrowUpImage: UIImage?) -> UIButton{
        
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

                itens[i].isHidden = !itens[i].isHidden
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
    
    func sortBusinessHours(businessHours: inout [SpaceBusinessHours]) {
        businessHours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            
            print(lhs)
            print(rhs)
            return lhsWeekDay < rhsWeekDay
        }
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
    
    func createFacilitiesArray(facilities: [SpaceFacility]?) -> [String] {
        
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
    
    func createItensStackView(itens: inout [UIStackView], texts: [String]? = nil, attributedTexts: [NSAttributedString]? = nil, textColor: UIColor, seats_qty: Int, street: String, neighborhood: String, streetNumber: Int, cityName: String, stateName: String, postalCode: String) {
        
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
    
    func addItemsInStructureStackView(texts: [String], itens: inout [UIStackView], structureStackView: UIStackView, textColor: UIColor?, title: UILabel, seeMoreColor: ColorsBravve, arrowUpImage: UIImage?, arrowDownImage: UIImage?) {
        
        if texts.count < 7 {
            for text in texts {
                itens.append(createStackView(text, textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
                
            }
            structureStackView.addArrangedSubviews([title] + itens)
        } else {
            for i in 0...5 {
                
                itens.append(createStackView(texts[i], textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
            }
            
            for i in 6...texts.count - 1 {
                
                itens.append(createStackView(texts[i], isHidden: true, textColor: textColor, font: UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)))
            }
            
            let button = createSeeButtonsStackView(6...itens.count-1, itens: itens, titleColor: seeMoreColor, arrowDownImage: arrowDownImage, arrowUpImage: arrowUpImage)
            structureStackView.addArrangedSubviews([title] + itens + [button])
        }
    }
}
