//
//  Recuperar3ViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

extension RecuperacaoDeSenha3: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextFieldClass.textField {
            textField.resignFirstResponder()
            confirmPasswordTextFieldClass.textField.isHidden = false
            confirmPasswordTextFieldClass.label.font = UIFont(name: "Ubuntu-Light", size: 11)
            confirmPasswordTextFieldClass.textField.becomeFirstResponder()
            return true
        } else {
            return false
        }
    }
    
    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        
        var passwordText: String = ""
        
            if let password = textField.text {
                passwordText = password
            }
        
        if passwordText.isEmpty {
            capitalizedLetterBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            numericCharactersBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            regularCharactersBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            specialCharactersBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
            passwordBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        } else {
            
            if containsUppercasedLetters(text: passwordText) {
                capitalizedLetterBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                containsUppercased = true
            } else {
                capitalizedLetterBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                containsUppercased = false
            }
            
            if (6...40).contains(passwordText.count) {
                passwordBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                textInsideRange = true
            } else {
                passwordBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                textInsideRange = false
            }
            
            if containsNumericCharacters(text: passwordText) {
                numericCharactersBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                containsNumericCharacters = true
            } else {
                numericCharactersBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                containsNumericCharacters = false
            }
            
            if containsSpecialCharacters(text: passwordText) {
                specialCharactersBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                containsSpecialCharacters = true
            } else {
                specialCharactersBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                containsSpecialCharacters = false
            }
            
            if containsLowercasedCharacters(text: passwordText) {
                regularCharactersBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                containsLowercased = true
            } else {
                regularCharactersBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                containsLowercased = false
            }
            
        }
    }
    
    @objc func confirmPasswordTextFieldDidChange(_ textField: UITextField) {

        var confirmPasswordText = ""
        var passwordOK = false
        var samePassword = false
        
        if textInsideRange, containsUppercased, containsLowercased, containsSpecialCharacters, containsNumericCharacters {
            passwordOK = true
        } else {
            passwordOK = false
        }
        if let confirmPassword = textField.text {
            confirmPasswordText = confirmPassword
        }

                    if confirmPasswordText == "" {
                        samePasswordBulletPoint.label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
                        continueButton.backgroundColor = UIColor(red: 0.435, green: 0.455, blue: 0.475, alpha: 1)
                    } else {
                        if confirmPasswordText == passwordTextFieldClass.textField.text {
                            samePasswordBulletPoint.label.textColor = UIColor(red: 0, green: 0.697, blue: 0.225, alpha: 1)
                            samePassword = true
                        } else {
                            samePasswordBulletPoint.label.textColor = UIColor(red: 0.837, green: 0, blue: 0, alpha: 1)
                            samePassword = false
                        }
                    }
        
        if passwordOK, samePassword {
            continueButton.backgroundColor = UIColor(red: 1, green: 0.125, blue: 0.475, alpha: 1)
        } else {
            continueButton.backgroundColor = UIColor(red: 0.435, green: 0.455, blue: 0.475, alpha: 1)
        }
    }

    @objc func passwordEyeSlashButtonTapped() {

        if passwordEyeSlash {
            passwordTextFieldClass.textField.isSecureTextEntry = true
            passwordEyeSlash = !passwordEyeSlash
            passwordTextFieldClass.textFieldButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            passwordTextFieldClass.textField.isSecureTextEntry = false
            passwordEyeSlash = !passwordEyeSlash
            passwordTextFieldClass.textFieldButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
    }
    
    @objc func confirmPasswordEyeSlashButtonTapped() {

        if confirmPasswordEyeSlash {
            confirmPasswordTextFieldClass.textField.isSecureTextEntry = true
            confirmPasswordEyeSlash = !confirmPasswordEyeSlash
            confirmPasswordTextFieldClass.textFieldButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            confirmPasswordTextFieldClass.textField.isSecureTextEntry = false
            confirmPasswordEyeSlash = !confirmPasswordEyeSlash
            confirmPasswordTextFieldClass.textFieldButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
    }
}
