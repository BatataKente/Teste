//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extension related to verification of size of screen of a ViewController
extension UIView {
    
/// This function checks whether the device is an ipad or not
/// - Returns: True if is Ipad of false if not
    func isIpad() -> Bool {
        
        if UIScreen.main.traitCollection.userInterfaceIdiom == .pad {
            
            return true
        }
        return false
    }
}

//Extensions related to default elements
extension UIView {
    
/// This function changes the background to the app's default
    func setToDefaultBackgroundColor() {
        
        self.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
    }
    
/// This function creates a standard bar that appears in the register part, this bar contains a back button the logo, and it contains a skip button and also comes with a progressbar
/// - Parameters:
///   - imageName: A ButtonsBravve enum referring to the images name of the button name available in assets
///   - progressBarButtons: The progress bar buttons to be placed in a stackview below the logo
///   - hideJumpButton: set false if show a jump button
///   - jumpAction: The action of jump button
///   - backHandler: The action of back button
    func createRegisterCustomBar(_ imageName: ButtonsBravve = .backWhite,
                                      progressBarButtons: [UIButton]? = nil,
                                      hideJumpButton: Bool = true,
                                      jumpAction: UIAction? = nil,
                                      _ backHandler: @escaping UIActionHandler) {
        
        let backButton = UIButton()
        backButton.configuration = .plain()
        backButton.configuration?.image = UIImage(named: ButtonsBravve.backPink.rawValue)
        
        backButton.addAction(UIAction(handler: backHandler), for: .touchUpInside)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: ImagesBravve.logoBlue.rawValue)
        
        self.addSubviews([backButton, logoImageView])
        
        if let jumpAction = jumpAction {
            
            let jumpButton = UIButton()
            jumpButton.configuration = .plain()
            
            let attribute = [NSAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,
                                                                 size: CGFloat(15).generateSizeForScreen),
                            NSAttributedString.Key.foregroundColor: UIColor(named: ColorsBravve.blue_cyan.rawValue)]
            
            let attributedTitle = NSAttributedString(string: "Pular",
                                                     attributes: attribute as [NSAttributedString.Key : Any])
           
            jumpButton.configuration?.attributedTitle = AttributedString(attributedTitle)
            
            jumpButton.addAction(jumpAction, for: .touchUpInside)
            
            self.addSubview(jumpButton)
            
            jumpButton.constraintInsideTo(.centerY, logoImageView)
            jumpButton.constraintInsideTo(.height, logoImageView)
            jumpButton.constraintInsideTo(.trailing, self.safeAreaLayoutGuide,
                                          CGFloat(30).generateSizeForScreen)
        }
        
        if let progressBarButtons = progressBarButtons {
            
            let progressBarStackView = UIStackView(arrangedSubviews: progressBarButtons)
            
            self.addSubview(progressBarStackView)
            
            progressBarStackView.constraintOutsideTo(.top, logoImageView,
                                                     CGFloat(60).generateSizeForScreen)
            progressBarStackView.constraintInsideTo(.centerX,
                                                    self.safeAreaLayoutGuide)
        }
        
        logoImageView.constraintInsideTo(.centerX, self.safeAreaLayoutGuide)
        logoImageView.constraintInsideTo(.top, self, CGFloat(65).generateSizeForScreen)
        
        logoImageView.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)
        logoImageView.widthAnchorInSuperview(CGFloat(140).generateSizeForScreen)
        
        backButton.imageView?.heightAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        backButton.imageView?.constraintOutsideTo(.width, backButton.imageView,
                                                  multiplier: 0.6)
        backButton.imageView?.constraintInsideTo(.centerY, backButton)
        
        backButton.constraintInsideTo(.centerY, logoImageView)
        backButton.constraintInsideTo(.height, logoImageView)
        backButton.constraintOutsideTo(.width, backButton)
        backButton.constraintInsideTo(.leading, self.safeAreaLayoutGuide,
                                      CGFloat(30).generateSizeForScreen)
    }
    
