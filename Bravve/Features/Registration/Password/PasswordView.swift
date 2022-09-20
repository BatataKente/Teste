//
//  SenhaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PasswordView: UIViewController{
    
    var userToRegister: UserParameters
    
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        print(userToRegister)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    //MARK: - progressBarButtonsAndHandlers
    lazy var progressBarButtons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockBlue.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        let tripleDismissHandler = {(action: UIAction) in
            if let emailView = self.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController{
                
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.dismiss(animated: false)
            }
        }
        
        let doubleDismissHandler = {(action: UIAction) in
            
            if let phoneView = self.presentingViewController,
               let nomeView = phoneView.presentingViewController {
                
                phoneView.view.isHidden = true
                nomeView.dismiss(animated: false)
            }
        }
        
        let dismissHandler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: tripleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[2].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
        return buttons
    }()
    //MARK: - Elements
    
    
    
    
    //MARK: - passwordTextField
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        textField.isSecureTextEntry = true
        textField.isHidden = true
        return textField
    }()
    
    let stackMargins: CGFloat = 12
    
    //MARK: passwordStackView
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordTFLabel, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
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
    //MARK: Buttons
    let hidePasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        return button
    }()
    
    let hideWrongPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        button.isHidden = true
        return button
    }()
    
    
    //MARK: - confirmPasswordTextField
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        textField.isHidden = true
        textField.isSecureTextEntry = true
        return textField
    }()
    //MARK: confirmStackView
    lazy var confirmStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [confirmPasswordTFLabel, confirmPasswordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
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
    //MARK: - hideConfirmsPasswordButtons
    let hideConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        return button
    }()
    
    let hideWrongConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        button.isHidden = true
        return button
    }()
    //MARK: UIImageViews
    let backWay: UIImageView = {
        
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        return image
    }()
    
    let numberCharEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let upperCaseEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let lowerCaseEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let numberEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let specialCharEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    
    let samePasswordEllipse: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.ellipseGray.rawValue)
        return image
    }()
    //MARK: UILabels
    let confirmPasswordTFLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repetir senha"
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Agora escolha uma senha de sua preferência."
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textAlignment = .center
        return label
    }()
    
    let passwordTFLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let numberCharLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No mínimo 6 caracteres"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let upperCaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 letra maiúscula"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let lowerCaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 letra minúscula"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 digito numérico"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
     
    let specialCharLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 caractere especial"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let samePasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senhas coincidem"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        return label
    }()
    
    let continueButton = UIButton()
    
    //MARK: UIViews
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.blue_cyan.rawValue)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.isHidden = true
        return view
    }()
    
    let backViewConfirm: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.blue_cyan.rawValue)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.isHidden = true
        return view
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.addSubviews([backWay, descriptionLabel, backView,passwordStackView, hidePasswordButton, backViewConfirm ,confirmStackView, hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberLabel, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton, hideWrongPasswordButton, hideWrongConfirmPasswordButton])
        
        view.createRegisterCustomBar(progressBarButtons: progressBarButtons) {_ in
            
            if let emailView = self.presentingViewController ,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController,
               let loginView = nomeView.presentingViewController {
                
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.view.isHidden = true
                loginView.dismiss(animated: true)
            }
        }
        
        continueButton.setToBottomButtonKeyboardDefault()
        
        addConstraints()
        addTargets()
        
        hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hideConfirmPassword), for: .touchUpInside)
        
        hideWrongPasswordButton.addTarget(self, action: #selector(hideWrongPassword), for: .touchUpInside)
        hideWrongConfirmPasswordButton.addTarget(self, action: #selector(hideWrongConfirmPassword), for: .touchUpInside)
        
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Constraints
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(250).generateSizeForScreen),
            descriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            backView.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(20).generateSizeForScreen),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            backView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat(31).generateSizeForScreen),

            passwordStackView.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen),
            passwordStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            passwordStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat(30).generateSizeForScreen),

            hidePasswordButton.heightAnchor.constraint(equalTo: passwordStackView.heightAnchor),
            hidePasswordButton.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            hidePasswordButton.centerYAnchor.constraint(equalTo: passwordStackView.centerYAnchor),
            hidePasswordButton.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),

            backViewConfirm.heightAnchor.constraint(equalTo: passwordStackView.heightAnchor),
            backViewConfirm.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            backViewConfirm.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            backViewConfirm.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: CGFloat(11.4).generateSizeForScreen),

            confirmStackView.heightAnchor.constraint(equalTo: passwordStackView.heightAnchor),
            confirmStackView.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor),
            confirmStackView.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),
            confirmStackView.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),

            hideConfirmPasswordButton.heightAnchor.constraint(equalTo: hidePasswordButton.heightAnchor),
            hideConfirmPasswordButton.widthAnchor.constraint(equalTo: hidePasswordButton.widthAnchor),
            hideConfirmPasswordButton.centerYAnchor.constraint(equalTo: confirmStackView.centerYAnchor),
            hideConfirmPasswordButton.trailingAnchor.constraint(equalTo: confirmStackView.trailingAnchor),

            numberCharEllipse.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen),
            numberCharEllipse.widthAnchor.constraint(equalTo: numberCharEllipse.widthAnchor),
            numberCharEllipse.topAnchor.constraint(equalTo: confirmStackView.bottomAnchor, constant: CGFloat(11).generateSizeForScreen),
            numberCharEllipse.leadingAnchor.constraint(equalTo: confirmStackView.leadingAnchor),

            numberCharLabel.heightAnchor.constraint(equalToConstant: CGFloat(11).generateSizeForScreen),
            numberCharLabel.centerYAnchor.constraint(equalTo: numberCharEllipse.centerYAnchor),
            numberCharLabel.leadingAnchor.constraint(equalTo: numberCharEllipse.trailingAnchor, constant: CGFloat(5).generateSizeForScreen),

            upperCaseEllipse.heightAnchor.constraint(equalTo: numberCharEllipse.heightAnchor),
            upperCaseEllipse.widthAnchor.constraint(equalTo: upperCaseEllipse.widthAnchor),
            upperCaseEllipse.topAnchor.constraint(equalTo: numberCharEllipse.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            upperCaseEllipse.leadingAnchor.constraint(equalTo: numberCharEllipse.leadingAnchor),

            upperCaseLabel.heightAnchor.constraint(equalTo: numberCharLabel.heightAnchor),
            upperCaseLabel.centerYAnchor.constraint(equalTo: upperCaseEllipse.centerYAnchor),
            upperCaseLabel.leadingAnchor.constraint(equalTo: numberCharLabel.leadingAnchor),

            lowerCaseEllipse.heightAnchor.constraint(equalTo: numberCharEllipse.heightAnchor),
            lowerCaseEllipse.widthAnchor.constraint(equalTo: lowerCaseEllipse.widthAnchor),
            lowerCaseEllipse.topAnchor.constraint(equalTo: upperCaseEllipse.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            lowerCaseEllipse.leadingAnchor.constraint(equalTo: upperCaseEllipse.leadingAnchor),

            lowerCaseLabel.heightAnchor.constraint(equalTo: numberCharLabel.heightAnchor),
            lowerCaseLabel.centerYAnchor.constraint(equalTo: lowerCaseEllipse.centerYAnchor),
            lowerCaseLabel.leadingAnchor.constraint(equalTo: numberCharLabel.leadingAnchor),

            numberEllipse.heightAnchor.constraint(equalTo: numberCharEllipse.heightAnchor),
            numberEllipse.widthAnchor.constraint(equalTo: numberEllipse.widthAnchor),
            numberEllipse.topAnchor.constraint(equalTo: numberCharEllipse.topAnchor),
            numberEllipse.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-120).generateSizeForScreen),

            numberLabel.heightAnchor.constraint(equalTo: numberCharLabel.heightAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: numberEllipse.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: numberEllipse.trailingAnchor, constant: CGFloat(5).generateSizeForScreen),

            specialCharEllipse.heightAnchor.constraint(equalTo: numberCharEllipse.heightAnchor),
            specialCharEllipse.widthAnchor.constraint(equalTo: specialCharEllipse.widthAnchor),
            specialCharEllipse.topAnchor.constraint(equalTo: numberEllipse.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            specialCharEllipse.leadingAnchor.constraint(equalTo: numberEllipse.leadingAnchor),

            specialCharLabel.heightAnchor.constraint(equalTo: numberCharLabel.heightAnchor),
            specialCharLabel.centerYAnchor.constraint(equalTo: specialCharEllipse.centerYAnchor),
            specialCharLabel.leadingAnchor.constraint(equalTo: numberLabel.leadingAnchor),

            samePasswordEllipse.heightAnchor.constraint(equalTo: numberCharEllipse.heightAnchor),
            samePasswordEllipse.widthAnchor.constraint(equalTo: samePasswordEllipse.widthAnchor),
            samePasswordEllipse.topAnchor.constraint(equalTo: specialCharEllipse.bottomAnchor, constant: CGFloat(10).generateSizeForScreen),
            samePasswordEllipse.leadingAnchor.constraint(equalTo: specialCharEllipse.leadingAnchor),

            samePasswordLabel.heightAnchor.constraint(equalTo: numberCharLabel.heightAnchor),
            samePasswordLabel.centerYAnchor.constraint(equalTo: samePasswordEllipse.centerYAnchor),
            samePasswordLabel.leadingAnchor.constraint(equalTo: numberLabel.leadingAnchor),

            hideWrongPasswordButton.heightAnchor.constraint(equalTo: passwordStackView.heightAnchor),
            hideWrongPasswordButton.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            hideWrongPasswordButton.centerYAnchor.constraint(equalTo: passwordStackView.centerYAnchor),
            hideWrongPasswordButton.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor),

            hideWrongConfirmPasswordButton.heightAnchor.constraint(equalTo: hideWrongPasswordButton.heightAnchor),
            hideWrongConfirmPasswordButton.widthAnchor.constraint(equalTo: hideWrongPasswordButton.widthAnchor),
            hideWrongConfirmPasswordButton.centerYAnchor.constraint(equalTo: confirmStackView.centerYAnchor),
            hideWrongConfirmPasswordButton.trailingAnchor.constraint(equalTo: confirmStackView.trailingAnchor),
        ])
    }
    
    
}






