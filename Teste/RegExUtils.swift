//
//  RegExUtils.swift
//  Teste
//
//  Created by user208023 on 7/26/22.
//

import UIKit

extension UIViewController {
    
    func containsUppercasedLetters(text: String) -> Bool {
        
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalizedTextTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        
        if capitalizedTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsNumericCharacters(text: String) -> Bool {
        
        let numericRegEx = ".*[0-9]+.*"
        let numericTextTest = NSPredicate(format:"SELF MATCHES %@", numericRegEx)
        
        if numericTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsSpecialCharacters(text: String) -> Bool {
        
        let specialCharRegEx = ".*[\\^$*.\\[\\]\\\\{}()?\\-\"!@#%&/,><':;|_~`+=]+.*"
        let specialCharTextTest = NSPredicate(format: "SELF MATCHES %@", specialCharRegEx)
        
        if specialCharTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsLowercasedCharacters(text: String) -> Bool {
        
        let normalLetterRegEx = ".*[a-z]+.*"
        let normalLetterTextTest = NSPredicate(format: "SELF MATCHES %@", normalLetterRegEx)
        
        if normalLetterTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
}
