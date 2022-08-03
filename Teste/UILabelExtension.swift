//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extensions related to set labels to Default
extension UILabel {
    
    open func setToDefault(text: String = "",
                           _ textAlignment: NSTextAlignment = .center) {
        
        self.text = text
        self.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(16).generateSizeForScreen)
        self.numberOfLines = 0
        self.textAlignment = textAlignment
    }
}
