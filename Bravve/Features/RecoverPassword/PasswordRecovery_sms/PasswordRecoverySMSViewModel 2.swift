//
//  Recuperar6ViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

protocol PasswordRecoverySMSViewModelProtocol {
    
    func showAlert()
}

class PasswordRecoverySMSViewModel {
    
    let sessionManager = SessionManager()
    
    var delegate: PasswordRecoverySMSViewModelProtocol?
    
    func makeAPICall(password: String, code: String, email: String) {
        
        let parameters = ConfirmForgotPasswordParameters(email: email, new_password: password, code: code)
        
        sessionManager.postOpenDataWithoutResponse(endpoint: .confirmForgotPassword, parameters: parameters) { statusCode, error in
            
            guard let statusCode = statusCode else {
                print("Unable to unwrap status code")
                return
            }
            
            if statusCode == 200 {
                
                self.delegate?.showAlert()
            } else {
                print("Unable to change password")
            }
        }
    }
}
