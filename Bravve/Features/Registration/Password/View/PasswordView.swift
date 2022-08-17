//
//  SenhaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PasswordView: UIViewController{
    
    init(_ userToRegister: UserParameters = UserParameters(name: "",
                                                           phone_number: "",
                                                           email: "",
                                                           password: "")) {
        
        self.userToRegister = userToRegister
        print(userToRegister)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    var userToRegister: UserParameters
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    let backWay: UIImageView = {
        
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        return image
    }()
    
    lazy var progressBarButtons: [UIButton] = {
        
        let buttons = createProgressBarButtons([IconsBravve.userGray.rawValue,
                                                IconsBravve.cellGray.rawValue,
                                                IconsBravve.emailGray.rawValue,
                                                IconsBravve.padlockBlue.rawValue,
                                                IconsBravve.pencilGray.rawValue])
        buttons[3].setTitle(" Senha", for: .normal)
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
        textField.isSecureTextEntry = true
        textField.isHidden = true
        return textField
    }()
    
    let stackMargins: CGFloat = 12
    
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordTFLabel, passwordTextField])
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
    
    let hidePasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        return button
    }()
    
    let hideWrongPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        button.isHidden = true
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
        textField.isHidden = true
        textField.isSecureTextEntry = true
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
    
    let hideWrongConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
        button.isHidden = true
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
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.isHidden = true
        return view
    }()
    
    let backViewConfirm: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.addSubviews([backWay, descriptionLabel, backView,passwordStackView, hidePasswordButton, backViewConfirm ,confirmStackView, hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberLabel, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton, hideWrongPasswordButton, hideWrongConfirmPasswordButton])
        
        view.createRegisterCustomBar(progressBarButtons: progressBarButtons) {_ in
            let emailView = EmailView()
            emailView.modalPresentationStyle = .fullScreen
            self.present(emailView, animated: true)
        }
        
        continueButton.setToBottomButtonKeyboardDefault()
        
        addConstraints()
        addTargets()
        
        hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hideConfirmPassword), for: .touchUpInside)
        
        hideWrongPasswordButton.addTarget(self, action: #selector(hideWrongPassword), for: .touchUpInside)
        hideWrongConfirmPasswordButton.addTarget(self, action: #selector(hideWrongConfirmPassword), for: .touchUpInside)
    }
    
    func addConstraints(){
        
        descriptionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.top, view, CGFloat(250).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.right, view.safeAreaLayoutGuide)
        
        backView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        backView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        backView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        backView.constraintOutsideTo(.top, descriptionLabel, CGFloat(31).generateSizeForScreen)
        
        passwordStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        passwordStackView.constraintOutsideTo(.top, descriptionLabel, CGFloat(30).generateSizeForScreen)
        
        hidePasswordButton.constraintInsideTo(.height, passwordStackView)
        hidePasswordButton.widthAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        hidePasswordButton.constraintInsideTo(.centerY, passwordStackView)
        hidePasswordButton.constraintInsideTo(.trailing, passwordStackView)
        
        backViewConfirm.constraintInsideTo(.height, passwordStackView)
        backViewConfirm.constraintInsideTo(.leading, passwordStackView)
        backViewConfirm.constraintInsideTo(.trailing, passwordStackView)
        backViewConfirm.constraintOutsideTo(.top, passwordStackView, CGFloat(11.4).generateSizeForScreen)
        
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
        
        upperCaseLabel.constraintInsideTo(.height, numberCharLabel)
        upperCaseLabel.constraintInsideTo(.centerY, upperCaseEllipse)
        upperCaseLabel.constraintInsideTo(.leading, numberCharLabel)
        
        lowerCaseEllipse.constraintInsideTo(.height, numberCharEllipse)
        lowerCaseEllipse.constraintOutsideTo(.width, lowerCaseEllipse)
        lowerCaseEllipse.constraintOutsideTo(.top, upperCaseEllipse, CGFloat(10).generateSizeForScreen)
        lowerCaseEllipse.constraintInsideTo(.leading, upperCaseEllipse)
        
        lowerCaseLabel.constraintInsideTo(.height, numberCharLabel)
        lowerCaseLabel.constraintInsideTo(.centerY, lowerCaseEllipse)
        lowerCaseLabel.constraintInsideTo(.leading, numberCharLabel)
        
        numberEllipse.constraintInsideTo(.height, numberCharEllipse)
        numberEllipse.constraintOutsideTo(.width, numberEllipse)
        numberEllipse.constraintInsideTo(.top, numberCharEllipse)
        numberEllipse.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(120).generateSizeForScreen)
        
        numberLabel.constraintInsideTo(.height, numberCharLabel)
        numberLabel.constraintInsideTo(.centerY, numberEllipse)
        numberLabel.constraintOutsideTo(.leading, numberEllipse, CGFloat(5).generateSizeForScreen)
        
        specialCharEllipse.constraintInsideTo(.height, numberCharEllipse)
        specialCharEllipse.constraintOutsideTo(.width, specialCharEllipse)
        specialCharEllipse.constraintOutsideTo(.top, numberEllipse, CGFloat(10).generateSizeForScreen)
        specialCharEllipse.constraintInsideTo(.leading, numberEllipse)
        
        specialCharLabel.constraintInsideTo(.height, numberCharLabel)
        specialCharLabel.constraintInsideTo(.centerY, specialCharEllipse)
        specialCharLabel.constraintInsideTo(.leading, numberLabel)
        
        samePasswordEllipse.constraintInsideTo(.height, numberCharEllipse)
        samePasswordEllipse.constraintOutsideTo(.width, samePasswordEllipse)
        samePasswordEllipse.constraintOutsideTo(.top, specialCharEllipse, CGFloat(10).generateSizeForScreen)
        samePasswordEllipse.constraintInsideTo(.leading, specialCharEllipse)
        
        samePasswordLabel.constraintInsideTo(.height, numberCharLabel)
        samePasswordLabel.constraintInsideTo(.centerY, samePasswordEllipse)
        samePasswordLabel.constraintInsideTo(.leading, numberLabel)
        
        hideWrongPasswordButton.constraintInsideTo(.height, passwordStackView)
        hideWrongPasswordButton.widthAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        hideWrongPasswordButton.constraintInsideTo(.centerY, passwordStackView)
        hideWrongPasswordButton.constraintInsideTo(.trailing, passwordStackView)
        
        hideWrongConfirmPasswordButton.constraintInsideTo(.height, hideWrongPasswordButton)
        hideWrongConfirmPasswordButton.constraintInsideTo(.width, hideWrongPasswordButton)
        hideWrongConfirmPasswordButton.constraintInsideTo(.centerY, confirmStackView)
        hideWrongConfirmPasswordButton.constraintInsideTo(.trailing, confirmStackView)

    }
    
    
}






