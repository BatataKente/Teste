//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit
    
//Extensions related to creation of view elements on UIViewController
extension UIViewController {
    
    func createCapsuleButtons(_ buttonTitles: [String],
                              _ backgroundColor: ColorsBravve = .blue) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for title in buttonTitles {
            
            let button = UIButton()
            button.setToDefaultCapsuleButton(title, backgroundColor)
            
            buttons.append(button)
        }
        
        return buttons
    }
    
    open func createProgressBarButtons(_ buttonImageNames: [String]) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for name in buttonImageNames {
            
            let button = UIButton()
            
            switch name{
                
                case IconsBravve.userGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.first)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.cellGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.second)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.emailGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.thirdy)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.padlockGray.rawValue: break

                case IconsBravve.pencilGray.rawValue: break
                
                case IconsBravve.photoGray.rawValue:
            
                    let handler = {(action: UIAction) in
                        
                        let fotoView = FotoView()
                        fotoView.modalPresentationStyle = .fullScreen
                        self.present(fotoView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)

                case IconsBravve.noteGray.rawValue: break

                case IconsBravve.hobbiesGray.rawValue: break

                case IconsBravve.activitiesGray.rawValue: break
                
                case IconsBravve.calendarGray.rawValue: break
                    
                case IconsBravve.creditGray.rawValue: break
                
                default: break
            }
            
            button.setToProgressBarButtonDefault(name)
            
            buttons.append(button)
        }
        
        return buttons
    }
}

//Extension related to regex
extension UIViewController {
    
    func validateCellPhone(_ phone: String) -> Bool {
        
        let phoneRegEx = "\\([0-9]{4}+\\)[0-9]{5}+-[0-9]{4}||[0-9]{13}"

        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        
        if phonePred.evaluate(with: phone) {
            
            return true
        }
        return false
    }
}

extension UIViewController {
    
    func containsUppercasedLetters(text: String) -> Bool {
        
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalizedTextTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        
        if capitalizedTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsNumericCharacters(text: String) -> Bool {
        
        let numericRegEx = ".*[0-9]+.*"
        let numericTextTest = NSPredicate(format:"SELF MATCHES %@", numericRegEx)
        
        if numericTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsSpecialCharacters(text: String) -> Bool {
        
        let specialCharRegEx = ".*[\\^$*.\\[\\]\\\\{}()?\\-\"!@#%&/,><':;|_~`+=]+.*"
        let specialCharTextTest = NSPredicate(format: "SELF MATCHES %@", specialCharRegEx)
        
        if specialCharTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
    func containsLowercasedCharacters(text: String) -> Bool {
        
        let normalLetterRegEx = ".*[a-z]+.*"
        let normalLetterTextTest = NSPredicate(format: "SELF MATCHES %@", normalLetterRegEx)
        
        if normalLetterTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
}
