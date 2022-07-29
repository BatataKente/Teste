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
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "way2")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoBlue")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButtonPink"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emailGray"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor(red: 0.613, green: 0.642, blue: 0.671, alpha: 1)
        button.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let passwordRecoveryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "padloclBlue"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        button.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let passwordRecoveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Recuperação de Senha"
        label.font = UIFont(name: "Ubuntu-Medium", size: 14)
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailButton, passwordRecoveryButton, passwordRecoveryLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.contentMode = .scaleAspectFit
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite e confirme sua nova senha!"
        label.font = UIFont(name: "Ubuntu-Light", size: 16)
        label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextFieldClass = TextField(placeHolderText: "Senha", buttonImageName: "eyeClose")
    lazy var passwordStackView = passwordTextFieldClass.createStackView()
    
    
    let confirmPasswordTextFieldClass = TextField(placeHolderText: "Repita a Senha", buttonImageName: "eyeClose")
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
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.backgroundColor = UIColor(red: 0.435, green: 0.455, blue: 0.475, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        
        view.addSubviews([backgroundImageView, logoImageView, backButton, buttonStackView, sectionLabel, passwordStackView, confirmPasswordStackView, leftStackView, rightStackView, continueButton])
        
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                        
            backButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            logoImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.045),
            logoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            buttonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            sectionLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 40),
            sectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sectionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            passwordStackView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 10),
            passwordStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            passwordStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.073),
            
            passwordTextFieldClass.textField.widthAnchor.constraint(equalTo: passwordStackView.widthAnchor, multiplier: 0.8),
            
            confirmPasswordStackView.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 10),
            confirmPasswordStackView.centerXAnchor.constraint(equalTo: passwordStackView.centerXAnchor),
            confirmPasswordStackView.widthAnchor.constraint(equalTo: passwordStackView.widthAnchor),
            confirmPasswordStackView.heightAnchor.constraint(equalTo: passwordStackView.heightAnchor),
            
            confirmPasswordTextFieldClass.textField.widthAnchor.constraint(equalTo: confirmPasswordStackView.widthAnchor, multiplier: 0.8),
            
            leftStackView.topAnchor.constraint(equalTo: confirmPasswordStackView.bottomAnchor, constant: 10),
            leftStackView.leadingAnchor.constraint(equalTo: confirmPasswordStackView.leadingAnchor),
            leftStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            leftStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            
            rightStackView.topAnchor.constraint(equalTo: leftStackView.topAnchor),
            rightStackView.trailingAnchor.constraint(equalTo: confirmPasswordStackView.trailingAnchor),
            rightStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
            rightStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            continueButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.062),
            
        ])
        passwordTextFieldClass.textField.delegate = self
        passwordTextFieldClass.textFieldButton.addTarget(self, action: #selector(passwordEyeSlashButtonTapped), for: .touchUpInside)
        confirmPasswordTextFieldClass.textFieldButton.addTarget(self, action: #selector(confirmPasswordEyeSlashButtonTapped), for: .touchUpInside)
        
        passwordTextFieldClass.textField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextFieldClass.textField.addTarget(self, action: #selector(confirmPasswordTextFieldDidChange(_:)), for: .editingChanged)
    }
}

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
