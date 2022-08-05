//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extensions related to set imageViews to Default
extension UIImageView {
    
    open func setWayToDefault(_ imageName: ImagesBravve) {
        
        switch imageName {
            
            case ImagesBravve.wayCell:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
        case ImagesBravve.wayConfirm_1:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        
            case ImagesBravve.wayEmail:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
            
            case ImagesBravve.wayPassword:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(93).generateSizeForScreen)
                self.widthAnchorInSuperview(CGFloat(230).generateSizeForScreen)
            
            case ImagesBravve.wayReserv_1:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(140).generateSizeForScreen)
                self.widthAnchorInSuperview(CGFloat(150).generateSizeForScreen)
            
            case ImagesBravve.wayReserv_2:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)
                self.widthAnchorInSuperview(CGFloat(150).generateSizeForScreen)
                
            case ImagesBravve.wayLogin:
            
                self.image = UIImage(named: imageName.rawValue)
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(190).generateSizeForScreen)
                self.widthAnchorInSuperview(CGFloat(200).generateSizeForScreen)
            
            default: return
        }
    }
    
    open func setLogoToDefault(_ ImageName: ImagesBravve = .logoBlue) {
        
        self.image = UIImage(named: ImageName.rawValue)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, CGFloat(65).generateSizeForScreen)
        
        self.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)
        self.widthAnchorInSuperview(CGFloat(140).generateSizeForScreen)
    }
}
