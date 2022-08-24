//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extensions related to set imageViews to Default
extension UIImageView {
    
/// This function puts the ways in the default position and size. Ways are background images that are common in this app
/// - Parameter imageName: The image name which is the enum that has the images identified in the assets
    func setWayToDefault(_ imageName: ImagesBravve) {
        
        self.image = UIImage(named: imageName.rawValue)
        
        switch imageName {
            
            case ImagesBravve.wayActivities:
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.bottom, superview)
                self.heightAnchorInSuperview(CGFloat(265).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.35)
            
            case ImagesBravve.wayCell:
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(315).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.1)
            
            case ImagesBravve.wayConfirm_1:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(130).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 2)
            
            case ImagesBravve.wayConfirm_2:
            
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(315).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.25)
            
            case ImagesBravve.wayEmail:
            
                self.constraintInsideTo(.trailing, superview)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(295).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.25)
            
            case ImagesBravve.wayFinalCadaster:
            
                self.constraintInsideTo(.trailing, superview)
                self.constraintInsideTo(.centerY, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(295).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.25)
            
            case ImagesBravve.wayHelp:
            
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(210).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.75)
            
            case ImagesBravve.wayHobbies:
            
            self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(110).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 3)
            
            case ImagesBravve.wayLogin:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 1.2)
            
            case ImagesBravve.wayName:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(120).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 2.5)
            
            case ImagesBravve.wayPassword:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(90).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 2.5)
            
            case ImagesBravve.wayPhoto:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(110).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 3)
            
            case ImagesBravve.wayReserv_1:
            
                self.constraintInsideTo(.bottom, superview, CGFloat(-20).generateSizeForScreen)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(190).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.7)
            
            case ImagesBravve.wayReserv_2:
            
                self.constraintInsideTo(.top, superview , CGFloat(20).generateSizeForScreen)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(150).generateSizeForScreen)
                self.widthAnchorInSuperview(CGFloat(144).generateSizeForScreen)
            
            case ImagesBravve.wayTerms_1:
            
                self.constraintInsideTo(.top, superview)
                self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(100).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.95)
            
            case ImagesBravve.wayTerms_2:
            
                self.constraintInsideTo(.bottom, superview)
                self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
                self.heightAnchorInSuperview(CGFloat(190).generateSizeForScreen)
                self.constraintOutsideTo(.width, self, multiplier: 0.7)
            
            default: return
        }
    }
    
/// This function puts the BravveLogo in the default position and size.
/// - Parameter ImageName: The image name which is the enum that has the images identified in the assets(default is logo)
    func setLogoToDefault(_ ImageName: ImagesBravve = .logoBlue) {
        
        self.image = UIImage(named: ImageName.rawValue)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.top, superview, CGFloat(65).generateSizeForScreen)
        
        self.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)
        self.widthAnchorInSuperview(CGFloat(140).generateSizeForScreen)
    }
}
