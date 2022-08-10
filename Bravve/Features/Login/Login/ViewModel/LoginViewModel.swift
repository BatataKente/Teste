//
//  LoginViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

class LoginViewModel{
    
    func isValid(phone: String, password: String) -> Bool{
        let _phone = phone.clearFormatMask()
        if _phone.count <= 10 || password.isEmpty{
            return false
        }
        else{
            return true
        }
    }
}


extension String {
    
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        
        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    func clearFormatMask() -> String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}
