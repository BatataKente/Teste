//
//  PhoneViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PhoneViewModel {
    
    var delegate: PhoneViewModelProtocol?
    
    func createDDIs() -> [String] {
        
        var ddis: [String] = []
        
        for i in 1...235 {
            
            ddis.append("+\(i)")
        }
        
        return ddis
    }
    
    func makePhoneScreen() {
        
        delegate?.setIshidden(leftStackView: false,
                              ddiChoseLabel: true,
                              alertButton: true,
                              registerFailLabel: true,
                              rightTextField: true,
                              ways: [true, false, true])
        
        delegate?.setFont(font: UIFont(name: FontsBravve.light.rawValue,
                                       size: CGFloat(15).generateSizeForScreen) ?? UIFont())
        
        delegate?.setColors(textColor: UIColor(named: ColorsBravve.textFieldLabel.rawValue),
                            customShaddowbackgroundColor: UIColor(named: ColorsBravve.blue.rawValue))
        
        delegate?.setText(rightLabel: "Telefone",
                          rightTextField: "",
                          infoLabel: "Precisamos do seu telefone com DDD!\n Por favor, informe o seu país também.",
                          registerFailLabel: "Número não corresponde ao país")
        
        delegate?.freezeButton()
        
        delegate?.setKeyboardType(keyboardType: .numberPad)
    }
    
    func makeFailScreen() {
        
        delegate?.setIshidden(leftStackView: true,
                              ddiChoseLabel: false,
                              alertButton: false,
                              registerFailLabel: false,
                              rightTextField: false,
                              ways: [true, true, false])
        
        delegate?.setColors(textColor: UIColor(named: ColorsBravve.redAlertLabel.rawValue),
                            customShaddowbackgroundColor: UIColor(named: ColorsBravve.redAlertLabel.rawValue))
    }
}

protocol PhoneViewModelProtocol {
    
    func setIshidden(leftStackView: Bool,
                     ddiChoseLabel: Bool,
                     alertButton: Bool,
                     registerFailLabel: Bool,
                     rightTextField: Bool,
                     ways: [Bool])
    
    func setFont(font: UIFont)
    
    func setColors(textColor: UIColor?,
                   customShaddowbackgroundColor: UIColor?)
    
    func setText(rightLabel: String,
                 rightTextField: String,
                 infoLabel: String,
                 registerFailLabel: String)
    
    func freezeButton()
    
    func setKeyboardType(keyboardType: UIKeyboardType)
}
