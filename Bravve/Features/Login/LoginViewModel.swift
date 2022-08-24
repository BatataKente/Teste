//
//  LoginViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

class LoginViewModel{
    
    func isValid(email: String, password: String) -> Bool{
        if email.isEmpty || password.isEmpty{
            return false
        }
        else{
            return true
        }
    }
}
