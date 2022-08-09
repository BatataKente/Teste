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
    open func isIpad() -> Bool {
        
        if UIScreen.main.traitCollection.userInterfaceIdiom == .pad {
            
            return true
        }
        return false
    }
}

//Extensions related to default elements
extension UIView {
    
/// This function changes the background to the app's default
    open func setToDefaultBackgroundColor() {
        
        self.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
    }
    
/// This function creates a standard bar that appears in the register part, this bar contains a back button the logo, and it contains a skip button and also comes with a progressbar
/// - Parameters:
///   - imageName: A ButtonsBravve enum referring to the images name of the button name available in assets
///   - progressBarButtons: The progress bar buttons to be placed in a stackview below the logo
///   - handler: The action of back button
///   - hideJumpButton: set false if show a jump button
    open func createRegisterCustomBar(_ imageName: ButtonsBravve = .backWhite,
                                      progressBarButtons: [UIButton]? = nil,
                                      _ handler: @escaping UIActionHandler,
                                      hideJumpButton: Bool = true) {
        
        let backButton = UIButton()
        backButton.configuration = .plain()
        backButton.configuration?.image = UIImage(named: ButtonsBravve.backPink.rawValue)
        backButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let jumpButton = UIButton()
        jumpButton.configuration = .plain()
        jumpButton.isHidden = hideJumpButton
        
        let attribute = [NSAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,
                                                             size: CGFloat(15).generateSizeForScreen),
                        NSAttributedString.Key.foregroundColor: UIColor(named: ColorsBravve.blue.rawValue)]
        
        let attributedTitle = NSAttributedString(string: "Pular",
                                                 attributes: attribute as [NSAttributedString.Key : Any])
       
        jumpButton.configuration?.attributedTitle = AttributedString(attributedTitle)
        
        jumpButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: ImagesBravve.logoBlue.rawValue)
        
        self.addSubviews([backButton, logoImageView, jumpButton])
        
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
        
        jumpButton.constraintInsideTo(.centerY, logoImageView)
        jumpButton.constraintInsideTo(.height, logoImageView)
        jumpButton.constraintInsideTo(.trailing, self.safeAreaLayoutGuide,
                                      CGFloat(30).generateSizeForScreen)
    }
    
/// This function transforms a view into a bar with a back button and title
/// - Parameters:
///   - viewTitle: The title in the center of the custom bar
///   - handler: The action of back button
    open func setToDefaultCustomBarWithBackButton(viewTitle: String,
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
        backButton.constraintInsideTo(.leading, self, CGFloat(35).generateSizeForScreen)
        backButton.constraintInsideTo(.height, self, multiplier: 0.5)
        backButton.constraintOutsideTo(.width, backButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(125).generateSizeForScreen)
    }
    
/// This function transforms a view into a bar with a filter
    open func setToDefaultCustomBarWithFilter(states: [States], _ handler: @escaping UIActionHandler) {
        
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
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        let chosedLabelFont = UIFont(name: FontsBravve.light.rawValue,
                                     size: CGFloat(16).generateSizeForScreen)
        let buttonsImage = ButtonsBravve.arrowDown.rawValue
        
        let stateHandler = {(action: UIAction) in

            stateChosedLabel.text = action.title
            stateLabel.font = smallFont
        }

        stateLabel.text = "UF"
        stateLabel.font = initialFont
        var actions = [UIAction]()
        stateChosedLabel.font = chosedLabelFont
        
        for state in states {
            actions.append(UIAction(title: state.code,handler: stateHandler))
        }
        leftButton.setMenuForButton(actions)
        leftButton.setImage(UIImage(named: buttonsImage), for: .normal)
        
        let cityHandler = {(action: UIAction) in

            cityChosedLabel.text = action.title
            cityLabel.font = smallFont
        }
        
        cityLabel.text = "Cidade"
        cityLabel.font = initialFont
        cityChosedLabel.font = chosedLabelFont
        rightButton.setMenuForButton([

            UIAction(title: "action1",handler: cityHandler),
            UIAction(title: "action2",handler: cityHandler)

        ])
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
        stackView.constraintOutsideTo(.trailing, filterButton, CGFloat(5).generateSizeForScreen)
        
        filterButton.constraintInsideTo(.centerY, stackView)
        filterButton.constraintInsideTo(.trailing, self, CGFloat(10).generateSizeForScreen)
        filterButton.constraintInsideTo(.height, stackView)
        filterButton.constraintOutsideTo(.width, filterButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(125).generateSizeForScreen)
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
    open func heightAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.heightAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width of a view in a superview
/// - Parameter constant: The width of view
    open func widthAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.widthAnchor.constraint(equalToConstant: constant))
    }
    
/// This function sets the width and height of a view in a superview(square)
/// - Parameter constant: The size of view
    open func sizeAnchorInSuperview(_ constant: CGFloat = 32) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraints([
        
            self.heightAnchor.constraint(equalToConstant: constant),
            self.widthAnchor.constraint(equalToConstant: constant)
        ])
    }
    
/// This function fills a superview with the view
/// - Parameter constant: The margins of view to superview
    open func fillSuperview(_ constant: CGFloat = 0) {
        
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
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the same part. example bottom to bottom
/// - Parameters:
///   - attribute: The side that will match the side of the item(if bottom or trailing it will be the inverse to stay inside)
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from attribute
///   - multiplier: Multiplier for constant
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
    
/// This function creates the constraint of a view in a superview directed to some other view with reference to the reverse part. example bottom to top
/// - Parameters:
///   - attribute: The side that will match the inverse side of the item
///   - toItem: The item at the other point of the constraint
///   - constant: The distance from item attribute
///   - multiplier: Multiplier for constant
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
