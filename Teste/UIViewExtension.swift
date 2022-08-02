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
        
        case alert = "alert"
        case arrowBlue = "arrowBlue"
        case arrowPink = "arrowPink"
        case arrowWhite = "arrowWhite"
        case backBlue_1 = "backBlue"
        case backBlue_2 = "backBlue2"
        case backPink = "backPink"
        case backWhite = "backWhite"
        case calendarGray = "calendarGray"
        case calendarPink = "calendarPink"
        case circle_1 = "circle"
        case circle_2 = "circle2"
        case circle_3 = "circle3"
        case circle_4 = "circle4"
        case circle_5 = "circle5"
        case circle_6 = "circle6"
        case exitBlue = "exitBlue"
        case exitGray = "exitGray"
        case eyeClose = "eyeClose"
        case eyeCloseRed = "eyeCloseRed"
        case eyeOpen = "eyeOpen"
        case eyeOpenRed = "eyeOpenRed"
        case filter = "filter"
        case filterPink = "filterPink"
        case filterWhite = "filterWhite"
        case heartBlack = "heartBlack"
        case heartPink = "heartPink"
        case locationBlue = "locationBlue"
        case locationGray = "locationGray"
        case locationPink = "locationPink"
        case photoPink = "photoPink"
        case userLoginGray = "userLoginGray"
        case userLoginPink = "userLoginPink"
        case xmarkBlue_1 = "xmarkBlue"
        case xmarkBlue_2 = "xmarkBlue2"
    }
    
    public enum ColorsBravve: String {
    
        case background = "background"
        case backgroundBravve = "backgroundBravve"
        case blue = "blueNav"
        case borderBottomTexfield = "borderBottomTexfield"
        case boxOffice = "boxOffice"
        case buttonGray = "buttonGray"
        case buttonPink = "buttonPink"
        case buttonRecoveryPassword = "buttonRecoveryPassword"
        case buttonUnderline = "buttonUnderline"
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
        case reservedCancel = "reservedCancel"
        case searchBar = "searchBar"
        case textField = "textField"
        case textFieldBackground = "textFieldBackground"
        case textFieldBorder = "textFieldBorder"
    }
    
    public enum IconsBravve: String {
    
        case activiesBlue = "activiesBlue"
        case activiesGray = "activiesGray"
        case activiesPink = "activiesPink"
        case book = "book"
        case calendarBlue = "calendarBlue"
        case calendarGray = "calendarGray"
        case calendarPink = "calendarPink"
        case cellBlue = "cellBlue"
        case cellGray = "cellGray"
        case cellPink = "cellPink"
        case checkBlue = "checkBlue"
        case checkPink = "checkPink"
        case clock = "clock"
        case creditBlue = "creditBlue"
        case creditGray = "creditGray"
        case creditPink = "creditPink"
        case edit_blue = "edit-blue"
        case edit = "edit"
        case ellipseGray = "Ellipse gray"
        case ellipseGreen = "Ellipse green"
        case ellipseRed = "Ellipse red"
        case emailBlue = "emailBlue"
        case emailGray = "emailGray"
        case emailPink = "emailPink"
        case hobbiesBlue = "hobbiesBlue"
        case hobbiesGray = "hobbiesGray"
        case hobbiesPink = "hobbiesPink"
        case info_circle = "info-circle"
        case noteBlue = "noteBlue"
        case noteGray = "noteGray"
        case notePink = "notePink"
        case padlockBlue = "padlockBlue"
        case padlockGray = "padlockGray"
        case padlockPink = "padlockPink"
        case pencilBlue = "pencilBlue"
        case pencilGray = "pencilGray"
        case pencilPink = "pencilPink"
        case photoBlue = "photoBlue"
        case photoGray = "photoGray"
        case photoPink = "photoPink"
        case photoWhite = "photoWhite"
        case questionCircleBlue_1 = "questionCircleBlue"
        case questionCircleBlue_2 = "questionCircleBlue2"
        case questionCirclePink = "questionCirclePink"
        case userBlue = "userBlue"
        case userGray = "userGray"
        case userPink = "userPink"
        case users = "users"
    }

    public enum ImagesBravve: String {
    
        case homeOpen = "homeOpen"
        case homeOpen2 = "homeOpen2"
        case homeOpen3 = "homeOpen3"
        case homeOpen4 = "homeOpen4"
        case imageReservs_1 = "imageReservs"
        case imageReservs_2 = "imageReservs2"
        case imageReservs_3 = "imageReservs3"
        case imageReservs_4 = "imageReservs4"
        case logoBlue = "logoBlue"
        case logoWhite = "logoWhite"
        case imageReservsNav = "imageReservsNav"
        case wayActivies = "wayActivies"
        case wayCell = "wayCell"
        case wayConfirm = "wayConfirm"
        case wayEmail = "wayEmail"
        case wayFinalCadaster_1 = "wayFinalCadaster"
        case wayFinalCadaster_2 = "wayFinalCadaster2"
        case wayLogin = "wayLogin"
        case wayName = "wayName"
        case wayPassword = "wayPassword"
        case wayReserv_1 = "wayReserv"
        case wayReserv_2 = "wayReserv2"
    }

    public enum Ride: CGFloat {
    
        case up = 1
        case down = -1
    }
}

//Extension related to verification of size of screen of a ViewController
extension UIView {
    
    open func isIpad() -> Bool {
        
        if UIScreen.main.traitCollection.horizontalSizeClass == .regular {
            
            return true
        }
        return false
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
        backButton.setImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
        backButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = viewTitle
        
        if isIpad() {
            
            titleLabel.font = UIFont(name: FontsBravve.medium.rawValue, size: 30)
        }
        else {
            
            titleLabel.font = UIFont(name: FontsBravve.medium.rawValue, size: 19)
        }
        titleLabel.textColor = .white
        
        self.addSubviews([backButton, titleLabel])
        
        titleLabel.constraintInsideTo(.centerY, self, 15)
        titleLabel.constraintInsideTo(.centerX, self)
        
        backButton.constraintInsideTo(.centerY, titleLabel)
        backButton.constraintInsideTo(.leading, self, 35)
        backButton.constraintInsideTo(.height, self, multiplier: 1)
        backButton.constraintInsideTo(.width, self, multiplier: 0.2)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.15)
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
        leftButton.setImage(UIImage(named: ButtonsBravve.arrowWhite.rawValue), for: .normal)
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
        rightButton.setImage(UIImage(named: ButtonsBravve.arrowWhite.rawValue), for: .normal)
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
