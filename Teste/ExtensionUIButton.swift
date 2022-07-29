//
//  ExtensionUIButton.swift
//  Bravve
//
//  Created by Josicleison on 28/07/22.
//

import UIKit

//Extensions related to simplify creation of menu to buttons
extension UIButton {
    
    open func setMenuForButton(_ menuItens: [UIAction]) {
        
        self.setImage(UIImage(named: "downButtonBlue"), for: .normal)
        self.tintColor = .systemBlue
        self.menu = UIMenu(children: menuItens)
        self.showsMenuAsPrimaryAction = true
        self.changesSelectionAsPrimaryAction = true
    }
}

//Extensions related to set buttons to Default by the app
extension UIButton {
    
    open func setToDefaultCapsuleButton(_ buttonTitle: String,
                                        _ backgroundColor: UIColor = UIColor(named: "blueNav") ?? UIColor()) {

        self.configuration = .filled()
        self.configuration?.title = buttonTitle
        self.configuration?.background.backgroundColor = backgroundColor
        if backgroundColor == .white {

            self.configuration?.baseForegroundColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            self.configuration?.background.strokeWidth = 0.7
            self.configuration?.background.strokeColor = UIColor(red: 0.847, green: 0.867, blue: 0.896, alpha: 1)
        }
        self.configuration?.cornerStyle = .capsule
    }
    
    open func setToJumpButtonDefault(buttonTitle: String = "Pular",
                                     _ constant: CGFloat = 70) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.setTitleColor(UIColor(named: "blueNav"), for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 15)
        self.layer.cornerRadius = 8
        
        self.addBottomLineWithColor(color: UIColor(named: "blueNav") ?? UIColor(), width: 1, y: -7)
        
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

            case "userBlue":

                self.configuration?.title = " Dados pessoais"

            case "cellBlue":

                self.configuration?.title = " Celular"

            case "emailBlue":

                self.configuration?.title = " Email"

            case "padlockBlue":

                self.configuration?.title = " Senha"

            case "pencilBlue":

                self.configuration?.title = " Confirmação"
            
            case "photoBlue":

                self.configuration?.title = " Foto"

            case "noteBlue":

                self.configuration?.title = " Profissão"

            case "hobbiesBlue":

                self.configuration?.title = " Hobbies"

            case "activiesBlue":

                self.configuration?.title = " Atividades de interesse"
            
            case "calendarBlue":

                self.configuration?.title = " Agendamento"
                
            case "creditBlue":

                self.configuration?.title = " Carteira"

            default: break
        }
        
        self.configuration?.baseForegroundColor = UIColor(named: "blueNav")
        self.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 14)
    }
    
    open func setToButtonDefault(_ aboveWhom: Any?,
                                 buttonTitle: String = "Continuar",
                                 _ constant: CGFloat = 30) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: "buttonPink")
        self.layer.cornerRadius = 8
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, 22)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide, 22)
        
        guard let aboveWhom = aboveWhom else {return}
        
        self.constraintOutsideTo(.bottom, aboveWhom, constant)
    }
    
    open func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar") {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: "reservedCancel")
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
    }
    
    open func setToBottomButtonDefault(_ buttonTitle: String = "Continuar",
                                       colorName: String = "buttonPink",
                                       aboveWhom: Any?) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        self.backgroundColor = UIColor(named: colorName)
        
        self.constraintInsideTo(.height, superview?.safeAreaLayoutGuide, multiplier: 0.07)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, aboveWhom)
    }
    
    open func setToBackButtonDefault(_ imageName: String = "backWhite",_ constant: CGFloat = 22) {
        
        self.setImage(UIImage(named: imageName), for: .normal)
        
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