/// This function creates a standard bar that appears in the Reservation part, this bar contains a back button the logo, and also comes with a progressbar
/// - Parameters:
///   - progressBarButtons: The progress bar buttons to be placed in a stackview below the logo
///   - backHandler: The action of back button
    func createReservationCustomBar(progressBarButtons: [UIButton]? = nil,
                                    _ backHandler: @escaping UIActionHandler) {
        
        let backButton = UIButton()
        backButton.configuration = .plain()
        backButton.configuration?.image = UIImage(named: ButtonsBravve.backWhite.rawValue)
        
        let titleLabel = UILabel()
        titleLabel.text = "Nome do espaço"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                 size: CGFloat(16).generateSizeForScreen)
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = "Nome do local parceiro"
        subTitleLabel.textColor = .white
        subTitleLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                    size: CGFloat(16).generateSizeForScreen)
        
        backButton.addAction(UIAction(handler: backHandler), for: .touchUpInside)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImagesBravve.imageReservsNav.rawValue)
        
        self.addSubviews([imageView, backButton, titleLabel, subTitleLabel])
        
        if let progressBarButtons = progressBarButtons {
            
            let progressBarStackView = UIStackView(arrangedSubviews: progressBarButtons)
            
            self.addSubview(progressBarStackView)
            
            progressBarStackView.constraintOutsideTo(.top, imageView,
                                                     CGFloat(20).generateSizeForScreen)
            progressBarStackView.constraintInsideTo(.centerX,
                                                    self.safeAreaLayoutGuide)
        }
        
        imageView.constraintInsideTo(.top, self)
        imageView.constraintInsideTo(.leading, self)
        imageView.constraintInsideTo(.trailing, self)
        
        imageView.heightAnchorInSuperview(CGFloat(150).generateSizeForScreen)
        
        backButton.imageView?.heightAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        backButton.imageView?.constraintOutsideTo(.width, backButton.imageView,
                                                  multiplier: 0.6)
        backButton.imageView?.constraintInsideTo(.centerY, backButton)
        
        titleLabel.constraintInsideTo(.centerX, imageView)
        titleLabel.constraintOutsideTo(.bottom, subTitleLabel, CGFloat(5).generateSizeForScreen)
        
        subTitleLabel.constraintInsideTo(.centerX, imageView)
        subTitleLabel.constraintInsideTo(.bottom, imageView, CGFloat(20).generateSizeForScreen)
        
        backButton.constraintInsideTo(.centerY, imageView)
        backButton.constraintInsideTo(.height, imageView)
        backButton.constraintOutsideTo(.width, backButton)
        backButton.constraintInsideTo(.leading, self.safeAreaLayoutGuide,
                                      CGFloat(30).generateSizeForScreen)
    }
    
/// This function transforms a view into a bar with a back button and title
/// - Parameters:
///   - viewTitle: The title in the center of the custom bar
///   - handler: The action of back button
    func setToDefaultCustomBarWithBackButton(viewTitle: String,
                                                  _ handler: @escaping UIActionHandler) {
        
        self.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
        backButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = viewTitle
        
        let size = CGFloat(20).generateSizeForScreen
        titleLabel.font = UIFont(name: FontsBravve.medium.rawValue, size: size)
        titleLabel.textColor = .white
        
        self.addSubviews([backButton, titleLabel])
        
        backButton.imageView?.constraintInsideTo(.centerY, backButton)
        backButton.imageView?.heightAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        backButton.imageView?.constraintOutsideTo(.width, backButton.imageView,
                                                  multiplier: 0.6)
        
        titleLabel.constraintInsideTo(.centerY, self, CGFloat(15).generateSizeForScreen)
        titleLabel.constraintInsideTo(.centerX, self)
        
        backButton.constraintInsideTo(.centerY, titleLabel)
        backButton.constraintInsideTo(.leading, self, CGFloat(20).generateSizeForScreen)
        backButton.constraintOutsideTo(.width, backButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(125).generateSizeForScreen)
    }
    
