//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extension related to default assets on app
extension UIView {

    public enum FontsBravve: String {
    
        case medium = "Ubuntu-Medium"
        case regular = "Ubuntu-Regular"
        case bold = "Ubuntu-Bold"
        case koho = "KoHo-Bold"
        case light = "Ubuntu-light"
    }
    
    public enum ButtonsBravve: String {
    
        case whiteBack = "backWhite"
        case filter = "filter"
    }

    public enum ImagesBravve: String {
    
        case exampleHomeOpen_1 = "homeOpen"
        case exampleHomeOpen_2 = "homeOpen2"
        case exampleHomeOpen_3 = "homeOpen3"
        case exampleHomeOpen_4 = "homeOpen4"
        case imageReservs_1 = "imageReservs"
        case imageReservs_2 = "imageReservs2"
        case imageReservs_3 = "imageReservs3"
        case imageReservs_4 = "imageReservs4"
        case blueLogo = "logoBlue"
        case whiteLogo = "logoWhite"
        case blueImageReservs = "imageReservsNav"
        case activiesWay = "wayActivies"
        case cellWay = "wayCell"
        case confirmWay = "wayConfirm"
        case emailWay = "wayEmail"
        case finalCadasterWay_1 = "wayFinalCadaster"
        case finalCadasterWay_2 = "wayFinalCadaster2"
        case loginWay = "wayLogin"
        case nameWay = "wayName"
        case passwordWay = "wayPassword"
        case reservWay_1 = "wayReserv"
        case reservWay_2 = "wayReserv2"
    }

    public enum IconsBravve: String {
    
        case blueActivies = "activiesBlue"
        case grayActivies = "activiesGray"
        case pinkActivies = "activiesPink"
        case book = "book"
        case blueCalendar = "calendarBlue"
        case grayCalendar = "calendarGray"
        case pinkCalendar = "calendarPink"
        case whiteBack = "backWhite"
        case filter = "filter"
    }

    public enum ColorsBravve: String {
    
        case background = "background"
        case Bravvebackground = "backgroundBravve"
        case blue = "blueNav"
        case borderBottomTexfield = "borderBottomTexfield"
        case boxOffice = "boxOffice"
        case gray = "buttonGray"
        case pink = "buttonPink"
        case recoveryPassword = "buttonRecoveryPassword"
        case underline = "buttonUnderline"
        case cards = "cards"
        case color = "Color"
        case coolWorking = "coolWorking"
        case coWorking = "coWorking"
        case grayAlertLabel = "grayAlertLabel"
        case greenAlertLabel = "greenAlertLabel"
        case hotel = "hotel"
        case label = "label"
        case textFieldLabel = "labelTextField"
        case redAlertLabel = "redAlertLabel"
        case reserved = "reserved"
        case cancelReserved = "reservedCancel"
        case searchBar = "searchBar"
        case textField = "textField"
        case textFieldBackground = "textFieldBackground"
    }

    public enum Ride: CGFloat {
    
        case up = 1
        case down = -1
    }
}

//Extensions related to default elements
extension UIView {
    
    open func setToDefaultBackgroundColor() {
        
        self.backgroundColor = .white
    }
    
    open func setToDefaultCustomBarWithBackButton(viewTitle: String, _ handler: @escaping UIActionHandler) {
        
        self.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: ButtonsBravve.whiteBack.rawValue), for: .normal)
        
        backButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = viewTitle
        titleLabel.font = UIFont(name: FontsBravve.medium.rawValue, size: 19)
        titleLabel.textColor = .white
        
        self.addSubviews([backButton, titleLabel])
        
        titleLabel.constraintInsideTo(.centerY, self, 15)
        titleLabel.constraintInsideTo(.centerX, self)
        
        backButton.constraintInsideTo(.centerY, titleLabel)
        backButton.constraintInsideTo(.leading, self, 35)
        backButton.sizeAnchorInSuperview(50)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(120)
    }
    
    open func setToDefaultCustomBarWithFilter() {
        
        self.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let leftButton = UIButton()
        let stateLabel = UILabel()
        let stateChosedLabel = UILabel()
        let rightButton = UIButton()
        let cityLabel = UILabel()
        let cityChosedLabel = UILabel()
        let margins: CGFloat = 10
        
        let stateHandler = {(action: UIAction) in

            stateChosedLabel.text = action.title
            stateLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        }

        stateLabel.text = "UF"
        leftButton.setMenuForButton([
            
            UIAction(title: "action1",handler: stateHandler),
            UIAction(title: "action2",handler: stateHandler)

        ])
        leftButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        leftButton.tintColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let cityHandler = {(action: UIAction) in

            cityChosedLabel.text = action.title
            cityLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        }
        
        cityLabel.text = "Cidade"
        rightButton.setMenuForButton([

            UIAction(title: "action1",handler: cityHandler),
            UIAction(title: "action2",handler: cityHandler)

        ])
        rightButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        rightButton.tintColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let leftStackView = UIStackView(arrangedSubviews: [stateLabel,
                                                           stateChosedLabel])
        leftStackView.axis = .vertical
        let rightStackView = UIStackView(arrangedSubviews: [cityLabel,
                                                            cityChosedLabel])
        rightStackView.axis = .vertical
        
        let stackView = UIStackView()
        
        stackView.addArrangedSubviews([leftStackView, leftButton, rightStackView, rightButton])
        
        leftStackView.constraintInsideTo(.width, stackView, multiplier: 0.2)
        leftButton.constraintInsideTo(.width, stackView, multiplier: 0.1)
        rightButton.constraintInsideTo(.width, stackView, multiplier: 0.1)
        
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        stackView.setToDefaultBackgroundColor()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: margins,
                                               right: margins)
        
        let filterButton = UIButton()
        filterButton.setImage(UIImage(named: ButtonsBravve.filter.rawValue),
                              for: .normal)
        
        self.addSubviews([filterButton, stackView])
        
        stackView.constraintInsideTo(.centerY, self, 15)
        stackView.constraintInsideTo(.leading, self, 20)
        stackView.constraintOutsideTo(.trailing, filterButton, 20)
        
        filterButton.constraintInsideTo(.centerY, stackView)
        filterButton.constraintInsideTo(.trailing, self, 20)
        filterButton.sizeAnchorInSuperview(50)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(120)
    }
}

