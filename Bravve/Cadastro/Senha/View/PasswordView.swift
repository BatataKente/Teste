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
        image.setWayToDefault("wayPassword")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let goBackButton: UIButton = {
        let button = UIButton()
        button.setToBackButtonDefault("backPink", 32.76)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.setLogoToDefault("logoBlue")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var progressBarButtons: [UIButton] = {
        var buttons = [UIButton()]
        buttons = createProgressBarButtons(["userGray", "cellGray", "emailGray", "padlockBlue", "hobbiesGray"])
        return buttons
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressBarButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agora escolha uma senha de sua preferência."
        label.font = UIFont(name: "Ubuntu-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let confirmPasswordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Repita a senha"
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let numberCharEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let numberCharLabel: UILabel = {
        let label = UILabel()
        label.text = "No mínimo 6 caracteres"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let upperCaseEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let upperCaseLabel: UILabel = {
        let label = UILabel()
        label.text = "1 letra maiúscula"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lowerCaseEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let lowerCaseLabel: UILabel = {
        let label = UILabel()
        label.text = "1 letra minúscula"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1 digito numérico"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let specialCharEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let specialCharLabel: UILabel = {
        let label = UILabel()
        label.text = "1 caractere especial"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let samePasswordEllipse: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Ellipse gray")
        return image
    }()
    
    let samePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senhas coincidem"
        label.font = UIFont(name: "Ubuntu-Regular", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setToBottomButtonDefault("Continuar", colorName: "buttonGray", aboveWhom: UIKeyboardLayoutGuide.self)
        return button
    }()
    
    let passwordCustomShadow: UIView = {
        let customShadow = UIView()
        customShadow.backgroundColor = UIColor(named: "blueNav")
        customShadow.layer.cornerRadius = 8
        customShadow.isHidden = true
        return customShadow
    }()
    
    let confirmCustomShadow: UIView = {
        let customShadow = UIView()
        customShadow.backgroundColor = UIColor(named: "blueNav")
        customShadow.layer.cornerRadius = 8
        customShadow.isHidden = true
        return customShadow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([backWay, goBackButton, logoImage, stackView, descriptionLabel,passwordStackView, hidePasswordButton, confirmStackView ,hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberEllipse, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton, passwordCustomShadow, confirmCustomShadow])
        
        hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hideConfirmPassword), for: .touchUpInside)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
    }
    
    func addConstraints(){
        goBackButton.constraintTo(.left, view.safeAreaLayoutGuide, 32.76)
        goBackButton.constraintTo(.top, view.safeAreaLayoutGuide, 76)
        goBackButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        goBackButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        logoImage.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        logoImage.constraintInsideTo(.top, view.safeAreaLayoutGuide, 65)
        logoImage.heightAnchor.constraint(equalToConstant: 43).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 163.22).isActive = true
        
        stackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.top, logoImage, 40)
        
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
        
        passwordCustomShadow.constraintOutsideTo(.top, passwordStackView)
        passwordCustomShadow.constraintInsideTo(.left, passwordStackView)
        passwordCustomShadow.constraintInsideTo(.right, passwordStackView)
        passwordCustomShadow.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        confirmCustomShadow.constraintOutsideTo(.top, confirmStackView)
        confirmCustomShadow.constraintInsideTo(.left, confirmStackView)
        confirmCustomShadow.constraintInsideTo(.right, confirmStackView)
        confirmCustomShadow.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    @objc func goBack(sender: UIButton){
            print("Going Back")
        }
    
    @objc func continueAction() {
            print("Going On")
        }
    
    @objc func hidingConfirmPassword(_ sender: UIButton){
        confirmPasswordTextField.isSecureTextEntry.toggle()
        
        if confirmPasswordTextField.isSecureTextEntry {
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
    }
    
    @objc func hidingPassword(_ sender: UIButton){
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            hidePasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
        } else {
            hidePasswordButton.setImage(UIImage(named: "eyeOpen"), for: .normal)
        }
        
    }

}


