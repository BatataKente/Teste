//
//  DefaultUtils.swift
//  Teste
//
//  Created by Josicleison on 21/07/22.
//

import UIKit

extension UIImageView {
    
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
    
    open func setToJumpButtonDefault(_ buttonTitle: String = "Pular",
                                     _ constant: CGFloat = 70) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 15)
        self.layer.cornerRadius = 8
        
        self.addBottomLineWithColor(color: .blue, width: 1, y: -7)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
    open func setToProgressBarButtonDefault(_ buttonImageName: String) {

        self.setImage(UIImage(named: buttonImageName),
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
