//
//  ValidateUtils.swift
//  Teste
//
//  Created by Josicleison on 22/07/22.
//

import UIKit

extension UIViewController {
    
    func validateCellPhone(_ phone: String) -> Bool {
        
        let phoneRegEx = "\\([0-9]{4}+\\)[0-9]{5}+-[0-9]{4}||[0-9]{13}"

        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        
        if phonePred.evaluate(with: phone) {
            
            return true
        }
        return false
    }
}
