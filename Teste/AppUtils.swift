//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

extension UIStackView {
    
    open func createProgressBarButtons(_ buttonImageNames: [String]) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for name in buttonImageNames {
            
            let button = UIButton()
            button.setImage(UIImage(systemName: name), for: .normal)
            
            button.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 14)
            button.setTitleColor(.black, for: .normal)
            button.tintColor = .gray
            
            self.addArrangedSubview(button)
            buttons.append(button)
        }
        
        return buttons
    }
}

extension UIView {
    
    open func createSuperStackView(_ arrangedSubviews: [UIView]) {
        
        self.layer.cornerRadius = 8
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.spacing = 15
        stackView.layer.cornerRadius = 8
        stackView.backgroundColor = .yellow
        
        self.addSubview(stackView)
        
        stackView.constraintInsideTo(.top, self, -1)
        stackView.constraintInsideTo(.leading, self)
        stackView.constraintInsideTo(.trailing, self)
        stackView.constraintInsideTo(.bottom, self, 1)
    }
}

extension UILabel {
    
    open func setToDefault(text: String = "",
                           _ textAlignment: NSTextAlignment = .center) {
        
        self.text = text
        self.font = UIFont(name: "Ubuntu-Light", size: 16)
        self.numberOfLines = 0
        self.textAlignment = textAlignment
    }
}

extension UIButton {
    
    open func setToJumpButtonDefault(_ buttonImageName: String = "Pular",
                                   _ constant: CGFloat = 70) {
        
        self.setTitle(buttonImageName, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 15)
        self.layer.cornerRadius = 8
        
        self.addBottomLineWithColor(color: .blue, width: 1, y: -7)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
    open func setToProgressBarButtonDefault(_ buttonImageName: String) {

        self.setImage(UIImage(systemName: buttonImageName),
                                      for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 14)
        self.setTitleColor(.black, for: .normal)
        self.tintColor = .gray
    }
    
    open func setToButtonDefault(_ aboveWhom: Any?,
                                 _ buttonTitle: String = "Continuar",
                                 _ constant: CGFloat = 30) {
        
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = .gray
        self.layer.cornerRadius = 8
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, 22)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, 22)
        
        guard let aboveWhom = aboveWhom else {return}
        
        self.constraintOutsideTo(.bottom, aboveWhom, constant)
    }
    
    open func setToBottomButtonDefault(_ buttonTitle: String = "Continuar") {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = .gray
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
    }
    
    open func setToBackButtonDefault() {
        
        self.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        self.tintColor = UIColor(named: "BravveColor")
        
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, 22)
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, 65)
        
        if UIScreen.main.traitCollection.horizontalSizeClass == .regular {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.05)
            self.widthAnchorInSuperview(50)
        }
        else {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.05)
            self.widthAnchorInSuperview(50)
        }
    }
    
    open func setMenuForButton(_ menuItens: [UIAction]) {
        
        self.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        self.tintColor = .systemBlue
        self.menu = UIMenu(children: menuItens)
        self.showsMenuAsPrimaryAction = true
        self.changesSelectionAsPrimaryAction = true
    }
}

extension UIImageView {
    
    open func setLogoToDefault() {
        
        self.image = UIImage(named: "BravveIcon")
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, 65)
        
        if UIScreen.main.traitCollection.horizontalSizeClass == .regular {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.045)
            self.constraintInsideTo(.width, superview?.safeAreaLayoutGuide, multiplier: 0.20)
        }
        else {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.05)
            self.constraintInsideTo(.width, superview?.safeAreaLayoutGuide, multiplier: 0.3)
        }
    }
}

extension UIViewController {
    
    open func isIpad() -> Bool {
        
        if UIScreen.main.traitCollection.horizontalSizeClass == .regular {
            
            return true
        }
        return false
    }
}

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
    
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

extension UIView {

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
