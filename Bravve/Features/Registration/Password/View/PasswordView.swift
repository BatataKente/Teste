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
    
    lazy var goBackButton: UIButton = {
        let button = UIButton()
        button.setToBackButtonDefault(.backPink, CGFloat(32.76).generateSizeForScreen){_ in self.dismiss(animated: false)}
        return button
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.setLogoToDefault(.logoBlue)
        return image
    }()
    
    lazy var progressBarButtons: [UIButton] = {
        var buttons = [UIButton()]
        buttons = createProgressBarButtons(["userGray", "cellGray", "emailGray", "padlockBlue", "hobbiesGray"])
        return buttons
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressBarButtons)
        return stackView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agora escolha uma senha de sua preferência."
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textAlignment = .center
        return label
    }()
    
    let passwordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = UIColor(named: "labelTextfield")
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
        stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
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
        button.setImage(UIImage(named: "eyeClose"), for: .normal)
        return button
    }()
    
    let confirmPasswordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Repetir senha"
        label.textColor = UIColor(named: "labelTextfield")
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
        stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
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
        button.setImage(UIImage(named: "eyeClose"), for: .normal)
        return button
    }()
    
    let numberCharEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ellipseGray")
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
        image.image = UIImage(named: "ellipseGray")
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
        image.image = UIImage(named: "ellipseGray")
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
        image.image = UIImage(named: "ellipseGray")
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
        image.image = UIImage(named: "ellipseGray")
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
        image.image = UIImage(named: "ellipseGray")
        return image
    }()
    
    let samePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senhas coincidem"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setToBottomButtonKeyboardDefault()
        return button
    }()
    
    let hideWrongPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    let hideWrongConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubviews([backWay,goBackButton, logoImage, logoImage, stackView, descriptionLabel, passwordStackView, hidePasswordButton, confirmStackView, hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberLabel, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton, hideWrongPasswordButton, hideWrongConfirmPasswordButton])
        
        addConstraints()
        addTargets()
        
        hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hideConfirmPassword), for: .touchUpInside)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
    }
    
    func addConstraints(){
        
        goBackButton.constraintTo(.left, view.safeAreaLayoutGuide, 32.76)
        goBackButton.constraintTo(.top, view.safeAreaLayoutGuide, 73)
        goBackButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        goBackButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        logoImage.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        logoImage.constraintInsideTo(.top, view.safeAreaLayoutGuide, 65)
        logoImage.heightAnchor.constraint(equalToConstant: 43).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 163.22).isActive = true
        
        stackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.top, logoImage, 62)
        
        descriptionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        descriptionLabel.heightAnchor.constraint(equalToConstant: 43).isActive = true
        descriptionLabel.constraintOutsideTo(.top, logoImage, 124.5)
        descriptionLabel.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.right, view.safeAreaLayoutGuide)
        
        passwordStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        passwordStackView.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        passwordStackView.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        passwordStackView.constraintOutsideTo(.top, descriptionLabel, 30)
        
        hidePasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hidePasswordButton.constraintInsideTo(.top, passwordStackView, 25)
        hidePasswordButton.constraintInsideTo(.right, passwordStackView, -15)
        
        confirmStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmStackView.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        confirmStackView.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        confirmStackView.constraintOutsideTo(.top, passwordStackView, 10)
        
        hideConfirmPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideConfirmPasswordButton.constraintInsideTo(.top, confirmStackView, 25)
        hideConfirmPasswordButton.constraintInsideTo(.right, confirmStackView, -15)
        
        numberCharEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        numberCharEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        numberCharEllipse.constraintOutsideTo(.top, confirmStackView, 15)
        numberCharEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        
        numberCharLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        numberCharLabel.constraintOutsideTo(.top, confirmStackView, 10)
        numberCharLabel.constraintOutsideTo(.left, numberCharEllipse, 10)
        
        upperCaseEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        upperCaseEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        upperCaseEllipse.constraintOutsideTo(.top, numberCharEllipse, 10)
        upperCaseEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        
        upperCaseLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        upperCaseLabel.constraintOutsideTo(.top, numberCharLabel, 5)
        upperCaseLabel.constraintOutsideTo(.left, upperCaseEllipse, 10)
        
        lowerCaseEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        lowerCaseEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        lowerCaseEllipse.constraintOutsideTo(.top, upperCaseEllipse, 10)
        lowerCaseEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        
        lowerCaseLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        lowerCaseLabel.constraintOutsideTo(.top, upperCaseLabel, 5)
        lowerCaseLabel.constraintOutsideTo(.left, lowerCaseEllipse, 10)
        
        numberEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        numberEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        numberEllipse.constraintOutsideTo(.top, confirmStackView, 15)
        numberEllipse.constraintInsideTo(.right, view.safeAreaLayoutGuide, -120)
        
        numberLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        numberLabel.constraintOutsideTo(.top, confirmStackView, 10)
        numberLabel.constraintOutsideTo(.left, numberEllipse, 10)
        
        specialCharEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        specialCharEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        specialCharEllipse.constraintOutsideTo(.top, numberEllipse, 10)
        specialCharEllipse.constraintInsideTo(.right, view.safeAreaLayoutGuide, -120)
        
        specialCharLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        specialCharLabel.constraintOutsideTo(.top, numberLabel, 5)
        specialCharLabel.constraintOutsideTo(.left, specialCharEllipse, 10)
        
        samePasswordEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        samePasswordEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        samePasswordEllipse.constraintOutsideTo(.top, specialCharEllipse, 10)
        samePasswordEllipse.constraintInsideTo(.right, view.safeAreaLayoutGuide, -120)
        
        samePasswordLabel.heightAnchor.constraint(equalToConstant: 11).isActive = true
        samePasswordLabel.constraintOutsideTo(.top, specialCharLabel, 5)
        samePasswordLabel.constraintOutsideTo(.left, samePasswordEllipse, 10)
        
        continueButton.heightAnchor.constraint(equalToConstant: 51).isActive = true
        continueButton.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        continueButton.constraintInsideTo(.right, view.safeAreaLayoutGuide)
        continueButton.constraintOutsideTo(.bottom, view.keyboardLayoutGuide)
        
        hideWrongPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideWrongPasswordButton.constraintInsideTo(.top, passwordStackView, 25)
        hideWrongPasswordButton.constraintInsideTo(.right, passwordStackView, -15)
        
        hideWrongConfirmPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideWrongConfirmPasswordButton.constraintInsideTo(.top, confirmStackView, 25)
        hideWrongConfirmPasswordButton.constraintInsideTo(.right, confirmStackView, -15)
        
    }
    
    @objc func goBack(sender: UIButton){
        print("Going Back")
    }
    
    @objc func continueAction() {
        print("Going On")
    }
    
    @objc func hideConfirmPassword(_ sender: UIButton){
        confirmPasswordTextField.isSecureTextEntry.toggle()
        
        if confirmPasswordTextField.isSecureTextEntry {
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
    }
    
    @objc func hidePassword(_ sender: UIButton){
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            hidePasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            hidePasswordButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
    }
    
    @objc func hidingWrongPassword(_ sender: UIButton){
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            hideWrongPasswordButton.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        } else {
            hideWrongPasswordButton.setImage(UIImage(named: "eyeOpenRed"), for: .normal)
        }
        
    }
    
    @objc func hidingWrongConfirmPassword(_ sender: UIButton){
        confirmPasswordTextField.isSecureTextEntry.toggle()
        
        if confirmPasswordTextField.isSecureTextEntry {
            hideWrongConfirmPasswordButton.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        } else {
            hideWrongConfirmPasswordButton.setImage(UIImage(named: "eyeOpenRed"), for: .normal)
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
        confirmStackView.addBottomLineWithColor(color: UIColor(named: "blueNav")!, width: 1, y: 1)
        confirmPasswordTextField.isHidden = false
    }
    
    @objc func stackViewTapped() {
        passwordTFLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        passwordTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)
        passwordStackView.addBottomLineWithColor(color: UIColor(named: "blueNav")!, width: 1, y: 1)
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
            numberCharEllipse.image = UIImage(named: "ellipseGray")
            upperCaseEllipse.image = UIImage(named: "ellipseGray")
            lowerCaseEllipse.image = UIImage(named: "ellipseGray")
            numberEllipse.image = UIImage(named: "ellipseGray")
            specialCharEllipse.image = UIImage(named: "ellipseGray")
        } else {
            if upperCaseTest.evaluate(with: passwordTextField.text!){
                upperCaseEllipse.image = UIImage(named: "ellipseGreen")
                upperCaseLabel.textColor = .label
            } else {
                upperCaseEllipse.image = UIImage(named: "ellipseRed")
                upperCaseLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if lowerCaseTest.evaluate(with: passwordTextField.text!){
                lowerCaseEllipse.image = UIImage(named: "ellipseGreen")
                lowerCaseLabel.textColor = .label
            } else {
                lowerCaseEllipse.image = UIImage(named: "ellipseRed")
                lowerCaseLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if numericRegExTest.evaluate(with: passwordTextField.text!){
                numberEllipse.image = UIImage(named: "ellipseGreen")
                numberLabel.textColor = .label
            } else {
                numberEllipse.image = UIImage(named: "ellipseRed")
                numberLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if specialChracterTest.evaluate(with: passwordTextField.text!){
                specialCharEllipse.image = UIImage(named: "ellipseGreen")
                specialCharLabel.textColor = .label
            } else {
                specialCharEllipse.image = UIImage(named: "ellipseRed")
                specialCharLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if (passwordTextField.text?.count ?? 0) < 6 {
                numberCharEllipse.image = UIImage(named: "ellipseRed")
                numberCharLabel.textColor = UIColor(named: "redAlertLabel")
            } else {
                numberCharEllipse.image = UIImage(named: "ellipseGreen")
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
            samePasswordEllipse.image = UIImage(named: "ellipseRed")
            samePasswordLabel.textColor = UIColor(named: "redAlertLabel")
            continueButton.backgroundColor = .gray
        } else {
            if confirmPasswordTextField.text == passwordTextField.text {
                samePasswordEllipse.image = UIImage(named: "ellipseGreen")
                samePasswordLabel.textColor = .label
                
            } else {
                samePasswordEllipse.image = UIImage(named: "ellipseRed")
                samePasswordLabel.textColor = UIColor(named: "redAlertLabel")
                continueButton.backgroundColor = .gray
            }
        }
        
        if samePasswordEllipse.image == UIImage(named: "ellipseGreen") {
            if numberCharEllipse.image == UIImage(named: "ellipseGreen"){
                if upperCaseEllipse.image == UIImage(named: "ellipseGreen"){
                    if lowerCaseEllipse.image == UIImage(named: "ellipseGreen"){
                        if numberEllipse.image == UIImage(named: "ellipseGreen"){
                            if specialCharEllipse.image == UIImage(named: "ellipseGreen"){
                                continueButton.backgroundColor = UIColor(named: "buttonPink")
                                continueButton.addTarget(nil, action: #selector(continueAction), for: .touchUpInside)
                            } else {
                                continueButton.removeTarget(nil, action: #selector(continueAction), for: .touchUpInside)
                                continueButton.backgroundColor = .gray
                            }
                        }
                    }
                }
            }
        } else {
            continueButton.removeTarget(nil, action: #selector(continueAction), for: .touchUpInside)
            continueButton.backgroundColor = .gray
        }
        if samePasswordEllipse.image == UIImage(named: "ellipseRed") {
            if numberCharEllipse.image == UIImage(named: "ellipseRed"){
                if upperCaseEllipse.image == UIImage(named: "ellipseRed"){
                    if lowerCaseEllipse.image == UIImage(named: "ellipseRed"){
                        if numberEllipse.image == UIImage(named: "ellipseRed"){
                            if specialCharEllipse.image == UIImage(named: "ellipseRed"){
                                
                                passwordTFLabel.textColor = UIColor(named: "redAlertLabel")
                                passwordStackView.addBottomLineWithColor(color: UIColor(named: "redAlertLabel")!, width: 1, y: 1)
                                
                                confirmPasswordTFLabel.textColor = UIColor(named: "redAlertLabel")
                                confirmStackView.addBottomLineWithColor(color: UIColor(named: "redAlertLabel")!, width: 1, y: 1)
                                
                                hideWrongPasswordButton.isHidden = false
                                hidePasswordButton.isHidden = true
                                hideWrongPasswordButton.addTarget(self, action: #selector(hidingWrongPassword), for: .touchUpInside)
                                hideWrongConfirmPasswordButton.isHidden = false
                                hideConfirmPasswordButton.isHidden = true
                                hideWrongConfirmPasswordButton.addTarget(self, action: #selector(hidingWrongConfirmPassword), for: .touchUpInside)
                                
                            }
                        }
                    }
                }
            }
        } else {
            passwordTFLabel.textColor = .gray
            passwordStackView.addBottomLineWithColor(color: UIColor(named: "blueNav")!, width: 1, y: 1)
            
            confirmPasswordTFLabel.textColor = .gray
            confirmStackView.addBottomLineWithColor(color: UIColor(named: "blueNav")!, width: 1, y: 1)
            
            hidePasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
            
            hideWrongPasswordButton.isHidden = true
            hidePasswordButton.isHidden = false
            
            hideWrongConfirmPasswordButton.isHidden = true
            hideConfirmPasswordButton.isHidden = false
        }
    }        }






