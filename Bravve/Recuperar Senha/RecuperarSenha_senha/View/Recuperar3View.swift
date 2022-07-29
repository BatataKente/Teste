//
//  Recuperar3View.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
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

class TextField: UIStackView {
    
    var labelText: String
    var label = UILabel()
    var buttonImageName: String
    var textField = UITextField()
    var textFieldButton = UIButton()
    
    init(placeHolderText labelText: String, buttonImageName: String = "", frame: CGRect = .zero) {
        
        self.labelText = labelText
        self.buttonImageName = buttonImageName
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStackView() -> UIStackView {
        
        label.text = self.labelText
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        
        
        if buttonImageName != "" {
            
            textFieldButton.setImage(UIImage(named: buttonImageName), for: .normal)
            textFieldButton.tintColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
            
            
            let textFieldStackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [label, textField])
                stackView.backgroundColor = .white
                stackView.axis = .vertical
                return stackView
            }()
            
            let stackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [textFieldStackView, textFieldButton])
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = 8
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                stackView.layer.borderWidth = 1
                stackView.layer.borderColor = UIColor(red: 0.816, green: 0.835, blue: 0.867, alpha: 1).cgColor
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .equalCentering
                return stackView
            }()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldStackViewTapped))
            stackView.addGestureRecognizer(tap)
            
            return stackView
        } else {
            let stackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [label, textField])
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = 8
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                stackView.axis = .vertical
                stackView.layer.borderWidth = 1
                stackView.layer.borderColor = UIColor(red: 0.816, green: 0.835, blue: 0.867, alpha: 1).cgColor
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .equalCentering
                return stackView
            }()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldStackViewTapped))
            stackView.addGestureRecognizer(tap)
            return stackView
        }
        
        
    }
    
    @objc func textFieldStackViewTapped() {
        textField.isHidden = false
        label.font = (UIFont(name: "Ubuntu-Light", size: 11))
        textField.becomeFirstResponder()
    }
    
}

class BulletPoint: UIStackView {
    
    var labelText: String
    var label = UILabel()
    
    init(labelText: String, frame: CGRect = .zero) {
        self.labelText = labelText
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBulletPointStackView() -> UIStackView {
        
        let ellipseImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Elipse")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        label.text = labelText
        label.font = UIFont(name: "Ubuntu-Light", size: 10)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        let bulletPointStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [ellipseImage, label])
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        return bulletPointStackView
    }
}