/// This function transforms a view into a bar with a filter
/// - Parameter handler: The action of filter Button
/// - Returns: A struct with bar view elements
    func setToDefaultCustomBarWithFilter(_ handler: @escaping UIActionHandler) -> CustomBarWithFilter {
        
        self.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let leftButton = UIButton()
        let stateLabel = UILabel()
        let stateChosedLabel = UILabel()
        let rightButton = UIButton()
        let cityLabel = UILabel()
        let cityChosedLabel = UILabel()
        let margins: CGFloat = 10
        let initialFont = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(15).generateSizeForScreen)
        let chosedLabelFont = UIFont(name: FontsBravve.light.rawValue,
                                     size: CGFloat(16).generateSizeForScreen)
        let buttonsImage = ButtonsBravve.arrowDown.rawValue

        stateLabel.text = "UF"
        stateLabel.font = initialFont
        stateChosedLabel.font = chosedLabelFont
        
        leftButton.setImage(UIImage(named: buttonsImage), for: .normal)
        
        cityLabel.text = "Cidade"
        cityLabel.font = initialFont
        cityChosedLabel.font = chosedLabelFont
        rightButton.setImage(UIImage(named: buttonsImage), for: .normal)
        
        let leftStackView = UIStackView(arrangedSubviews: [stateLabel,
                                                           stateChosedLabel])
        leftStackView.axis = .vertical
        let rightStackView = UIStackView(arrangedSubviews: [cityLabel,
                                                            cityChosedLabel])
        rightStackView.isLayoutMarginsRelativeArrangement = true
        rightStackView.layoutMargins = UIEdgeInsets(top: 0,
                                                    left: 15,
                                                    bottom: 0,
                                                    right: 0)
        rightStackView.axis = .vertical
        
        let stackView = UIStackView()
        
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.pink_cyan.rawValue)
        
        stackView.addArrangedSubviews([leftStackView, leftButton,
                                       view,
                                       rightStackView, rightButton])
        stackView.layer.cornerRadius = 8
        stackView.backgroundColor = UIColor(named: ColorsBravve.searchBar.rawValue)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: margins,
                                               right: 5)
        
        let filterButton = UIButton()
        filterButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        filterButton.setImage(UIImage(named: ButtonsBravve.filter.rawValue),
                              for: .normal)
        
        self.addSubviews([filterButton, stackView])
        
        leftStackView.constraintInsideTo(.width, stackView, multiplier: 0.15)
        leftButton.constraintInsideTo(.width, stackView, multiplier: 0.1)
        leftButton.imageView?.constraintInsideTo(.centerY, leftButton)
        leftButton.imageView?.widthAnchorInSuperview(CGFloat(10).generateSizeForScreen)
        leftButton.imageView?.heightAnchorInSuperview(CGFloat(6.2).generateSizeForScreen)
        rightButton.constraintInsideTo(.width, leftButton)
        rightButton.imageView?.constraintInsideTo(.centerY, rightButton)
        rightButton.imageView?.widthAnchorInSuperview(CGFloat(10).generateSizeForScreen)
        rightButton.imageView?.heightAnchorInSuperview(CGFloat(6.2).generateSizeForScreen)
        view.widthAnchorInSuperview(0.65)
        
        stackView.constraintInsideTo(.centerY, self, CGFloat(15).generateSizeForScreen)
        stackView.constraintInsideTo(.leading, self, CGFloat(20).generateSizeForScreen)
        stackView.constraintOutsideTo(.trailing, filterButton,
                                      CGFloat(5).generateSizeForScreen)
        stackView.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        
        filterButton.constraintInsideTo(.centerY, stackView)
        filterButton.constraintInsideTo(.trailing, self, CGFloat(10).generateSizeForScreen)
        filterButton.constraintInsideTo(.height, stackView)
        filterButton.constraintOutsideTo(.width, filterButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(125).generateSizeForScreen)
        
        return CustomBarWithFilter(stackView: stackView,
                                   leftButton: leftButton,
                                   stateLabel: stateLabel,
                                   stateChosedLabel: stateChosedLabel,
                                   rightButton: rightButton,
                                   cityLabel: cityLabel,
                                   cityChosedLabel: cityChosedLabel)
    }
}

