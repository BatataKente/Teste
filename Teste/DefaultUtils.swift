//
//  DefaultUtils.swift
//  Teste
//
//  Created by Josicleison on 21/07/22.
//

import UIKit

extension UIView {
    
    open func setToDefaultBackgroundColor() {
        
        self.backgroundColor = .white
    }
}

extension UIImageView {
    
    open func setWayToDefault(_ imageName: String) {
        
        switch imageName {
            
            case "way1":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case "way2":
            
                self.image = UIImage(named: imageName)
            
            self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        
            case "way3":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case "way4":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(110)
                self.widthAnchorInSuperview(280)
            
            case "wayReservation2":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(140)
                self.widthAnchorInSuperview(150)
            
            case "wayReservation1":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(200)
                self.widthAnchorInSuperview(150)
            
            default: return
        }
    }
    
    open func setLogoToDefault(_ ImageName: String = "logoBlue") {
        
        self.image = UIImage(named: ImageName)
        
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
    
    open func setToDefaultCapsuleButton(_ buttonTitle: String,
                                        _ backgroundColor: UIColor = UIColor(named: "BlueBravve") ?? UIColor()) {

        self.configuration = .filled()
        self.configuration?.title = buttonTitle
        self.configuration?.background.backgroundColor = backgroundColor
        if backgroundColor == .white {

            self.configuration?.baseForegroundColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            self.configuration?.background.strokeWidth = 0.7
            self.configuration?.background.strokeColor = UIColor(red: 0.847, green: 0.867, blue: 0.896, alpha: 1)
        }
        self.configuration?.cornerStyle = .capsule
    }
    
    open func setToJumpButtonDefault(buttonTitle: String = "Pular",
                                     _ constant: CGFloat = 70) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.setTitleColor(UIColor(named: "BlueBravve"), for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 15)
        self.layer.cornerRadius = 8
        
        self.addBottomLineWithColor(color: UIColor(named: "BlueBravve") ?? UIColor(), width: 1, y: -7)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
    open func setToProgressBarButtonDefault(_ buttonImageName: String) {

        self.setImage(UIImage(named: buttonImageName),
                                      for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 14)
        self.setTitleColor(UIColor(named: "BlueBravve"), for: .normal)
    }
    
    open func setToButtonDefault(_ aboveWhom: Any?,
                                 buttonTitle: String = "Continuar",
                                 _ constant: CGFloat = 30) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: "PinkBravve")
        self.layer.cornerRadius = 8
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, 22)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, 22)
        
        guard let aboveWhom = aboveWhom else {return}
        
        self.constraintOutsideTo(.bottom, aboveWhom, constant)
    }
    
    open func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar") {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: "GrayBravve")
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
    }
    
    open func setToBottomButtonDefault(_ buttonTitle: String = "Continuar",
                                       colorName: String = "PinkBravve",
                                       aboveWhom: Any?) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: colorName)
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, aboveWhom)
    }
    
    open func setToBackButtonDefault(_ imageName: String = "backButtonWhite",_ constant: CGFloat = 22) {
        
        self.setImage(UIImage(named: imageName), for: .normal)
        
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
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
}
