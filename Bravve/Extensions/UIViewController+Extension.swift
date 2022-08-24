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
        
        let phoneRegEx = "\\([0-9]{2}+\\)[0-9]{4,5}+-[0-9]{4}||[0-9]{10,11}"

        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        
        if phonePred.evaluate(with: phone) {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid text
/// - Parameter text: A string with the text
/// - Returns: True if is a valid text, or false if not
    func validateTextField(_ text: String) -> Bool {
        
        if text != "" {

            return true
        }
        
        return false
    }
    
/// This is a regex that checks if it's a valid cpf
/// - Parameter cpf: A string with the cpf
/// - Returns: True if is a valid cpf, or false if not
    func validateCPF(_ cpf: String) -> Bool {
        
        if cpf.isCPF {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid password
/// - Parameters:
///   - password: A string with the password
///   - passwordConfirm: A string with the passwordConfirm
/// - Returns: True if is password is equal to passwordConfirm, or false if not
    func validatePassword(_ password: String,
                          _ passwordConfirm: String) -> Bool {
        
        if password == passwordConfirm {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid email
/// - Parameter cpf: A string with the email
/// - Returns: True if is a valid email, or false if not
    func validateEmail(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailPred.evaluate(with: email) {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid date
/// - Parameter cpf: A string with the date
/// - Returns: True if is a valid date, or false if not
    func validateDate(_ date: String) -> Bool {
        
        let dateRegEx = "[0-9]{2}+/[0-9]{2}+/[0-9]{4}||[0-9]{8}"
        
        let datePred = NSPredicate(format:"SELF MATCHES %@", dateRegEx)
        
        if datePred.evaluate(with: date) {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid name
/// - Parameter cpf: A string with the name
/// - Returns: True if is a valid name, or false if not
    func validateName(_ name: String) -> Bool {
        
        let nameRegEx = "^[a-zA-Zá-üÁ-Ü]{2,8}+(([',. -][a-zA-Zá-üÁ-Ü])?[a-zA-Zá-üÁ-Ü]*)*$"

        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        
        if namePred.evaluate(with: name) {
            
            return true
        }
        return false
    }
    
/// This is a regex that checks if it's a valid cep
/// - Parameter cpf: A string with the cep
/// - Returns: True if is a valid cep, or false if not
    func validateCep(_ cep: String) -> Bool {
        
        let cepRegEx = "[0-9]{5}+[0-9]{3}||[0-9]{5}+-[0-9]{3}"

        let cepPred = NSPredicate(format:"SELF MATCHES %@", cepRegEx)
        
        if cepPred.evaluate(with: cep) {
            
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
        }
        else {
            
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
        }
        else {
            
            return false
        }
    }
}
