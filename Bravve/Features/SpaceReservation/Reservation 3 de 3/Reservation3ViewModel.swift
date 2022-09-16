//
//  Reserva3ViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation
import UIKit

protocol ReservationsViewModelProtocol {
    func goToNextScreen()
    func showAlertError(message: String)
        
    
}

final class ReservationsViewModel {
    
    var delegate: ReservationsViewModelProtocol?
    
    let sessionManager = APIService()
    
    func makeApiCall(reservations: [Int], cardNumber: String, cardExpiration: String, cardSecurityCode: String, holderName: String, holderDocument: String, chargedAmount: Double, countryCode: String) {
        
        let parameters = ReservationPaymentParameters(reservations_id: reservations, card_payment: CardPayment(card_number: cardNumber, card_expiration: cardExpiration, card_security_code: cardSecurityCode, holder_name: holderName, holder_document: holderDocument, charged_amount: chargedAmount, country_code: countryCode))
        
        sessionManager.postDataWithResponse(endpoint: .reservationsPayments, parameters: parameters) { (statusCode, error, message: AlertMessage?) in
            guard let statusCode = statusCode else {
                print("não foi possivel desembrulhar o cod")
                return
            }
            
            if statusCode == 204 {
                self.delegate?.goToNextScreen()
            } else {
                guard let message = message?.message else {
                    print("não foi possivel desembrulhar a mensagem")
                    return
                }
                self.delegate?.showAlertError(message: message)
            }
        }
    
        }
        
        
        
    }
    
    


