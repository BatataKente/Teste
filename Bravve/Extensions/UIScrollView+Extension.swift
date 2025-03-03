//
//  UIScrollView+Extension.swift
//  Bravve
//
//  Created by Josicleison on 15/08/22.
//

import UIKit

extension UIScrollView {
    
/// This function turns the scrollView into a list with stackViews
/// - Parameter views: Views to set in the list
    func turnIntoAList(_ views: [UIView]) {
        
        for subview in self.subviews {
            
            if subview.frame.origin.x == 0 {
                
                subview.removeFromSuperview()
            }
        }
        
        let view = UIView()
        self.addSubview(view)
        
        view.constraintInsideTo(.top, self.contentLayoutGuide)
        view.constraintInsideTo(.leading, self.contentLayoutGuide)
        view.constraintInsideTo(.trailing, self.contentLayoutGuide)
        view.constraintInsideTo(.bottom, self.contentLayoutGuide)
        view.constraintInsideTo(.width, self.frameLayoutGuide)
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.arrangedSubviews[0].heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stackView.setToDefaultBackgroundColor()
        
        view.addSubview(stackView)
        
        stackView.constraintInsideTo(.top, view)
        stackView.constraintInsideTo(.leading, view)
        stackView.constraintInsideTo(.trailing, view)
        stackView.constraintInsideTo(.bottom, view)
    }
}
