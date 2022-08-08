//
//  RegisterPassword.swift
//  Teste
//
//  Created by Rayra Jovaneli on 8/4/22.
//

import UIKit

class progressBar: UIViewController{
    
    
    lazy var goBackButton: UIButton = {
        let button = UIButton()
        button.setToBackButtonDefault(.backPink, CGFloat(32.76).generateSizeForScreen) {_ in
            
            self.dismiss(animated: true)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wayPassword")
        return image
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.setLogoToDefault(.logoBlue)
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
        stackView.spacing = CGFloat(8).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agora escolha uma senha de sua preferência."
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTFLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
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
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stackMargins: CGFloat = 12
    
    lazy var stackView_: UIStackView = {
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
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
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
        textField.isHidden = true
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
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
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setToBottomButtonKeyboardDefault("Continuar", backgroundColor: .buttonGray)
        return button
    }()
    
    let customShaddow: UIView = {
        
        let customShaddow = UIView()
        customShaddow.backgroundColor = UIColor(named: "blueNav")
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()
    
    let customShaddow_: UIView = {
        
        let customShaddow = UIView()
        customShaddow.backgroundColor = UIColor(named: "blueNav")
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()
    
    let hideWrongPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let hideWrongConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeCloseRed"), for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews([goBackButton, backImage, logoImage, stackView, descriptionLabel, stackView_, hidePasswordButton, confirmStackView, hideConfirmPasswordButton, numberCharEllipse, numberCharLabel, upperCaseEllipse, upperCaseLabel, lowerCaseEllipse, lowerCaseLabel, numberEllipse, numberLabel, specialCharEllipse, specialCharLabel, samePasswordEllipse, samePasswordLabel, continueButton, customShaddow, customShaddow_, hideWrongPasswordButton, hideWrongConfirmPasswordButton])
        addConstraints()
        addTargets()
        
        hidePasswordButton.addTarget(self, action: #selector(hidingPassword), for: .touchUpInside)
        hideConfirmPasswordButton.addTarget(self, action: #selector(hidingConfirmPassword), for: .touchUpInside)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
    }
    
    func addConstraints(){
        
        goBackButton.constraintTo(.left, view.safeAreaLayoutGuide, CGFloat(32.76).generateSizeForScreen)
        goBackButton.constraintTo(.top, view.safeAreaLayoutGuide, CGFloat(73).generateSizeForScreen)
        goBackButton.widthAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen).isActive = true
        goBackButton.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen).isActive = true
        
        backImage.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        backImage.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        
        logoImage.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        logoImage.constraintInsideTo(.top, view.safeAreaLayoutGuide, CGFloat(65).generateSizeForScreen)
        logoImage.heightAnchor.constraint(equalToConstant: CGFloat(32).generateSizeForScreen).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: CGFloat(123).generateSizeForScreen).isActive = true
        
        stackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.top, logoImage, CGFloat(62).generateSizeForScreen)
        
        descriptionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        descriptionLabel.heightAnchor.constraint(equalToConstant: CGFloat(43).generateSizeForScreen).isActive = true
        descriptionLabel.constraintOutsideTo(.top, logoImage, CGFloat(119).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-22).generateSizeForScreen)
        
        stackView_.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView_.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        stackView_.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        stackView_.constraintOutsideTo(.top, descriptionLabel, 30)
        
        hidePasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hidePasswordButton.constraintInsideTo(.top, stackView_, 25)
        hidePasswordButton.constraintInsideTo(.right, stackView_, -15)
        
        confirmStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmStackView.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        confirmStackView.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        confirmStackView.constraintOutsideTo(.top, stackView_, 12)
        
        hideConfirmPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideConfirmPasswordButton.constraintInsideTo(.top, confirmStackView, 25)
        hideConfirmPasswordButton.constraintInsideTo(.right, confirmStackView, -15)
        
        numberCharEllipse.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        numberCharEllipse.widthAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        numberCharEllipse.constraintOutsideTo(.top, confirmStackView, CGFloat(15).generateSizeForScreen)
        numberCharEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        
        numberCharLabel.heightAnchor.constraint(equalToConstant: CGFloat(11).generateSizeForScreen).isActive = true
        numberCharLabel.constraintOutsideTo(.top, confirmStackView, CGFloat(10).generateSizeForScreen)
        numberCharLabel.constraintOutsideTo(.left, numberCharEllipse, CGFloat(10).generateSizeForScreen)
        
        upperCaseEllipse.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        upperCaseEllipse.widthAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        upperCaseEllipse.constraintOutsideTo(.top, numberCharEllipse, CGFloat(10).generateSizeForScreen)
        upperCaseEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        
        upperCaseLabel.heightAnchor.constraint(equalToConstant: CGFloat(11).generateSizeForScreen).isActive = true
        upperCaseLabel.constraintOutsideTo(.top, numberCharLabel, CGFloat(5).generateSizeForScreen)
        upperCaseLabel.constraintOutsideTo(.left, upperCaseEllipse, CGFloat(10).generateSizeForScreen)
        
        lowerCaseEllipse.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        lowerCaseEllipse.widthAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen).isActive = true
        lowerCaseEllipse.constraintOutsideTo(.top, upperCaseEllipse, CGFloat(10).generateSizeForScreen)
        lowerCaseEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        
        lowerCaseLabel.heightAnchor.constraint(equalToConstant: CGFloat(11).generateSizeForScreen).isActive = true
        lowerCaseLabel.constraintOutsideTo(.top, upperCaseLabel, CGFloat(5).generateSizeForScreen)
        lowerCaseLabel.constraintOutsideTo(.left, lowerCaseEllipse, CGFloat(10).generateSizeForScreen)
        
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
        
