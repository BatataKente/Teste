//
//  Recuperar3View.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PasswordRecoveryPassword: UIViewController {
    
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    //MARK: - var and let
    var passwordEyeSlash = false
    var confirmPasswordEyeSlash = false
    var containsUppercased = false
    var containsLowercased = false
    var textInsideRange = false
    var containsSpecialCharacters = false
    var containsNumericCharacters = false
    var invalidCharacters = true
    var email: String?
    
    private let way = UIImageView()
    
    let registerButton = UIButton()
    
    
    //MARK: - buttons
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtonsWithoutActions([
            IconsBravve.emailGray.rawValue,
            IconsBravve.padlockBlue.rawValue
        ])
        buttons[1].setTitle("Recuperação de senha", for: .normal)
        
        let handler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return buttons
    }()
    
    
    //MARK: - sectionLabel
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite e confirme sua nova senha!"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - leftStackView
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passswordCharactersStackView, capitalizedLetterStackView, regularCharactersStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - rightStackView
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numericCharactersStackView, specialCharactersStackView, samePasswordStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - textFieldsClass
    let passwordTextFieldClass = CustomTextField(placeHolderText: "Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    private lazy var passwordStackView = passwordTextFieldClass.createStackView()
    
    let confirmPasswordTextFieldClass = CustomTextField(placeHolderText: "Repita a Senha", buttonImageName: ButtonsBravve.eyeClose.rawValue)
    private lazy var confirmPasswordStackView = confirmPasswordTextFieldClass.createStackView()
    
    let passwordBulletPoint = CustomBulletPoint(labelText: "No mínimo 6 caracteres")
    private lazy var passswordCharactersStackView = passwordBulletPoint.createBulletPointStackView()
    
    let capitalizedLetterBulletPoint = CustomBulletPoint(labelText: "1 letra maiúscula")
    private lazy var capitalizedLetterStackView = capitalizedLetterBulletPoint.createBulletPointStackView()
    
    let regularCharactersBulletPoint = CustomBulletPoint(labelText: "1 letra minúscula")
    private lazy var regularCharactersStackView = regularCharactersBulletPoint.createBulletPointStackView()
    

    let numericCharactersBulletPoint = CustomBulletPoint(labelText: "1 dígito numérico")
    private lazy var numericCharactersStackView = numericCharactersBulletPoint.createBulletPointStackView()
    
    let specialCharactersBulletPoint = CustomBulletPoint(labelText: "1 caractere especial")
    private lazy var specialCharactersStackView = specialCharactersBulletPoint.createBulletPointStackView()
    
    let samePasswordBulletPoint = CustomBulletPoint(labelText: "Senhas coincidem")
    private lazy var samePasswordStackView = samePasswordBulletPoint.createBulletPointStackView()
    
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([way,
                          sectionLabel,
                          passwordTextFieldClass.shadow,
                          passwordStackView,
                          confirmPasswordTextFieldClass.shadow,
                          confirmPasswordStackView,
                          leftStackView,
                          rightStackView,
                          registerButton])
        
        setupDefaults()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        
        
        passwordTextFieldClass.textField.delegate = self
        passwordTextFieldClass.textFieldButton.addTarget(self, action: #selector(passwordEyeSlashButtonTapped), for: .touchUpInside)
        confirmPasswordTextFieldClass.textFieldButton.addTarget(self, action: #selector(confirmPasswordEyeSlashButtonTapped), for: .touchUpInside)
        
        passwordTextFieldClass.textField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextFieldClass.textField.addTarget(self, action: #selector(confirmPasswordTextFieldDidChange(_:)), for: .editingChanged)
        
        registerButton.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
    }
    
    /// Set the default layout of the top elements and the bottom button of the view
    private func setupDefaults() {
        way.setWayToDefault(.wayPassword)

        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            if let passwordEmail = self.presentingViewController,
               let loginView = passwordEmail.presentingViewController {
                
                passwordEmail.view.isHidden = true
                loginView.dismiss(animated: true)
            }
        }
        registerButton.setToBottomButtonKeyboardDefault("Continuar")
    }
    

    
    //MARK: - setupConstraints
    private func setupConstraints() {
        
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldClass.shadow.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordStackView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextFieldClass.shadow.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            sectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 221),
            sectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            sectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            passwordStackView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 15),
            passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            passwordStackView.heightAnchor.constraint(equalToConstant: 60),
        
            passwordTextFieldClass.shadow.topAnchor.constraint(equalTo: passwordStackView.topAnchor),
            passwordTextFieldClass.shadow.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            passwordTextFieldClass.shadow.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            passwordTextFieldClass.shadow.bottomAnchor.constraint(equalTo: passwordStackView.bottomAnchor),
            
            passwordTextFieldClass.textField.widthAnchor.constraint(equalTo: passwordStackView.widthAnchor, multiplier: 0.8),
            
            
            confirmPasswordStackView.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 10),
            confirmPasswordStackView.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            confirmPasswordStackView.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            confirmPasswordStackView.heightAnchor.constraint(equalToConstant: 60),
            
            
            confirmPasswordTextFieldClass.shadow.topAnchor.constraint(equalTo: confirmPasswordStackView.topAnchor),
            confirmPasswordTextFieldClass.shadow.leadingAnchor.constraint(equalTo: confirmPasswordStackView.leadingAnchor),
            confirmPasswordTextFieldClass.shadow.trailingAnchor.constraint(equalTo: confirmPasswordStackView.trailingAnchor),
            confirmPasswordTextFieldClass.shadow.bottomAnchor.constraint(equalTo: confirmPasswordStackView.bottomAnchor),
            
            
            confirmPasswordTextFieldClass.textField.widthAnchor.constraint(equalTo: confirmPasswordStackView.widthAnchor, multiplier: 0.8),
            
            
            leftStackView.topAnchor.constraint(equalTo: confirmPasswordStackView.bottomAnchor, constant: 10),
            leftStackView.leadingAnchor.constraint(equalTo: confirmPasswordStackView.leadingAnchor),
            leftStackView.heightAnchor.constraint(equalToConstant: 40),
            
            rightStackView.topAnchor.constraint(equalTo: confirmPasswordStackView.bottomAnchor, constant: 10),
            rightStackView.trailingAnchor.constraint(equalTo: confirmPasswordStackView.trailingAnchor),
            rightStackView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        

        
    }
}
