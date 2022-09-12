//
//  ConfirmarDadosViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation
struct Flags {
    
    static var shared = Flags()
    var flag: Int
    var flagReservation: Int
    
     init() {
        self.flagReservation = 0
        self.flag = 0
    }
}


///
///Nome -> Telefone -> Email -> Senha -> ConfirmData -> Nome (x), -> Email (x), ->Telephone (x)
