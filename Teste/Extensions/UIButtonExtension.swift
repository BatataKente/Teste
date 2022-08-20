//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit

//Extensions related to simplify creation of menu to buttons

extension UIButton {
    
/// This function create a menu on the button with list.
/// - Parameter menuItens: Each item like UIAction, which will be in the list
    func setMenuForButton(_ menuItens: [UIAction]) {
        
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
    
/// This function turns a button into the default capsule button in the app.
/// - Parameters:
///   - buttonTitle: The title of button
///   - backgroundColor: The background of button
///   - strokeColor: The stroke of button
    func setToDefaultCapsuleButton(_ buttonTitle: String,
                                        _ backgroundColor: ColorsBravve = .capsuleButtonSelected,
                                        strokeColor: UIColor? = UIColor(named: ColorsBravve.textFieldBorder.rawValue)) {

        self.configuration = .filled()
         
        let attribute = [NSAttributedString.Key.font: UIFont(name: FontsBravve.medium.rawValue,
                                                             size: CGFloat(13).generateSizeForScreen)]
        let attributedTitle = NSAttributedString(string: buttonTitle,
                                                 attributes: attribute as [NSAttributedString.Key : Any])
        
        self.configuration?.attributedTitle = AttributedString(attributedTitle)
        self.titleLabel?.numberOfLines = 1
        self.configuration?.background.backgroundColor = UIColor(named: backgroundColor.rawValue)
        if backgroundColor == .capsuleButton {

            self.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            self.configuration?.background.strokeWidth = 0.7
            self.configuration?.background.strokeColor = strokeColor
        }
        self.configuration?.cornerStyle = .capsule
    }
    
/// This function turns a button into the default progress bar button in the app. Progress bar are a bar that usually occurs in this app.
/// - Parameter buttonImageName: The button image name
    func setToProgressBarButtonDefault(_ buttonImageName: String) {
        
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
    
/// This function puts a button in the bottom and customizes it to the app's default
/// - Parameters:
///   - buttonTitle: The button title
///   - backgroundColor: The background color
    func setToBottomButtonKeyboardDefault(_ buttonTitle: String = "Continuar",
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
    
/// This function puts a button on top of some other view and customizes it to the app's default
/// - Parameters:
///   - buttonTitle: The button title
///   - backgroundColor: The background color of button as enum of assets
///   - above: The item immediately below the button
    func setToBottomButtonDefaultAbove(_ buttonTitle: String = "Continuar",
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
    
/// This function turns the button into the default back
/// - Parameters:
///   - imageName: The image name of back button as enum of assets
///   - constant: Distance of button from left
///   - handler: Action of button
    func setToBackButtonDefault(_ imageName: ButtonsBravve = .backWhite,
                                _ constant: CGFloat = CGFloat(22).generateSizeForScreen,
                                _ handler: @escaping UIActionHandler) {
        
        self.setImage(UIImage(named: imageName.rawValue), for: .normal)
        self.imageView?.heightAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        self.imageView?.constraintOutsideTo(.width, self.imageView,
                                            multiplier: 0.6)
        
        self.constraintInsideTo(.top, superview, CGFloat(65).generateSizeForScreen)
        self.constraintInsideTo(.leading, superview?.safeAreaLayoutGuide, constant)
        
        self.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        self.constraintInsideTo(.height,
                                superview?.safeAreaLayoutGuide,
                                multiplier: CGFloat(0.04).generateSizeForScreen)
        self.constraintOutsideTo(.width, self)
    }
}

extension UIButton {
    
/// This function adds a view as a subview
/// - Parameters:
///   - window: The view that will be the subWindow
///   - orientation: The position that window will move
///   - origin: The origin of window
    func addSubWindow(_ window: UIView,
                      _ orientation: Orientation = .downRight,
                      origin: CGPoint? = nil) {
        
        let size = window.frame.size
        window.frame.size = .zero
        
        let animate = {
            
            self.isSelected = true
            window.frame.size = size
            window.alpha = 1
        }
        
        let reduce = {
            
            self.isSelected = false
            window.frame.size = .zero
        }
        
        let timing: (duration: CGFloat,
                     delay: CGFloat) = (duration: 0.3,
                                        delay: 0.1)
        
        let handler = {(action: UIAction) in
            
            window.frame.size = .zero
            window.alpha = 0
            
            switch orientation {
                
                case .downLeft:
                
                    if self.isSelected {
                        
                        reduce()
                    }
                    else {
                        
                        if let origin = origin {
                            
                            window.frame.origin = origin
                        }
                        else {
                            
                            window.frame.origin = CGPoint(x: self.frame.maxX,
                                                          y: self.frame.maxY)
                        }
                    
                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {
                            
                            animate()
                            window.frame.origin.x -= size.width
                        }
                    }
                
                case .downRight:
                
                    if self.isSelected {
                        
                        reduce()
                    }
                    else {
                        
                        if let origin = origin {
                            
                            window.frame.origin = origin
                        }
                        else {
                            
                            window.frame.origin = CGPoint(x: self.frame.minX,
                                                          y: self.frame.maxY)
                        }
                    
                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {
                            
                            animate()
                        }
                    }
                
                case .upLeft:
                
                    if self.isSelected {
                        
                        reduce()
                    }
                    else {
                            
                        if let origin = origin {
                            
                            window.frame.origin = origin
                        }
                        else {
                            
                            window.frame.origin = CGPoint(x: self.frame.maxX,
                                                          y: self.frame.minY)
                        }
                    
                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {
                            
                            animate()
                            window.frame.origin.x -= size.width
                            window.frame.origin.y -= size.height
                        }
                    }
                
                case .upRight:
                
                    if self.isSelected {
                        
                        reduce()
                    }
                    else {
                        
                        if let origin = origin {
                            
                            window.frame.origin = origin
                        }
                        else {
                            
                            window.frame.origin = CGPoint(x: self.frame.minX,
                                                          y: self.frame.minY)
                        }
                    
                        UIView.animate(withDuration: timing.duration,
                                       delay: timing.delay) {
                            
                            animate()
                            window.frame.origin.y -= size.height
                        }
                    }
                
                default:
                
                    if let origin = origin {
                        
                        window.frame.origin = origin
                    }
                    else {
                        
                        window.frame.origin = CGPoint(x: self.superview?.center.x ?? self.center.x,
                                                      y: self.superview?.center.y ?? self.center.x)
                    }
                
                    UIView.animate(withDuration: timing.duration,
                                   delay: timing.delay) {
                        
                        animate()
                        window.frame.origin.x -= size.width/2
                        window.frame.origin.y -= size.width/2
                    }
            }
        }
        
        self.addAction(UIAction(handler: handler), for: .touchUpInside)
    }
}
