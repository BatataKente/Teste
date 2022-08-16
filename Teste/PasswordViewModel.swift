//
//  PasswordViewModel.swift
//  Teste
//
//  Created by user218260 on 8/16/22.
//

import UIKit

extension PasswordView: UITextFieldDelegate {
    @objc func continueAction() {
        
        print("Going On")
    }
    
    @objc func hideConfirmPassword(_ sender: UIButton){
        
        confirmPasswordTextField.isSecureTextEntry.toggle()
        
        if confirmPasswordTextField.isSecureTextEntry {
            hideConfirmPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        } else {
            hideConfirmPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue), for: .normal)
        }
    }
    
    @objc func hideWrongConfirmPassword(_ sender: UIButton){
        
        confirmPasswordTextField.isSecureTextEntry.toggle()
        
        if confirmPasswordTextField.isSecureTextEntry {
            hideWrongConfirmPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        } else {
            hideWrongConfirmPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeOpenRed.rawValue), for: .normal)
        }
    }
    
    @objc func hideWrongPassword(_ sender: UIButton){
        
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            hideWrongPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        } else {
            hideWrongPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeOpenRed.rawValue), for: .normal)
        }
    }
    
    @objc func hidePassword(_ sender: UIButton){
        
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            hidePasswordButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        } else {
            hidePasswordButton.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue), for: .normal)
        }
    }
    
    func addTargets() {
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        passwordStackView.addGestureRecognizer(stackViewTap)
        
        let stackViewTap_ = UITapGestureRecognizer(target: self, action: #selector(confirmStackViewTapped))
        confirmStackView.addGestureRecognizer(stackViewTap_)
    }
    
    @objc func confirmStackViewTapped() {
        
        confirmPasswordTFLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        confirmPasswordTextField.addTarget(self, action: #selector(confirmChangeText), for: .editingChanged)
        confirmStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
        confirmPasswordTextField.isHidden = false
    }
    
    @objc func stackViewTapped() {
        
        passwordTFLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        passwordTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)
        passwordStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
        passwordTextField.isHidden = false
    }
    
    @objc func changeText(_ sender: UITextField) {
        
        let upperCaseRegEx = ".*[A-Z]+.*"
        let upperCaseTest = NSPredicate(format: "SELF MATCHES %@", upperCaseRegEx)
        let numericRegEx = ".*[0-9]+.*"
        let numericRegExTest = NSPredicate(format: "SELF MATCHES %@", numericRegEx)
        let specialCharacterRegEx = ".*[\\^$*.\\[\\]\\\\{}()?\\-\"!@#%&/,><':;|_~`+=]+.*"
        let specialChracterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        let lowerCaseRegEx = ".*[a-z]+.*"
        let lowerCaseTest = NSPredicate(format: "SELF MATCHES %@", lowerCaseRegEx)
        
        var passwordText: String = ""
        
        if let password = passwordTextField.text {
            
            passwordText = password
        }
        
        if passwordText.isEmpty {
            
            numberCharEllipse.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            upperCaseEllipse.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            lowerCaseEllipse.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            numberEllipse.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
            specialCharEllipse.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        }
        else {
            
            if upperCaseTest.evaluate(with: passwordTextField.text!){
                upperCaseEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                upperCaseLabel.textColor = .label
            }
            else {
                
                upperCaseEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                upperCaseLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            }
            
            if lowerCaseTest.evaluate(with: passwordTextField.text!){
                
                lowerCaseEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                lowerCaseLabel.textColor = .label
            }
            else {
                
                lowerCaseEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                lowerCaseLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            }
            
            if numericRegExTest.evaluate(with: passwordTextField.text!){
                
                numberEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                numberLabel.textColor = .label
            }
            else {
                
                numberEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                numberLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            }
            
            if specialChracterTest.evaluate(with: passwordTextField.text!){
                
                specialCharEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                specialCharLabel.textColor = .label
            }
            else {
                
                specialCharEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                specialCharLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            }
            
            if (passwordTextField.text?.count ?? 0) < 6 {
                
                numberCharEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                numberCharLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            }
            else {
                
                numberCharEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                numberCharLabel.textColor = .label
            }
            
        }
    }
    
    @objc func confirmChangeText(_ sender: UITextField) {
        
        var passwordText: String = ""
        
        if let password = confirmPasswordTextField.text {
            
            passwordText = password
        }
        
        if passwordText.isEmpty {
            
            samePasswordEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
            samePasswordLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            continueButton.backgroundColor = .gray
        }
        else {
            
            if confirmPasswordTextField.text == passwordTextField.text {
                samePasswordEllipse.image = UIImage(named: IconsBravve.ellipseGreen.rawValue)
                samePasswordLabel.textColor = .label
                
            }
            else {
                
                samePasswordEllipse.image = UIImage(named: IconsBravve.ellipseRed.rawValue)
                samePasswordLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                continueButton.backgroundColor = .gray
            }
        }
        
        if samePasswordEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue) {
            
            if numberCharEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue){
                
                if upperCaseEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue){
                    
                    if lowerCaseEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue){
                        
                        if numberEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue){
                            
                            if specialCharEllipse.image == UIImage(named: IconsBravve.ellipseGreen.rawValue){
                                
                                continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
                                continueButton.addTarget(nil, action: #selector(continueAction), for: .touchUpInside)
                            }
                            else {
                                
                                continueButton.removeTarget(nil, action: #selector(continueAction), for: .touchUpInside)
                                continueButton.backgroundColor = .gray
                            }
                        }
                    }
                }
            }
        }
        else {
            
            continueButton.removeTarget(nil, action: #selector(continueAction), for: .touchUpInside)
            continueButton.backgroundColor = .gray
        }
        if samePasswordEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue) {
            
            if numberCharEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue){
                
                if upperCaseEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue){
                    
                    if lowerCaseEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue){
                        
                        if numberEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue){
                            
                            if specialCharEllipse.image == UIImage(named: IconsBravve.ellipseRed.rawValue){
                                
                                passwordTFLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                passwordStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.redAlertLabel.rawValue) ?? .red, width: 1, y: 1)
                                
                                hideWrongPasswordButton.isHidden = false
                                hidePasswordButton.isHidden = true
                                
                                confirmPasswordTFLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                confirmStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.redAlertLabel.rawValue) ?? .red, width: 1, y: 1)
                                
                                hideWrongConfirmPasswordButton.isHidden = false
                                hideConfirmPasswordButton.isHidden = true
                                
                                
                            }
                        }
                    }
                }
            }
        }
        else {
            
            passwordTFLabel.textColor = .gray
            passwordStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
            hideWrongPasswordButton.isHidden = true
            hidePasswordButton.isHidden = false
            
            confirmPasswordTFLabel.textColor = .gray
            confirmStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
            hideWrongConfirmPasswordButton.isHidden = true
            hideConfirmPasswordButton.isHidden = false
           
        }
    }
}
