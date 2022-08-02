//
//  UIFontExtension.swift
//  Teste
//
//  Created by Josicleison on 01/08/22.
//

import UIKit

extension UIFont {
    
    class func appFont(ofSize size : CGFloat = UIFont.systemFontSize,
                       weight : Weight = .regular,
                       autoScale : Bool = true) -> UIFont {
        
        return UIFont.systemFont(ofSize: autoScale ? size.dp : size, weight: weight)
    }
}