        customShaddow.constraintOutsideTo(.top, stackView_)
        customShaddow.constraintInsideTo(.left, stackView_)
        customShaddow.constraintInsideTo(.right, stackView_)
        customShaddow.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        customShaddow_.constraintOutsideTo(.top, confirmStackView)
        customShaddow_.constraintInsideTo(.left, confirmStackView)
        customShaddow_.constraintInsideTo(.right, confirmStackView)
        customShaddow_.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        hideWrongPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideWrongPasswordButton.constraintInsideTo(.top, stackView_, 25)
        hideWrongPasswordButton.constraintInsideTo(.right, stackView_, -15)
        
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
        stackView_.addGestureRecognizer(stackViewTap)
        
        let stackViewTap_ = UITapGestureRecognizer(target: self, action: #selector(confirmStackViewTapped))
        confirmStackView.addGestureRecognizer(stackViewTap_)
    }
    
    @objc func confirmStackViewTapped() {
        confirmPasswordTFLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        confirmPasswordTextField.addTarget(self, action: #selector(confirmChangeText), for: .editingChanged)
        customShaddow_.isHidden = false
        confirmPasswordTextField.isHidden = false
    }
    
    @objc func stackViewTapped() {
        passwordTFLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        passwordTextField.addTarget(self, action: #selector(changeText), for: .editingChanged)
        customShaddow.isHidden = false
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
            numberCharEllipse.image = UIImage(named: "Ellipse gray")
            upperCaseEllipse.image = UIImage(named: "Ellipse gray")
            lowerCaseEllipse.image = UIImage(named: "Ellipse gray")
            numberEllipse.image = UIImage(named: "Ellipse gray")
            specialCharEllipse.image = UIImage(named: "Ellipse gray")
        } else {
            if upperCaseTest.evaluate(with: passwordTextField.text!){
                upperCaseEllipse.image = UIImage(named: "Ellipse green")
                upperCaseLabel.textColor = .label
            } else {
                upperCaseEllipse.image = UIImage(named: "Ellipse red")
                upperCaseLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if lowerCaseTest.evaluate(with: passwordTextField.text!){
                lowerCaseEllipse.image = UIImage(named: "Ellipse green")
                lowerCaseLabel.textColor = .label
            } else {
                lowerCaseEllipse.image = UIImage(named: "Ellipse red")
                lowerCaseLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if numericRegExTest.evaluate(with: passwordTextField.text!){
                numberEllipse.image = UIImage(named: "Ellipse green")
                numberLabel.textColor = .label
            } else {
                numberEllipse.image = UIImage(named: "Ellipse red")
                numberLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if specialChracterTest.evaluate(with: passwordTextField.text!){
                specialCharEllipse.image = UIImage(named: "Ellipse green")
                specialCharLabel.textColor = .label
            } else {
                specialCharEllipse.image = UIImage(named: "Ellipse red")
                specialCharLabel.textColor = UIColor(named: "redAlertLabel")
            }
            
            if (passwordTextField.text?.count ?? 0) < 6 {
                numberCharEllipse.image = UIImage(named: "Ellipse red")
                numberCharLabel.textColor = UIColor(named: "redAlertLabel")
            } else {
                numberCharEllipse.image = UIImage(named: "Ellipse green")
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
            samePasswordEllipse.image = UIImage(named: "Ellipse red")
            samePasswordLabel.textColor = UIColor(named: "redAlertLabel")
            continueButton.backgroundColor = .gray
        } else {
            if confirmPasswordTextField.text == passwordTextField.text {
                samePasswordEllipse.image = UIImage(named: "Ellipse green")
                samePasswordLabel.textColor = .label
                
            } else {
                samePasswordEllipse.image = UIImage(named: "Ellipse red")
                samePasswordLabel.textColor = UIColor(named: "redAlertLabel")
                continueButton.backgroundColor = .gray
            }
        }
        
        if samePasswordEllipse.image == UIImage(named: "Ellipse green") {
            if numberCharEllipse.image == UIImage(named: "Ellipse green"){
                if upperCaseEllipse.image == UIImage(named: "Ellipse green"){
                    if lowerCaseEllipse.image == UIImage(named: "Ellipse green"){
                        if numberEllipse.image == UIImage(named: "Ellipse green"){
                            if specialCharEllipse.image == UIImage(named: "Ellipse green"){
                                continueButton.backgroundColor = UIColor(named: "buttonPink")
                                continueButton.addTarget(nil, action: #selector(continueAction), for: .touchUpInside)
                            }                         }
                    }
                }
            }
        } else {
            continueButton.removeTarget(nil, action: #selector(continueAction), for: .touchUpInside)
            continueButton.backgroundColor = .gray
        }
        
        if samePasswordEllipse.image == UIImage(named: "Ellipse red") {
            if numberCharEllipse.image == UIImage(named: "Ellipse red"){
                if upperCaseEllipse.image == UIImage(named: "Ellipse red"){
                    if lowerCaseEllipse.image == UIImage(named: "Ellipse red"){
                        if numberEllipse.image == UIImage(named: "Ellipse red"){
                            if specialCharEllipse.image == UIImage(named: "Ellipse red"){
                                
                                passwordTFLabel.textColor = UIColor(named: "redAlertLabel")
                                customShaddow.backgroundColor = UIColor(named: "redAlertLabel")
                                
                                confirmPasswordTFLabel.textColor = UIColor(named: "redAlertLabel")
                                customShaddow_.backgroundColor = UIColor(named: "redAlertLabel")
                                
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
            customShaddow.backgroundColor = UIColor(named: "blueNav")
            
            confirmPasswordTFLabel.textColor = .gray
            customShaddow_.backgroundColor = UIColor(named: "blueNav")
            
            hidePasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
            hideConfirmPasswordButton.setImage(UIImage(named: "eyeClose"), for: .normal)
            
            hideWrongPasswordButton.isHidden = true
            hidePasswordButton.isHidden = false
            
            hideWrongConfirmPasswordButton.isHidden = true
            hideConfirmPasswordButton.isHidden = false
        }
    }
    
}
