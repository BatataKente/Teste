//
//  ExtensionUILabel.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

import UIKit

//Extensions related to set labels to Default
extension UILabel {
    
/// This function puts the label in the default font, size and text.
/// - Parameters:
///   - text: The string with the label text
///   - textAlignment: The text alignment
    open func setToDefault(text: String = "",
                           _ textAlignment: NSTextAlignment = .center) {
        
        self.text = text
        self.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(16).generateSizeForScreen)
        self.numberOfLines = 0
        self.textAlignment = textAlignment
    }
}

