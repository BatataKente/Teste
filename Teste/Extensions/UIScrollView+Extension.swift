//
//  UIScrollView+Extension.swift
//  Teste
//
//  Created by Josicleison on 14/08/22.
//

import UIKit

extension UIScrollView {
    
/// This function turns the scrollView into a list with stackViews
/// - Parameter views: Views to set in the list
    func turnIntoAList(_ views: [UIView]) {
        
        if self.subviews.count > 1 {
            
            for subview in self.subviews {
                
                if subview.alpha == 1 {
                    
                    subview.removeFromSuperview()
                }
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
        stackView.axis = .vertical
        stackView.setToDefaultBackgroundColor()
        
        view.addSubview(stackView)
        
        stackView.constraintInsideTo(.top, view)
        stackView.constraintInsideTo(.leading, view)
        stackView.constraintInsideTo(.trailing, view)
        stackView.constraintInsideTo(.bottom, view)
    }
}
