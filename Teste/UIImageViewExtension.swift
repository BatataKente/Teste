//
//  ExtensionUIImageView.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Extensions related to set imageViews to Default
extension UIImageView {
    
    open func setWayToDefault(_ imageName: String) {
        
        switch imageName {
            
            case ImagesBravve.wayCell.rawValue:
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case ImagesBravve.wayConfirm.rawValue:
            
                self.image = UIImage(named: imageName)
            
            self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        
            case ImagesBravve.wayEmail.rawValue:
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case ImagesBravve.wayPassword.rawValue:
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(110)
                self.widthAnchorInSuperview(280)
            
            case ImagesBravve.wayReserv_1.rawValue:
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(140)
                self.widthAnchorInSuperview(150)
            
            case ImagesBravve.wayReserv_2.rawValue:
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(200)
                self.widthAnchorInSuperview(150)
            
            default: return
        }
    }
    
    open func setLogoToDefault(_ ImageName: ImagesBravve = .logoBlue) {
        
        self.image = UIImage(named: ImageName.rawValue)
        
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
