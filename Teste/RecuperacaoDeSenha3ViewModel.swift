//
//  RecuperacaoDeSenha3ViewModel.swift
//  Teste
//
//  Created by user208023 on 8/4/22.
//

import UIKit

extension PasswordRecoveryPassword: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextFieldClass.textField {
            textField.resignFirstResponder()
            confirmPasswordTextFieldClass.textField.isHidden = false
            confirmPasswordTextFieldClass.label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
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
            capitalizedLetterBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            capitalizedLetterBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            numericCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            numericCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            regularCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            regularCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            specialCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            specialCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            passwordBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            passwordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        } else {
            
            if containsUppercasedLetters(text: passwordText) {
                capitalizedLetterBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                capitalizedLetterBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                containsUppercased = true
                invalidCharacters = false
            } else {
                capitalizedLetterBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                capitalizedLetterBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                containsUppercased = false
                invalidCharacters = true
            }
            
            if (6...40).contains(passwordText.count) {
                passwordBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                passwordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                textInsideRange = true
                invalidCharacters = false
            } else {
                passwordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                passwordBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                textInsideRange = false
                invalidCharacters = true
            }
            
            if containsNumericCharacters(text: passwordText) {
                numericCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                numericCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                containsNumericCharacters = true
                invalidCharacters = false
            } else {
                numericCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                numericCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                containsNumericCharacters = false
                invalidCharacters = true
            }
            
            if containsSpecialCharacters(text: passwordText) {
                specialCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                specialCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                containsSpecialCharacters = true
                invalidCharacters = false
            } else {
                specialCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                specialCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                containsSpecialCharacters = false
                invalidCharacters = true
            }
            
            if containsLowercasedCharacters(text: passwordText) {
                regularCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                regularCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                containsLowercased = true
                invalidCharacters = false
            } else {
                regularCharactersBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                regularCharactersBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                containsLowercased = false
                invalidCharacters = true
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
                        samePasswordBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                        samePasswordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
                        passwordTextFieldClass.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                        passwordTextFieldClass.textFieldButton.tintColor = UIColor(named: ColorsBravve.blue.rawValue)
                        passwordTextFieldClass.shadow.backgroundColor = .blue
                        confirmPasswordTextFieldClass.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                        confirmPasswordTextFieldClass.textFieldButton.tintColor = UIColor(named: ColorsBravve.blue.rawValue)
                        confirmPasswordTextFieldClass.shadow.backgroundColor = .blue
                        registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
                    } else {
                        if confirmPasswordText == passwordTextFieldClass.textField.text {
                            samePasswordBulletPoint.label.textColor = UIColor(named: ColorsBravve.label.rawValue)
                            samePasswordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                            samePassword = true
                        } else {
                            
                            if !confirmPasswordText.isEmpty && invalidCharacters {
                                passwordTextFieldClass.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                passwordTextFieldClass.textFieldButton.tintColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                confirmPasswordTextFieldClass.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                confirmPasswordTextFieldClass.textFieldButton.tintColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                passwordTextFieldClass.shadow.backgroundColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                confirmPasswordTextFieldClass.shadow.backgroundColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                samePasswordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                                samePasswordBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                samePassword = false
                                
                            } else {
                            samePasswordBulletPoint.ellipseImage.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                            samePasswordBulletPoint.label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                            samePassword = false
                            }
                        }
                    }
        
        if passwordOK, samePassword {
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        } else {
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        }
    }

    @objc func passwordEyeSlashButtonTapped() {

        if passwordEyeSlash {
            passwordTextFieldClass.textField.isSecureTextEntry = true
            passwordEyeSlash = !passwordEyeSlash
            passwordTextFieldClass.textFieldButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue)?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            passwordTextFieldClass.textField.isSecureTextEntry = false
            passwordEyeSlash = !passwordEyeSlash
            passwordTextFieldClass.textFieldButton.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue)?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    @objc func confirmPasswordEyeSlashButtonTapped() {

        if confirmPasswordEyeSlash {
            confirmPasswordTextFieldClass.textField.isSecureTextEntry = true
            confirmPasswordEyeSlash = !confirmPasswordEyeSlash
            confirmPasswordTextFieldClass.textFieldButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue)?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            confirmPasswordTextFieldClass.textField.isSecureTextEntry = false
            confirmPasswordEyeSlash = !confirmPasswordEyeSlash
            confirmPasswordTextFieldClass.textFieldButton.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue)?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
}
