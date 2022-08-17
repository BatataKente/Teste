//
//  ViewController.swift
//  BRAVE - TelaRecuperacaodeSenha3
//
//  Created by user208023 on 7/18/22.
//

import UIKit

class PasswordRecoveryPassword: UIViewController {
    
    var passwordEyeSlash = false
    var confirmPasswordEyeSlash = false
    var containsUppercased = false
    var containsLowercased = false
    var textInsideRange = false
    var containsSpecialCharacters = false
    var containsNumericCharacters = false
    var invalidCharacters = true
    
    private let way = UIImageView()
    
    private let bravveIcon = UIImageView()
    
    private let backButton = UIButton()
    
    let registerButton = UIButton()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons([IconsBravve.emailGray.rawValue,
                                                IconsBravve.padlockBlue.rawValue])
        buttons[1].setTitle("  Recuperação de senha", for: .normal)
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = CGFloat(7).generateSizeForScreen
        
        return (stack: stackView,
                buttons: buttons)
    }()
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite e confirme sua nova senha!"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let passwordTextFieldClass = TextField(placeHolderText: "Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    private lazy var passwordStackView = passwordTextFieldClass.createStackView()
    
    let confirmPasswordTextFieldClass = TextField(placeHolderText: "Repita a Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    private lazy var confirmPasswordStackView = confirmPasswordTextFieldClass.createStackView()
    
    let passwordBulletPoint = BulletPoint(labelText: "No mínimo 6 caracteres")
    private lazy var passswordCharactersStackView = passwordBulletPoint.createBulletPointStackView()
    
    let capitalizedLetterBulletPoint = BulletPoint(labelText: "1 letra maiúscula")
    private lazy var capitalizedLetterStackView = capitalizedLetterBulletPoint.createBulletPointStackView()
    
    let regularCharactersBulletPoint = BulletPoint(labelText: "1 letra minúscula")
    private lazy var regularCharactersStackView = regularCharactersBulletPoint.createBulletPointStackView()
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passswordCharactersStackView, capitalizedLetterStackView, regularCharactersStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let numericCharactersBulletPoint = BulletPoint(labelText: "1 dígito numérico")
    private lazy var numericCharactersStackView = numericCharactersBulletPoint.createBulletPointStackView()
    
    let specialCharactersBulletPoint = BulletPoint(labelText: "1 caractere especial")
    private lazy var specialCharactersStackView = specialCharactersBulletPoint.createBulletPointStackView()
    
    let samePasswordBulletPoint = BulletPoint(labelText: "Senhas coincidem")
    private lazy var samePasswordStackView = samePasswordBulletPoint.createBulletPointStackView()
    
    private lazy var rightStackView: UIStackView = {
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
    
    
    /// Set the default layout of the top elements and the bottom button of the view
    private func setupDefaults() {
        way.setWayToDefault(.wayPassword)
        backButton.setToBackButtonDefault(.backPink) {_ in
            
            self.dismiss(animated: true)
        }
        bravveIcon.setLogoToDefault()
        registerButton.setToBottomButtonKeyboardDefault("Continuar")
    }
    
    
    /// Set the constraints of the view
    private func setupConstraints() {
        
        progressBarStackView.stack.constraintOutsideTo(.top, bravveIcon, CGFloat(40).generateSizeForScreen)
        progressBarStackView.stack.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.stack.heightAnchorInSuperview()
        
        sectionLabel.constraintOutsideTo(.top, progressBarStackView.stack, CGFloat(40).generateSizeForScreen)
        sectionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        sectionLabel.constraintInsideTo(.width, view.safeAreaLayoutGuide, CGFloat(331).generateSizeForScreen)
        
        passwordStackView.constraintOutsideTo(.top, sectionLabel, CGFloat(10).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        passwordStackView.widthAnchorInSuperview(CGFloat(331).generateSizeForScreen)
        passwordStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        passwordTextFieldClass.shadow.constraintInsideTo(.top, passwordStackView)
        passwordTextFieldClass.shadow.constraintInsideTo(.leading, passwordStackView)
        passwordTextFieldClass.shadow.constraintInsideTo(.trailing, passwordStackView)
        passwordTextFieldClass.shadow.constraintTo(.bottom, passwordStackView, CGFloat(1).generateSizeForScreen)
        
        passwordTextFieldClass.textField.widthAnchor.constraint(equalTo: passwordStackView.widthAnchor, multiplier: 0.8).isActive = true

        confirmPasswordStackView.constraintOutsideTo(.top, passwordStackView, CGFloat(10).generateSizeForScreen)
        confirmPasswordStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        confirmPasswordStackView.widthAnchorInSuperview(CGFloat(331).generateSizeForScreen)
        confirmPasswordStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.top, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.leading, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintInsideTo(.trailing, confirmPasswordStackView)
        confirmPasswordTextFieldClass.shadow.constraintTo(.bottom, confirmPasswordStackView, CGFloat(1).generateSizeForScreen)

        confirmPasswordTextFieldClass.textField.widthAnchor.constraint(equalTo: confirmPasswordStackView.widthAnchor, multiplier: 0.8).isActive = true

        leftStackView.constraintOutsideTo(.top, confirmPasswordStackView, CGFloat(10).generateSizeForScreen)
        leftStackView.constraintInsideTo(.leading, confirmPasswordStackView)
        leftStackView.widthAnchorInSuperview(CGFloat(150).generateSizeForScreen)
        leftStackView.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)

        rightStackView.constraintOutsideTo(.top, confirmPasswordStackView, CGFloat(10).generateSizeForScreen)
        rightStackView.constraintInsideTo(.trailing, confirmPasswordStackView)
        rightStackView.widthAnchorInSuperview(CGFloat(100).generateSizeForScreen)
        rightStackView.heightAnchorInSuperview(CGFloat(40).generateSizeForScreen)
        
    }
}


