//
//  Recuperar3ViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

extension PasswordRecoveryPassword: UITextFieldDelegate {
    
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
            capitalizedLetterBulletPoint.label.textColor = UIColor(named: "label")
            numericCharactersBulletPoint.label.textColor = UIColor(named: "label")
            regularCharactersBulletPoint.label.textColor = UIColor(named: "label")
            specialCharactersBulletPoint.label.textColor = UIColor(named: "label")
            passwordBulletPoint.label.textColor = UIColor(named: "label")
        } else {
            
            if containsUppercasedLetters(text: passwordText) {
                capitalizedLetterBulletPoint.label.textColor = UIColor(named: "label")
                capitalizedLetterBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                containsUppercased = true
            } else {
                capitalizedLetterBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                capitalizedLetterBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
                containsUppercased = false
            }
            
            if (6...40).contains(passwordText.count) {
                passwordBulletPoint.label.textColor = UIColor(named: "label")
                passwordBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                textInsideRange = true
            } else {
                passwordBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                passwordBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
                textInsideRange = false
            }
            
            if containsNumericCharacters(text: passwordText) {
                numericCharactersBulletPoint.label.textColor = UIColor(named: "label")
                numericCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                containsNumericCharacters = true
            } else {
                numericCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                numericCharactersBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
                containsNumericCharacters = false
            }
            
            if containsSpecialCharacters(text: passwordText) {
                specialCharactersBulletPoint.label.textColor = UIColor(named: "label")
                specialCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                containsSpecialCharacters = true
            } else {
                specialCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                specialCharactersBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
                containsSpecialCharacters = false
            }
            
            if containsLowercasedCharacters(text: passwordText) {
                regularCharactersBulletPoint.label.textColor = UIColor(named: "label")
                regularCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                containsLowercased = true
            } else {
                regularCharactersBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                regularCharactersBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
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
                        samePasswordBulletPoint.label.textColor = UIColor(named: "label")
                        registerButton.backgroundColor = UIColor(named: "buttonGray")
                    } else {
                        if confirmPasswordText == passwordTextFieldClass.textField.text {
                            samePasswordBulletPoint.label.textColor = UIColor(named: "label")
                            samePasswordBulletPoint.ellipseImage.image = UIImage(named: "Ellipse green")
                            samePassword = true
                        } else {
                            samePasswordBulletPoint.ellipseImage.image = UIImage(named: "Ellipse red")
                            samePasswordBulletPoint.label.textColor = UIColor(named: "redAlertLabel")
                            samePassword = false
                        }
                    }
        
        if passwordOK, samePassword {
            registerButton.backgroundColor = UIColor(named: "buttonPink")
        } else {
            registerButton.backgroundColor = UIColor(named: "buttonGray")
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
