//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extensions related to simplify creation of menu to buttons
extension UIButton {
    
    open func setMenuForButton(_ menuItens: [UIAction]) {
        
        self.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                      for: .normal)
        self.imageView?.widthAnchorInSuperview(CGFloat(15).generateSizeForScreen)
        self.imageView?.heightAnchorInSuperview(CGFloat(10).generateSizeForScreen)
        self.menu = UIMenu(children: menuItens)
        self.showsMenuAsPrimaryAction = true
    }
}

//Extensions related to set buttons to Default by the app
extension UIButton {
    
    open func setToDefaultCapsuleButton(_ buttonTitle: String,
                                        _ backgroundColor: ColorsBravve = .blue) {

        self.configuration = .filled()
         
        let attribute = [NSAttributedString.Key.font: UIFont(name: FontsBravve.medium.rawValue,
                                                             size: CGFloat(13).generateSizeForScreen)]
        let attributedTitle = NSAttributedString(string: buttonTitle,
                                                 attributes: attribute as [NSAttributedString.Key : Any])
        
        self.configuration?.attributedTitle = AttributedString(attributedTitle)
        
        self.configuration?.background.backgroundColor = UIColor(named: backgroundColor.rawValue)
        if backgroundColor == .background {

            self.configuration?.baseForegroundColor = .black
            self.configuration?.background.strokeWidth = 0.7
            self.configuration?.background.strokeColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)
        }
        self.configuration?.cornerStyle = .capsule
    }
    
    open func setToProgressBarButtonDefault(_ buttonImageName: String) {
        
        var buttonTitle = ""
        let buttonMargins = CGFloat(2.5).generateSizeForScreen
        self.setTitleColor(UIColor(named: ColorsBravve.progressBarLabel.rawValue), for: .normal)
        self.setImage(UIImage(named: buttonImageName), for: .normal)
        
        switch buttonImageName {

            case IconsBravve.userBlue.rawValue:

                buttonTitle = "Dados pessoais"

            case IconsBravve.cellBlue.rawValue:

                buttonTitle = "Celular"

            case IconsBravve.emailBlue.rawValue:

                buttonTitle = "Email"

            case IconsBravve.padlockBlue.rawValue:

                buttonTitle = "Senha"

            case IconsBravve.pencilBlue.rawValue:

                buttonTitle = "Confirmação"
            
            case IconsBravve.photoBlue.rawValue:

                buttonTitle = "Foto"

            case IconsBravve.noteBlue.rawValue:

                buttonTitle = "Profissão"

            case IconsBravve.hobbiesBlue.rawValue:

                buttonTitle = "Hobbies"

            case IconsBravve.activitiesBlue.rawValue:

                buttonTitle = "Atividades de interesse"
            
            case IconsBravve.calendarBlue.rawValue:

                buttonTitle = "Agendamento"
                
            case IconsBravve.creditBlue.rawValue:

                buttonTitle = "Carteira"

            default: break
        }
        
        self.setTitle(buttonTitle, for: .normal)
        
        self.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                       size: CGFloat(14).generateSizeForScreen)
        
        self.imageView?.constraintInsideTo(.height,
                                           self.titleLabel,
                                           multiplier: 2)
        
        self.imageView?.constraintInsideTo(.leading, self, buttonMargins)
        self.imageView?.constraintOutsideTo(.trailing, self.titleLabel, buttonMargins)
        self.imageView?.constraintOutsideTo(.width, self.imageView)
    }
    
    open func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar",
                                               backgroundColor: ColorsBravve = .buttonGray) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.backgroundColor = UIColor(named: backgroundColor.rawValue)
        
        self.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, superview?.keyboardLayoutGuide)
        
        self.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,
                                       size: CGFloat(16).generateSizeForScreen)
    }
    
    open func setToBottomButtonDefaultAbove(_ buttonTitle: String = "Continuar",
                                            backgroundColor: ColorsBravve = .buttonGray,
                                            above: Any?) {
        
        self.setTitle(buttonTitle, for: .normal)
        self.backgroundColor = UIColor(named: backgroundColor.rawValue)
        
        self.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide)
        self.constraintInsideTo(.trailing, superview?.safeAreaLayoutGuide)
        self.constraintOutsideTo(.bottom, above)
        
        self.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,
                                       size: CGFloat(16).generateSizeForScreen)
    }
    
    open func setToBackButtonDefault(_ imageName: ButtonsBravve = .backWhite,
                                     _ constant: CGFloat = CGFloat(22).generateSizeForScreen) {
        
        self.setImage(UIImage(named: imageName.rawValue), for: .normal)
        self.imageView?.heightAnchorInSuperview(CGFloat(14).generateSizeForScreen)
        self.imageView?.widthAnchorInSuperview(CGFloat(8.48).generateSizeForScreen)
        
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        self.constraintInsideTo(.top, superview?.safeAreaLayoutGuide, CGFloat(65).generateSizeForScreen)
        
        self.constraintInsideTo(.height,
                                superview?.safeAreaLayoutGuide,
                                multiplier: CGFloat(0.04).generateSizeForScreen)
        self.constraintOutsideTo(.width, self)
    }
}
