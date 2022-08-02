//
//  Recuperar3View.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
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
    
    let way = UIImageView()
    
    private let bravveIcon = UIImageView()
    
    private let backButton = UIButton()
    
    let registerButton = UIButton()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons(["emailGray",
                                                "padlockBlue"])
        buttons[1].configuration?.title = " Recuperar Senha"
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 7
        
        return (stack: stackView,
                buttons: buttons)
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite e confirme sua nova senha!"
        label.font = UIFont(name: "Ubuntu-Light", size: 16)
        label.textColor = UIColor(named: "label")
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

class TextField: UIStackView {
    
    var labelText: String
    var label = UILabel()
    var buttonImageName: String
    var textField = UITextField()
    var textFieldButton = UIButton()
    var shadow = UIView()
    
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
        label.textColor = UIColor(named: "labelTextField")
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        shadow.backgroundColor = .blue
        shadow.layer.cornerRadius = 8
        shadow.isHidden = true
        
        
        
        if buttonImageName != "" {
            
            textFieldButton.setImage(UIImage(named: buttonImageName), for: .normal)
            textFieldButton.tintColor = UIColor(named: "blueNav")
            
            
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
                stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
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
                stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
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
        shadow.isHidden = false
        label.font = (UIFont(name: "Ubuntu-Light", size: 11))
        textField.becomeFirstResponder()
    }
    
}

class BulletPoint: UIStackView {
    
    var labelText: String
    var label = UILabel()
    var ellipseImage = UIImageView()
    
    init(labelText: String, frame: CGRect = .zero) {
        self.labelText = labelText
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBulletPointStackView() -> UIStackView {
        
        ellipseImage.image = UIImage(named: "Ellipse gray")
        ellipseImage.contentMode = .scaleAspectFit
        ellipseImage.translatesAutoresizingMaskIntoConstraints = false
        
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
