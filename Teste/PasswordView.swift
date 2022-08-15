//
//  SenhaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PasswordView: UIViewController{
    
    let backWay: UIImageView = {
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        return image
    }()
    
    lazy var progressBarButtons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockBlue.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        return buttons
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agora escolha uma senha de sua preferência."
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textAlignment = .center
        return label
    }()
    
    let passwordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.isSecureTextEntry = true
        textField.isHidden = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        return textField
    }()
    
    let stackMargins: CGFloat = 12
    
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordTFLabel, passwordTextField])
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.borderColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)?.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                               left: stackMargins,
                                               bottom: stackMargins,
                                               right: stackMargins)
        
        return stackView
    }()
    
    let hidePasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        return button
    }()
    
    let confirmPasswordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Repetir senha"
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.isHidden = true
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        return textField
    }()
    
    lazy var confirmStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [confirmPasswordTFLabel, confirmPasswordTextField])
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                               left: stackMargins,
                                               bottom: stackMargins,
                                               right: stackMargins)
        
        return stackView
    }()
    
    let hideConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        return button
    }()
    
    let numberCharEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let numberCharLabel: UILabel = {
        let label = UILabel()
        label.text = "No mínimo 6 caracteres"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let upperCaseEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let upperCaseLabel: UILabel = {
        let label = UILabel()
        label.text = "1 letra maiúscula"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let lowerCaseEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let lowerCaseLabel: UILabel = {
        let label = UILabel()
        label.text = "1 letra minúscula"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let numberEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1 digito numérico"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let specialCharEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let specialCharLabel: UILabel = {
        let label = UILabel()
        label.text = "1 caractere especial"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let samePasswordEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let samePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senhas coincidem"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let continueButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.addSubviews([backWay, descriptionLabel, passwordStackView, hidePasswordButton, confirmStackView, hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberLabel, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton])
        
        view.createRegisterCustomBar(progressBarButtons: progressBarButtons) {_ in
            
            print("Going Back")
        }
        
        continueButton.setToBottomButtonKeyboardDefault()
        
        addConstraints()
        addTargets()
        
        hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hideConfirmPassword), for: .touchUpInside)
    }
    
    func addConstraints(){
        
        descriptionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.top, view, CGFloat(250).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.right, view.safeAreaLayoutGuide)
        
        passwordStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        passwordStackView.constraintOutsideTo(.top, descriptionLabel, CGFloat(30).generateSizeForScreen)
        
        hidePasswordButton.constraintInsideTo(.height, passwordStackView)
        hidePasswordButton.widthAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        hidePasswordButton.constraintInsideTo(.centerY, passwordStackView)
        hidePasswordButton.constraintInsideTo(.trailing, passwordStackView)
        
        confirmStackView.constraintInsideTo(.height, passwordStackView)
        confirmStackView.constraintInsideTo(.leading, passwordStackView)
        confirmStackView.constraintInsideTo(.trailing, passwordStackView)
        confirmStackView.constraintOutsideTo(.top, passwordStackView, CGFloat(10).generateSizeForScreen)
        
        hideConfirmPasswordButton.constraintInsideTo(.height, hidePasswordButton)
        hideConfirmPasswordButton.constraintInsideTo(.width, hidePasswordButton)
        hideConfirmPasswordButton.constraintInsideTo(.centerY, confirmStackView)
        hideConfirmPasswordButton.constraintInsideTo(.trailing, confirmStackView)
        
        numberCharEllipse.heightAnchorInSuperview(CGFloat(4).generateSizeForScreen)
        numberCharEllipse.constraintOutsideTo(.width, numberCharEllipse)
        numberCharEllipse.constraintOutsideTo(.top, confirmStackView, CGFloat(11).generateSizeForScreen)
        numberCharEllipse.constraintInsideTo(.leading, confirmStackView)
        
        numberCharLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        numberCharLabel.constraintInsideTo(.centerY, numberCharEllipse)
        numberCharLabel.constraintOutsideTo(.leading, numberCharEllipse, CGFloat(5).generateSizeForScreen)
        
        upperCaseEllipse.constraintInsideTo(.height, numberCharEllipse)
        upperCaseEllipse.constraintOutsideTo(.width, upperCaseEllipse)
        upperCaseEllipse.constraintOutsideTo(.top, numberCharEllipse, CGFloat(10).generateSizeForScreen)
        upperCaseEllipse.constraintInsideTo(.leading, numberCharEllipse)
        
        upperCaseLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        upperCaseLabel.constraintInsideTo(.centerY, upperCaseEllipse)
        upperCaseLabel.constraintInsideTo(.leading, numberCharLabel)
        
        lowerCaseEllipse.constraintInsideTo(.height, numberCharEllipse)
        lowerCaseEllipse.constraintOutsideTo(.width, lowerCaseEllipse)
        lowerCaseEllipse.constraintOutsideTo(.top, upperCaseEllipse, CGFloat(10).generateSizeForScreen)
        lowerCaseEllipse.constraintInsideTo(.leading, upperCaseEllipse)
        
        lowerCaseLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        lowerCaseLabel.constraintInsideTo(.centerY, lowerCaseEllipse)
        lowerCaseLabel.constraintInsideTo(.leading, numberCharLabel)
        
        numberEllipse.constraintInsideTo(.height, numberCharEllipse)
        numberEllipse.constraintOutsideTo(.width, numberEllipse)
        numberEllipse.constraintInsideTo(.top, numberCharEllipse)
        numberEllipse.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(120).generateSizeForScreen)
        
        numberLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        numberLabel.constraintInsideTo(.centerY, numberEllipse)
        numberLabel.constraintOutsideTo(.leading, numberEllipse, CGFloat(5).generateSizeForScreen)
        
        specialCharEllipse.constraintInsideTo(.height, numberCharEllipse)
        specialCharEllipse.constraintOutsideTo(.width, specialCharEllipse)
        specialCharEllipse.constraintOutsideTo(.top, numberEllipse, CGFloat(10).generateSizeForScreen)
        specialCharEllipse.constraintInsideTo(.leading, numberEllipse)
        
        specialCharLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        specialCharLabel.constraintInsideTo(.centerY, specialCharEllipse)
        specialCharLabel.constraintInsideTo(.leading, numberLabel)
        
        samePasswordEllipse.constraintInsideTo(.height, numberCharEllipse)
        samePasswordEllipse.constraintOutsideTo(.width, samePasswordEllipse)
        samePasswordEllipse.constraintOutsideTo(.top, specialCharEllipse, CGFloat(10).generateSizeForScreen)
        samePasswordEllipse.constraintInsideTo(.leading, specialCharEllipse)
        
        samePasswordLabel.heightAnchorInSuperview(CGFloat(11).generateSizeForScreen)
        samePasswordLabel.constraintInsideTo(.centerY, samePasswordEllipse)
        samePasswordLabel.constraintInsideTo(.leading, numberLabel)
    }
    
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
        let specialCharacterRegEx = ".*[!&^%$#@()/.*+]+.*"
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
                                
                                confirmPasswordTFLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
                                confirmStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.redAlertLabel.rawValue) ?? .red, width: 1, y: 1)
                            }
                        }
                    }
                }
            }
        }
        else {
            
            passwordTFLabel.textColor = .gray
            passwordStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
            
            confirmPasswordTFLabel.textColor = .gray
            confirmStackView.addBottomLineWithColor(color: UIColor(named: ColorsBravve.blue.rawValue) ?? .blue, width: 1, y: 1)
            
            hidePasswordButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
            hideConfirmPasswordButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        }
    }
}






