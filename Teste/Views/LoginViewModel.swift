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
