//
//  EmailViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class EmailViewModel {
    
    var delegate: EmailViewModelProtocol?
    
    func makeEmailScreen() {
        
        delegate?.setIshidden(leftStackView: true,
                              ddiChoseLabel: false,
                              ways: [false, true, true])
        
        delegate?.setFont(font: UIFont(name: FontsBravve.light.rawValue,
                                       size: CGFloat(15).generateSizeForScreen) ?? UIFont())
        
        delegate?.setColors(textColor: UIColor(named: ColorsBravve.textFieldLabel.rawValue),
                            customShaddowbackgroundColor: UIColor(named: ColorsBravve.blue.rawValue))
        
        delegate?.setText(rightLabel: "E-mail",
                          rightTextField: "",
                          infoLabel: "Qual seu email? Não se preocupe, não vamos encher sua caixa de entrada.",
                          registerFailLabel: "Formato de e-mail inválido")
        
        delegate?.freezeButton()
        
        delegate?.setKeyboardType(keyboardType: .emailAddress)
    }
}

protocol EmailViewModelProtocol {
    
    func setIshidden(leftStackView: Bool,
                     ddiChoseLabel: Bool,
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
