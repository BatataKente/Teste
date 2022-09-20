//
//  LoginViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol LoginViewModelProtocol {
    
    func showCustomAlert(message: String)
    func showAlertCustom(message: String)
    func presentNextScreen()
    func freezeButton()
}

class LoginViewModel{
    
    let sessionManager = APIService()
    
    private var reservations: [Reservations] = []
    
    let customAlert = CustomAlert()
    let alertCustom = CustomAlert()
    
    var delegate: LoginViewModelProtocol?
    
    func isValid(email: String, password: String) -> Bool{
        if email.isEmpty || password.isEmpty{
            return false
        }
        else{
            return true
        }
    }
    
    func loginUser(email: String, password: String) {
        let parameters = LoginParameters(email: email, password: password)
        
        self.delegate?.freezeButton()
        sessionManager.postDataWithOpenResponse(endpoint: .auth, parameters: parameters) { (statusCode, error, token: Token?) in
            
            guard let tokenResponse = token?.token else {
                
                print(statusCode as Any)
                
                guard let statusCode = statusCode else {
                    return
                }
                
                if statusCode == 400 {
                    
                    guard let message = token?.message else { return }
                    
                    self.delegate?.freezeButton()
                    self.delegate?.showCustomAlert(message: message)
                    
                } else if statusCode == 404 {
                    guard let message = token?.message else { return }
                    
                    self.delegate?.freezeButton()
                    self.delegate?.showAlertCustom(message: message)
                    
                }
                return
            }
            
            UserDefaults.standard.setValue(tokenResponse, forKey: "access_token")
            
            self.sessionManager.getDataArray(endpoint: .users) { (statusCode, error, users: [User]?) in
                
                guard let users = users else {
                    return
                }
                
                for user in users {
                    
                    guard let userEmail = user.email else { return }
                    if userEmail == email {
                        
                        guard let userUUID = user.uuid else { return }
                        guard let name = user.name else { return }
                        
                        UserDefaults.standard.setValue(userUUID, forKey: "userUUID")
                        UserDefaults.standard.setValue(name, forKey: "name")
                    }
                }
                
                self.sessionManager.getDataArray(endpoint: .reservationsOpen){ (statusCode, error, openReservations: [Reservations]?) in

                    guard let openReservations = openReservations else {
                        print(statusCode as Any)
                        print(error?.localizedDescription as Any)
                        self.delegate?.presentNextScreen()
                        return
                    }

                    UserReservations.reservations = openReservations

                    self.delegate?.presentNextScreen()
                }
            }
        }
    }
}
