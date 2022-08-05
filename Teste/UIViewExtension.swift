//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

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
        
        self.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
    }
    
    open func createRegisterCustomBar(_ imageName: ButtonsBravve = .backWhite,
                                      progressBarButtons: [UIButton],
                                      _ handler: @escaping UIActionHandler) {
        
        let backButton = UIButton()
        backButton.configuration = .plain()
        backButton.configuration?.image = UIImage(named: ButtonsBravve.backPink.rawValue)
        backButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let jumpButton = UIButton()
        jumpButton.configuration = .plain()
        
        let attribute = [NSAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,
                                                             size: CGFloat(15).generateSizeForScreen),
                        NSAttributedString.Key.foregroundColor: UIColor(named: ColorsBravve.blue.rawValue)]
        
        let attributedTitle = NSAttributedString(string: "Pular",
                                                 attributes: attribute as [NSAttributedString.Key : Any])
       
        jumpButton.configuration?.attributedTitle = AttributedString(attributedTitle)
        
        jumpButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: ImagesBravve.logoBlue.rawValue)
        
        let progressBarStackView = UIStackView(arrangedSubviews: progressBarButtons)
        
        self.addSubviews([backButton, logoImageView, jumpButton, progressBarStackView])
        
        logoImageView.constraintInsideTo(.centerX, self.safeAreaLayoutGuide)
        logoImageView.constraintInsideTo(.top, self.safeAreaLayoutGuide, 65)
        
        logoImageView.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)
        logoImageView.widthAnchorInSuperview(CGFloat(140).generateSizeForScreen)
        
        backButton.imageView?.heightAnchorInSuperview(CGFloat(14).generateSizeForScreen)
        backButton.imageView?.widthAnchorInSuperview(CGFloat(8.48).generateSizeForScreen)
        backButton.imageView?.constraintInsideTo(.centerY, backButton)
        
        backButton.constraintInsideTo(.centerY, logoImageView)
        backButton.constraintInsideTo(.height, logoImageView)
        backButton.constraintOutsideTo(.width, backButton)
        backButton.constraintInsideTo(.leading, self.safeAreaLayoutGuide, CGFloat(30).generateSizeForScreen)
        
        jumpButton.constraintInsideTo(.centerY, logoImageView)
        jumpButton.constraintInsideTo(.height, logoImageView)
        jumpButton.constraintInsideTo(.trailing, self.safeAreaLayoutGuide, CGFloat(30).generateSizeForScreen)
            
        progressBarStackView.constraintInsideTo(.top,
                                                self.safeAreaLayoutGuide,
                                                self.frame.size.height*0.2)
        progressBarStackView.constraintInsideTo(.centerX,
                                                self.safeAreaLayoutGuide)
    }
    
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
        
        titleLabel.constraintInsideTo(.centerY, self, 15)
        titleLabel.constraintInsideTo(.centerX, self)
        
        backButton.constraintInsideTo(.centerY, titleLabel)
        backButton.constraintInsideTo(.leading, self, 35)
        backButton.constraintInsideTo(.height, self, multiplier: 0.5)
        backButton.constraintOutsideTo(.width, backButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(120).generateSizeForScreen)
    }
    
    open func setToDefaultCustomBarWithFilter(states: [States]) {
        
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
        stateChosedLabel.font = chosedLabelFont
        var actions: [UIAction] = []
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
        filterButton.constraintInsideTo(.height, stackView)
        filterButton.constraintOutsideTo(.width, filterButton)
        
        self.constraintInsideTo(.top, superview)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.heightAnchorInSuperview(CGFloat(120).generateSizeForScreen)
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
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}
