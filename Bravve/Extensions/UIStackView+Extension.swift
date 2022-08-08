//
//  ExtensionUIStackView.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Extension to add multiple ArrangedSubviews on a stackView
extension UIStackView {
    
/// This function add an array of views as ArrangedSubviews
/// - Parameter views: Views to add
    func addArrangedSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addArrangedSubview(view)
        }
    }
}
