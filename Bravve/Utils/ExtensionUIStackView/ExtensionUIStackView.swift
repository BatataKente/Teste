//
//  ExtensionUIStackView.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Extension to add multiple ArrangedSubviews on a stackView
extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addArrangedSubview(view)
        }
    }
}