//Extensions related to creation of elements
extension UIView {
    
/// This function adds a line below a view
/// - Parameters:
///   - color: The color of line
///   - width: The width of line
///   - y: Position y of the line
    func addBottomLineWithColor(color: UIColor = .gray, width: CGFloat = 0.8, y: CGFloat = 0) {

        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0,
                                        y: self.frame.size.height - width + y,
                                        width: self.frame.size.width,
                                        height: width)

        self.layer.addSublayer(bottomBorderLine)
    }
}

//Extensions related to constraints
extension UIView {
    
/// This function sets the height of a view in a superview
/// - Parameter constant: The height of view
    func heightAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.heightAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width of a view in a superview
/// - Parameter constant: The width of view
    func widthAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.widthAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width and height of a view in a superview(square)
/// - Parameter constant: The size of view
    func sizeAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraints([
        
            self.heightAnchor.constraint(equalToConstant: constant),
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
    }
    
/// This function fills a superview with the view
/// - Parameter constant: The margins of view to superview
    func fillSuperview(_ constant: CGFloat = 0) {
        
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
/// This function creates the constraint of a view in a superview directed to some other view
/// - Parameters:
///   - attribute: The side that will match the side of the item
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from attribute
///   - multiplier: Multiplier for constant
    func constraintTo(_ attribute: NSLayoutConstraint.Attribute,
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
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the same part. example bottom to bottom
/// - Parameters:
///   - attribute: The side that will match the side of the item(if bottom or trailing it will be the inverse to stay inside)
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from attribute
///   - multiplier: Multiplier for constant
    func constraintInsideTo(_ attribute: NSLayoutConstraint.Attribute,
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
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the reverse part. example bottom to top
/// - Parameters:
///   - attribute: The side that will match the inverse side of the item
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from item attribute
///   - multiplier: Multiplier for constant
    func constraintOutsideTo(_ attribute: NSLayoutConstraint.Attribute,
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
            case .height: itemAttribute = .width
            case .width: itemAttribute = .height
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
    
/// This function add an array of views as subviews
/// - Parameter views: Views to add
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}

extension UIView {
    func getTitleLabelBackgroundColor(_ text: String) -> UIColor {
        switch text {
        case "COWORKING": return UIColor(named: ColorsBravve.coWorking.rawValue) ?? .black
        case "COOLWORKING": return UIColor(named: ColorsBravve.coolWorking.rawValue) ?? .black
        case "HOTEL": return UIColor(named: ColorsBravve.hotel.rawValue) ?? .black
        case "BOXOFFICE": return UIColor(named: ColorsBravve.boxOffice.rawValue) ?? .black
        default: return .white
        }
    }
}

extension UIView {
    
/// This Functions shows an view like a window
/// - Parameters:
///   - size: The size of the window
///   - origin: The origin of the window
///   - orientation: The orientation to show the window
    func showLikeAWindow(size: CGSize,
                         origin: CGPoint,
                         _ orientation: Orientation = .downRight) {
        
        self.frame.origin = origin
        
        let timing: (duration: CGFloat,
                     delay: CGFloat) = (duration: 0.3,
                                        delay: 0.1)
        
        if self.frame.size == .zero {
            
            switch orientation {
                
                case .downLeft:
                
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        self.frame.origin.x -= size.width
                        self.frame.size = size
                    }
                
                case .downRight:
                    
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        self.frame.size = size
                    }
                
                case .upLeft:
                
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        self.frame.origin.x -= size.width
                        self.frame.origin.y -= size.height
                        self.frame.size = size
                    }
                
                case .upRight:
                
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        self.frame.origin.y -= size.height
                        self.frame.size = size
                    }
                
                default:
                
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {

                        self.frame.origin.x -= size.width/2
                        self.frame.origin.y -= size.height/2
                        self.frame.size = size
                    }
            }
        }
        else {
            
            self.frame.size = .zero
        }
    }
}
