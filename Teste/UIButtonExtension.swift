//
//  ExtensionUIButton.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Passar Nomes para ingles
//Passar Enum em nomes padrao para icons cores etc
//Ficaria melhor com classe

//Extensions related to simplify creation of menu to buttons
extension UIButton {
    
    open func setMenuForButton(_ menuItens: [UIAction]) {
        
        self.setImage(UIImage(systemName: ButtonsBravve.arrowBlue.rawValue), for: .normal)
        self.tintColor = .systemBlue
        self.menu = UIMenu(children: menuItens)
        self.showsMenuAsPrimaryAction = true
        self.changesSelectionAsPrimaryAction = true
    }
}

//Extensions related to set buttons to Default by the app
extension UIButton {
    
    open func setToDefaultCapsuleButton(_ buttonTitle: String,
                                        _ backgroundColor: ColorsBravve = .blue) {

        self.configuration = .filled()
        self.configuration?.title = buttonTitle
        self.configuration?.background.backgroundColor = UIColor(named: backgroundColor.rawValue)
        if backgroundColor == .background {

            self.configuration?.baseForegroundColor = .black
            self.configuration?.background.strokeWidth = 0.7
            self.configuration?.background.strokeColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)
        }
        self.configuration?.cornerStyle = .capsule
    }
    
    open func setToJumpButtonDefault(buttonTitle: String = "Pular",
                                     _ constant: CGFloat = 70) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        self.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        self.layer.cornerRadius = 8
        
        self.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? UIColor(), width: 1, y: -7)
        
        self.constraintInsideTo(.centerX, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.bottom, superview?.safeAreaLayoutGuide, constant)
    }
    
    open func setToProgressBarButtonDefault(_ buttonImageName: String) {
        
        self.configuration = .plain()
        self.configuration?.image = UIImage(named: buttonImageName)
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 0,
                                                                    bottom: 0,
                                                                    trailing: 0)
            
        switch buttonImageName {

            case IconsBravve.userBlue.rawValue:

                self.configuration?.title = " Dados pessoais"

            case IconsBravve.cellBlue.rawValue:

                self.configuration?.title = " Celular"

            case IconsBravve.emailBlue.rawValue:

                self.configuration?.title = " Email"

            case IconsBravve.padlockBlue.rawValue:

                self.configuration?.title = " Senha"

            case IconsBravve.pencilBlue.rawValue:

                self.configuration?.title = " Confirmação"
            
            case IconsBravve.photoBlue.rawValue:

                self.configuration?.title = " Foto"

            case IconsBravve.noteBlue.rawValue:

                self.configuration?.title = " Profissão"

            case IconsBravve.hobbiesBlue.rawValue:

                self.configuration?.title = " Hobbies"

            case IconsBravve.activiesBlue.rawValue:

                self.configuration?.title = " Atividades de interesse"
            
            case IconsBravve.calendarBlue.rawValue:

                self.configuration?.title = " Agendamento"
                
            case IconsBravve.creditBlue.rawValue:

                self.configuration?.title = " Carteira"

            default: break
        }
        
        self.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        self.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue, size: 14)
    }
    
    open func setToButtonDefault(_ aboveWhom: Any?,
                                 buttonTitle: String = "Continuar",
                                 _ constant: CGFloat = 30) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        self.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        self.layer.cornerRadius = 8
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, 22)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, 22)
        
        guard let aboveWhom = aboveWhom else {return}
        
        self.constraintOutsideTo(.bottom, aboveWhom, constant)
    }
    
    open func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar") {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        self.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
    }
    
    open func setToBottomButtonDefault(_ buttonTitle: String = "Continuar",
                                       colorName: ColorsBravve = .buttonPink,
                                       aboveWhom: Any?) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        self.backgroundColor = UIColor(named: colorName.rawValue)
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, aboveWhom)
    }
    
    open func setToBackButtonDefault(_ imageName: ButtonsBravve = .backWhite,
                                     _ constant: CGFloat = 22) {
        
        self.setImage(UIImage(named: imageName.rawValue), for: .normal)
        
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, 65)
        
        if UIScreen.main.traitCollection.horizontalSizeClass == .regular {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.05)
            self.widthAnchorInSuperview(50)
        }
        else {
            
            self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.05)
            self.widthAnchorInSuperview(50)
        }
    }
}
