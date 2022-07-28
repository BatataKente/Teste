//
//  ExtensionUILabel.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Extensions related to set labels to Default
extension UILabel {
    
    open func setToDefault(text: String = "",
                           _ textAlignment: NSTextAlignment = .center) {
        
        self.text = text
        self.font = UIFont(name: "Ubuntu-Light", size: 16)
        self.numberOfLines = 0
        self.textAlignment = textAlignment
    }
}
