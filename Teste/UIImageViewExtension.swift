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
            
            case "wayCell":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case "wayConfirm":
            
                self.image = UIImage(named: imageName)
            
            self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        
            case "wayEmail":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case "wayPassword":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(110)
                self.widthAnchorInSuperview(280)
            
            case "wayReserv2":
            
                self.image = UIImage(named: imageName)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(140)
                self.widthAnchorInSuperview(150)
            
            case "wayReserv":
            
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
