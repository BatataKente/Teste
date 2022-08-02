//
//  ViewController.swift
//  BRAVE - TelaRecuperacaodeSenha3
//
//  Created by user208023 on 7/18/22.
//

import UIKit

class RecuperacaoDeSenha3: UIViewController {
    
    var passwordEyeSlash = false
    var confirmPasswordEyeSlash = false
    var containsUppercased = false
    var containsLowercased = false
    var textInsideRange = false
    var containsSpecialCharacters = false
    var containsNumericCharacters = false
    var invalidCharacters = true
    
    let way = UIImageView()
    
    private let bravveIcon = UIImageView()
    
    private let backButton = UIButton()
    
    let registerButton = UIButton()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons([IconsBravve.emailGray.rawValue,
                                                IconsBravve.padlockBlue.rawValue])
        buttons[1].configuration?.title = " Recuperar Senha"
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 7
        
        return (stack: stackView,
                buttons: buttons)
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite e confirme sua nova senha!"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 16)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let passwordTextFieldClass = TextField(placeHolderText: "Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    lazy var passwordStackView = passwordTextFieldClass.createStackView()
    
    let confirmPasswordTextFieldClass = TextField(placeHolderText: "Repita a Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    lazy var confirmPasswordStackView = confirmPasswordTextFieldClass.createStackView()
    
    let passwordBulletPoint = BulletPoint(labelText: "No mínimo 6 caracteres")
    lazy var passswordCharactersStackView = passwordBulletPoint.createBulletPointStackView()
    
    let capitalizedLetterBulletPoint = BulletPoint(labelText: "1 letra maiúscula")
    lazy var capitalizedLetterStackView = capitalizedLetterBulletPoint.createBulletPointStackView()
    
    let regularCharactersBulletPoint = BulletPoint(labelText: "1 letra minúscula")
    lazy var regularCharactersStackView = regularCharactersBulletPoint.createBulletPointStackView()
    
    lazy var leftStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passswordCharactersStackView, capitalizedLetterStackView, regularCharactersStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let numericCharactersBulletPoint = BulletPoint(labelText: "1 dígito numérico")
    lazy var numericCharactersStackView = numericCharactersBulletPoint.createBulletPointStackView()
    
    let specialCharactersBulletPoint = BulletPoint(labelText: "1 caractere especial")
    lazy var specialCharactersStackView = specialCharactersBulletPoint.createBulletPointStackView()
    
    let samePasswordBulletPoint = BulletPoint(labelText: "Senhas coincidem")
    lazy var samePasswordStackView = samePasswordBulletPoint.createBulletPointStackView()
    
    lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numericCharactersStackView, specialCharactersStackView, samePasswordStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([way, bravveIcon, backButton, progressBarStackView.stack, sectionLabel, passwordTextFieldClass.shadow, passwordStackView, confirmPasswordTextFieldClass.shadow, confirmPasswordStackView, leftStackView, rightStackView, registerButton])
        
        setupDefaults()
        setupConstraints()
        
        
        passwordTextFieldClass.textField.delegate = self
        passwordTextFieldClass.textFieldButton.addTarget(self, action: #selector(passwordEyeSlashButtonTapped), for: .touchUpInside)
        confirmPasswordTextFieldClass.textFieldButton.addTarget(self, action: #selector(confirmPasswordEyeSlashButtonTapped), for: .touchUpInside)
        
        passwordTextFieldClass.textField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextFieldClass.textField.addTarget(self, action: #selector(confirmPasswordTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setupDefaults() {
        way.setWayToDefault(.wayPassword)
        backButton.setToBackButtonDefault(.backPink)
        bravveIcon.setLogoToDefault()
        registerButton.setToBottomButtonKeyboardDefault("Continuar")
    }
    
    private func setupConstraints() {
        
        progressBarStackView.stack.constraintOutsideTo(.top, bravveIcon, 40)
        progressBarStackView.stack.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.stack.heightAnchorInSuperview()
        
        sectionLabel.constraintOutsideTo(.top, progressBarStackView.stack, 40)
        sectionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        sectionLabel.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.8)
        
        passwordStackView.constraintOutsideTo(.top, sectionLabel, 10)
        passwordStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        passwordStackView.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.88)
        passwordStackView.constraintInsideTo(.height, view.safeAreaLayoutGuide, multiplier: 0.073)
        
        passwordTextFieldClass.shadow.constraintInsideTo(.top, passwordStackView)
        passwordTextFieldClass.shadow.constraintInsideTo(.leading, passwordStackView)
        passwordTextFieldClass.shadow.constraintInsideTo(.trailing, passwordStackView)
        passwordTextFieldClass.shadow.constraintTo(.bottom, passwordStackView, 1)
        
        
        passwordTextFieldClass.textField.widthAnchor.constraint(equalTo: passwordStackView.widthAnchor, multiplier: 0.8).isActive = true
        
        confirmPasswordStackView.constraintOutsideTo(.top, passwordStackView, 10)
        confirmPasswordStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        confirmPasswordStackView.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.88)
        confirmPasswordStackView.constraintInsideTo(.height, view.safeAreaLayoutGuide, multiplier: 0.073)
        
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.top, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.leading, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.trailing, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintTo(.bottom, confirmPasswordStackView, 1)
        
        confirmPasswordTextFieldClass.textField.widthAnchor.constraint(equalTo: confirmPasswordStackView.widthAnchor, multiplier: 0.8).isActive = true
        
        leftStackView.constraintOutsideTo(.top, confirmPasswordStackView, 10)
        leftStackView.constraintInsideTo(.leading, confirmPasswordStackView)
        leftStackView.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.3)
        leftStackView.constraintInsideTo(.height, view.safeAreaLayoutGuide, multiplier: 0.05)
        
        rightStackView.constraintOutsideTo(.top, confirmPasswordStackView, 10)
        rightStackView.constraintInsideTo(.trailing, confirmPasswordStackView)
        rightStackView.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.25)
        rightStackView.constraintInsideTo(.height, view.safeAreaLayoutGuide, multiplier: 0.05)
        
    }
}

extension RecuperacaoDeSenha3: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextFieldClass.textField {
            textField.resignFirstResponder()
            confirmPasswordTextFieldClass.textField.isHidden = false
            confirmPasswordTextFieldClass.label.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
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
