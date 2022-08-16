//
//  NomeViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class NomeViewModel {
    
    var delegate: NomeViewModelProtocol?
    
    func makeNameScreen() {
        
        delegate?.setIshidden(leftStackView: true,
                              ddiChoseLabel: false,
                              alertButton: true,
                              registerFailLabel: true,
                              rightTextField: true,
                              ways: [true, true, false])
        
        delegate?.setFont(font: UIFont(name: FontsBravve.light.rawValue,
                                       size: CGFloat(15).generateSizeForScreen) ?? UIFont())
        
        delegate?.setColors(textColor: UIColor(named: ColorsBravve.textFieldLabel.rawValue),
                            customShaddowbackgroundColor: UIColor(named: ColorsBravve.blue.rawValue))
        
        delegate?.setText(rightLabel: "Nome Completo",
                          rightTextField: "",
                          infoLabel: "Para começarmos a conversar, pode nos contar seu nome e sobrenome!",
                          registerFailLabel: "Formato de nome inválido")
        
        delegate?.freezeButton()
        
        delegate?.setKeyboardType(keyboardType: .namePhonePad)
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

protocol NomeViewModelProtocol {
    
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
