//
//  ExtensionUIView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 28/07/22.
//

import UIKit
    
//Extensions related to creation of view elements on UIViewController
extension UIViewController {

/// This is a function created with the aim of generating buttons in the capsule configuration
/// - Parameters:
///   - buttonTitles: Button titles string array
///   - backgroundColor: Button background color
///   - strokeColor: Button stroke color
/// - Returns: A button for each title
    func createCapsuleButtons(_ buttonTitles: [String],
                                   _ backgroundColor: ColorsBravve = .capsuleButtonSelected,
                                   strokeColor: UIColor? = UIColor(named: ColorsBravve.textFieldBorder.rawValue)) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for title in buttonTitles {
            
            let button = UIButton()
            button.setToDefaultCapsuleButton(title,
                                             backgroundColor,
                                             strokeColor: strokeColor)
            
            buttons.append(button)
        }
        
        return buttons
    }
    
/// This is a function created with the aim of creating a progress bar buttons, which is a custom bar in the app that has a series of navigable buttons
/// - Parameter buttonImageNames: the button Image Names
/// - Returns: A progress bar button for each name without actions
    func createProgressBarButtonsWithoutActions(_ buttonImageNames: [String]) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for name in buttonImageNames {
            
            let button = UIButton()
            button.setToProgressBarButtonDefault(name)
            
            buttons.append(button)
        }
        
        return buttons
    }
    
/// This is a function created with the aim of creating a progress bar buttons, which is a custom bar in the app that has a series of navigable buttons
/// - Parameter buttonImageNames: the button Image Names
/// - Returns: A progress bar button for each name with actions
    func createProgressBarButtons(_ buttonImageNames: [String]) -> [UIButton] {
        
        var buttons: [UIButton] = []
        
        for name in buttonImageNames {
            
            let button = UIButton()
            
            switch name{
                
                case IconsBravve.activitiesGray.rawValue:
                
                let handler = {(action: UIAction) in
                    
                    let activitiesView = ActivitiesView()
                    activitiesView.modalPresentationStyle = .fullScreen
                    self.present(activitiesView,
                                 animated: false)
                }

                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.calendarGray.rawValue: break
                
                case IconsBravve.cellGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.second)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.creditGray.rawValue: break
                
                case IconsBravve.emailGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.thirdy)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.hobbiesGray.rawValue:
                
                let handler = {(action: UIAction) in
                    
                    let hobbiesView = HobbiesView()
                    hobbiesView.modalPresentationStyle = .fullScreen
                    self.present(hobbiesView,
                                 animated: false)
                }

                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.noteGray.rawValue:
                
                let handler = {(action: UIAction) in
                    
                    let professionView = ProfessionView()
                    professionView.modalPresentationStyle = .fullScreen
                    self.present(professionView,
                                 animated: false)
                }

                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.padlockGray.rawValue:
                
                let handler = {(action: UIAction) in
                    
                    let passwordView = PasswordView()
                    passwordView.modalPresentationStyle = .fullScreen
                    self.present(passwordView,
                                 animated: false)
                }

                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.pencilGray.rawValue:
                
                let handler = {(action: UIAction) in
                    
                    let confirmDataView = ConfirmDataView()
                    confirmDataView.modalPresentationStyle = .fullScreen
                    self.present(confirmDataView,
                                 animated: false)
                }

                button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
                case IconsBravve.photoGray.rawValue:
            
                    let handler = {(action: UIAction) in
                        
                        let fotoView = FotoView()
                        fotoView.modalPresentationStyle = .fullScreen
                        self.present(fotoView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                    
                case IconsBravve.userGray.rawValue:
                    
                    let handler = {(action: UIAction) in
                        
                        let nomeView = NomeView(.first)
                        nomeView.modalPresentationStyle = .fullScreen
                        self.present(nomeView,
                                     animated: false)
                    }

                    button.addAction(UIAction(handler: handler), for: .touchUpInside)
                
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

/// This is a regex that checks if it's a valid phone
/// - Parameter phone: A string with the phoneNumber
/// - Returns: True if is a valid number, or false if not
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
    
/// This is a regex that checks if it contains capital letters
/// - Parameter text: A string
/// - Returns: True if is uppercased, or false if not
    func containsUppercasedLetters(text: String) -> Bool {
        
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalizedTextTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        
        if capitalizedTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
/// This is a regex that checks if it contains numbers
/// - Parameter text: A string
/// - Returns: True if is  contains numeric characters, or false if not
    func containsNumericCharacters(text: String) -> Bool {
        
        let numericRegEx = ".*[0-9]+.*"
        let numericTextTest = NSPredicate(format:"SELF MATCHES %@", numericRegEx)
        
        if numericTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
/// This is a regex that checks if it contains special characters
/// - Parameter text: A string
/// - Returns: True if is  contains special characters, or false if not
    func containsSpecialCharacters(text: String) -> Bool {
        
        let specialCharRegEx = ".*[\\^$*.\\[\\]\\\\{}()?\\-\"!@#%&/,><':;|_~`+=]+.*"
        let specialCharTextTest = NSPredicate(format: "SELF MATCHES %@", specialCharRegEx)
        
        if specialCharTextTest.evaluate(with: text) {
            return true
        } else {
            return false
        }
    }
    
/// This is a regex that checks if it contains lowercase letters
/// - Parameter text: A string
/// - Returns: True if is lowercased, or false if not
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