//Extensions related to creation of elements
extension UIView {
    
    open func createSuperStackView(_ arrangedSubviews: [UIView]) {
        
        self.layer.cornerRadius = 8
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.spacing = 15
        stackView.layer.cornerRadius = 8
        stackView.backgroundColor = .yellow
        
        self.addSubview(stackView)
        
        stackView.constraintInsideTo(.top, self, Ride.down.rawValue)
        stackView.constraintInsideTo(.leading, self)
        stackView.constraintInsideTo(.trailing, self)
        stackView.constraintInsideTo(.bottom, self, Ride.up.rawValue)
    }

    func addBottomLineWithColor(color: UIColor = .gray, width: CGFloat = 0.8, y: CGFloat = 0) {

        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0,
                                        y: self.frame.size.height - width + y,
                                        width: self.frame.size.width,
                                        height: width)

        self.layer.addSublayer(bottomBorderLine)
    }
    
    func addLeadingLineWithColor(color: UIColor = .gray, height: CGFloat = 0.8, x: CGFloat = 0) {

        let leadingBorderLine = CALayer()
        leadingBorderLine.backgroundColor = color.cgColor
        leadingBorderLine.frame = CGRect(x: self.frame.size.width - height + x,
                                         y: 0,
                                         width: self.frame.size.height,
                                         height: height)

        self.layer.addSublayer(leadingBorderLine)
    }
}

//Extensions related to constraints
extension UIView {
    
    open func heightAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.heightAnchor.constraint(equalToConstant: constant))
    }
    
    open func widthAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.widthAnchor.constraint(equalToConstant: constant))
    }
    
    open func sizeAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraints([
        
            self.heightAnchor.constraint(equalToConstant: constant),
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
    }
    
    open func fillSuperview(_ constant: CGFloat = 0) {
        
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
    open func constraintTo(_ attribute: NSLayoutConstraint.Attribute,
                           _ toItem: Any?,
                           _ constant: CGFloat = 0,
                           multiplier: CGFloat = 1) {
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: toItem,
                                                    attribute: attribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
    }
        
    open func constraintInsideTo(_ attribute: NSLayoutConstraint.Attribute,
                                 _ toItem: Any?,
                                 _ constant: CGFloat = 0,
                                 multiplier: CGFloat = 1) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if attribute == .bottom || attribute == .trailing {
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                        attribute: attribute,
                                                        relatedBy: .equal,
                                                        toItem: toItem,
                                                        attribute: attribute,
                                                        multiplier: multiplier,
                                                        constant: -constant))
        }
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: toItem,
                                                    attribute: attribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
    }
    
    open func constraintOutsideTo(_ attribute: NSLayoutConstraint.Attribute,
                                  _ toItem: Any?,
                                  _ constant: CGFloat = 0,
                                  multiplier: CGFloat = 1) {
         
        translatesAutoresizingMaskIntoConstraints = false
        
        let itemAttribute: NSLayoutConstraint.Attribute
        
        switch attribute {
            
            case .top: itemAttribute = .bottom
            case .trailing: itemAttribute = .leading
            case .leading: itemAttribute = .trailing
            case .bottom: itemAttribute = .top
            default: itemAttribute = attribute
        }
        
        if attribute == .bottom || attribute == .trailing {
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                        attribute: attribute,
                                                        relatedBy: .equal,
                                                        toItem: toItem,
                                                        attribute: itemAttribute,
                                                        multiplier: multiplier,
                                                        constant: -constant))
        }
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: .equal,
                                                    toItem: toItem,
                                                    attribute: itemAttribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
    }
}

//Extensions to add multiple Subviews on a view
extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}
