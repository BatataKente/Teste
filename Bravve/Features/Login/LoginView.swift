//
//  loginView.swift
//  Bravve
//
//  Created by user217108 on 8/2/22.
//

import UIKit

class LoginView: UIViewController {
    
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - var and let
    
    let backButton = UIButton()
    
    private let viewModel: LoginViewModel = LoginViewModel()
    
    private let customAlert: CustomAlert = CustomAlert()
    
    private let alertCustom: CustomAlert = CustomAlert()
    
    private let emptyAlert: CustomAlert = CustomAlert()
    
    //MARK: - wayImage
    private lazy var wayImage = UIImageView()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        return view
    }()
    
    //MARK: - logoImage
    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: ImagesBravve.logoWhite.rawValue)
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - titleLabel
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: FontsBravve.koho.rawValue,
                           size: CGFloat(50).generateSizeForScreenByHeight)
        view.textColor = .white
        view.numberOfLines = 0
        view.text = "Bem vindo(a) à Bravve "
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - subTitleLabel
    private lazy var subTitleLabel: UILabel = {
        let view =  UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        view.textColor = .white
        view.text = "O futuro do trabalho é hibrído, remoto,\nconectado e humano!"
        view.numberOfLines = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - loginLabel
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.text =  "Login"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - loginTextField
    private lazy var loginTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont(name: FontsBravve.medium.rawValue,
                           size: CGFloat(16).generateSizeForScreen)
        view.delegate = self
        view.isHidden = true
        view.keyboardType = .emailAddress
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.addTarget(self, action: #selector(loginEmpty), for: .editingChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - loginStackView
    private lazy var loginStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginLabel,loginTextField])
        
        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHotizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        
        stack.spacing = CGFloat(5).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.layer.cornerRadius = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                           left: stackHotizontalMargins,
                                           bottom: stackVerticalMargins,
                                           right: stackHotizontalMargins)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - passwordLabel
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.text =  "Senha"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - passwordTextField
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
        view.isHidden = true
        view.delegate = self
        view.isSecureTextEntry = true
        view.addTarget(self, action: #selector(passwordEmpty), for: .editingChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - eyeButton
    private lazy var eyeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        view.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue), for: .selected)
        view.frame = CGRect(x:0, y:0, width: CGFloat(20).generateSizeForScreen, height:CGFloat(16).generateSizeForScreen)
        view.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //MARK: - passwordStackView
    private lazy var passwordStackView: UIStackView = {
        
        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHotizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        passwordStackView.spacing = CGFloat(5).generateSizeForScreen
        passwordStackView.axis = .vertical
        passwordStackView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        passwordStackView.layer.cornerRadius = 8
        passwordStackView.isLayoutMarginsRelativeArrangement = true
        passwordStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                       left: stackHotizontalMargins,
                                                       bottom: stackVerticalMargins,
                                                       right: stackHotizontalMargins)
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordStackView
    }()
    
    //MARK: - passwordRecoveryButton
    private lazy var passwordRecoveryButton : UIButton = {
        let view = UIButton()
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1,
            NSAttributedString.Key.font: UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.cyan as Any]
        
        let attributedString = NSMutableAttributedString(string: "Esqueci minha senha", attributes: attributes)
        view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        view.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //MARK: - enterButton
    private lazy var enterButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        
        let stackMargins : CGFloat = CGFloat(20).generateSizeForScreen
        view.layoutMargins = UIEdgeInsets(top: stackMargins,
                                          left: stackMargins,
                                          bottom: stackMargins,
                                          right: stackMargins)
        
        let attributesFont: [NSAttributedString.Key : Any] = [
            
            NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any]
        
        let attributedString = NSMutableAttributedString(string: "Entrar", attributes: attributesFont)
        view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - newLabel
    private lazy var newLabel : UILabel  = {
        let view = UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        view.text = "Novo por aqui?"
        view.textColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - registerButton
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        let stackMargins : CGFloat = CGFloat(20).generateSizeForScreen
        view.layoutMargins = UIEdgeInsets(top: stackMargins,
                                          left: stackMargins,
                                          bottom: stackMargins,
                                          right: stackMargins)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let attributesFont: [NSAttributedString.Key : Any] = [
            
            NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white as Any]
        
        let attributedString = NSMutableAttributedString(string: "Cadastre-se",
                                                         attributes: attributesFont)
        view.setAttributedTitle(NSAttributedString(attributedString: attributedString),
                                for: .normal)
        
        let handler = {(action: UIAction) in
            
            let nomeView = NomeView()
            nomeView.modalPresentationStyle = .fullScreen
            self.present(nomeView, animated: true)
        }
        
        view.addAction(UIAction(handler: handler), for: .touchUpInside)
        return view
    }()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayoutConstraints()
        viewModel.delegate = self
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Flags.shared.flag = 0
    }
    
    //MARK: - setupView
    func setupView() {
        
        view.addSubviews([wayImage,
                          titleLabel,
                          subTitleLabel,
                          loginStackView,
                          passwordStackView,
                          eyeButton,
                          passwordRecoveryButton,
                          enterButton,
                          newLabel,
                          registerButton,
                          backButton,
                          logoImage])
        
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        
        wayImage.setWayToDefault(.wayLogin)
        
        let cellStackViewTap = UITapGestureRecognizer(target: self,
                                                      action: #selector(loginStackViewTapped))
        loginStackView.addGestureRecognizer(cellStackViewTap)
        
        let passwordStackViewTap = UITapGestureRecognizer(target: self,
                                                          action: #selector(passwordStackViewTapped))
        passwordStackView.addGestureRecognizer(passwordStackViewTap)
        
        backButton.setToBackButtonDefault {_ in
            
            self.dismiss(animated: true)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - loginButtonTapped
    @objc func loginButtonTapped(){
        
        guard let email = self.loginTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        if self.viewModel.isValid(email: email, password: password) == true{
            
            self.viewModel.loginUser(email: email, password: password)
            UserDefaults.standard.setValue(password, forKey: "userPassword")
            
        } else{
            loginLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            passwordLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            loginEmpty()
            passwordEmpty()
            if eyeButton.currentImage == UIImage(named: ButtonsBravve.eyeOpen.rawValue){
                eyeButton.setImage(UIImage(named: ButtonsBravve.eyeOpenRed.rawValue), for: .normal)
            }   else if eyeButton.currentImage == UIImage(named: ButtonsBravve.eyeClose.rawValue){
                eyeButton.setImage(UIImage(named: ButtonsBravve.eyeCloseRed.rawValue), for: .normal)
            }
            emptyAlert.showAlert(image: UIImage(named: ButtonsBravve.xmarkBlue.rawValue),
                                 message: "Usuário e/ou senha incorretos",
                                 enterAttributed: "Tentar Novamente",
                                 on: self)
        }
    }
    
    //MARK: - loginStackViewTapped
    @objc func loginStackViewTapped() {
        loginIsTapped()
    }
    
    //MARK: - loginEmpty
    @objc func loginEmpty() {
        if loginTextField.text!.count >= 6 {
            loginStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
        } else {
            loginStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    
    //MARK: - loginIsTapped
    func loginIsTapped() {
        loginLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        loginTextField.becomeFirstResponder()
        loginTextField.isHidden = false
        
        let layoutVerticalMargins = CGFloat(10).generateSizeForScreen
        let layoutHorizontalMargins = CGFloat(15).generateSizeForScreen
        loginStackView.layoutMargins = UIEdgeInsets(top: layoutVerticalMargins,
                                                    left: layoutHorizontalMargins,
                                                    bottom: layoutVerticalMargins,
                                                    right: layoutHorizontalMargins)
    }
    
    
    //MARK: - passwordIsTapped
    func passwordIsTapped(){
        passwordLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        passwordTextField.becomeFirstResponder()
        passwordTextField.isHidden = false
        
        let layoutVerticalMargins = CGFloat(10).generateSizeForScreen
        let layoutHorizontalMargins = CGFloat(15).generateSizeForScreen
        passwordStackView.layoutMargins = UIEdgeInsets(top: layoutVerticalMargins,
                                                       left: layoutHorizontalMargins,
                                                       bottom: layoutVerticalMargins,
                                                       right: layoutHorizontalMargins)
        
    }
    
    //MARK: - passwordStackViewTapped
    @objc func passwordStackViewTapped() {
        passwordIsTapped()
    }
    
    //MARK: - passwordEmpty
    @objc func passwordEmpty() {
        if passwordTextField.text!.count >= 6 {
            passwordStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
        } else {
            passwordStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - tapEyeButton
    @objc func tapEyeButton () {
        eyeButton.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    //MARK: - forgotPasswordButtonTapped
    @objc func forgotPasswordButtonTapped(){
        let vc = PasswordRecoveryEmailView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    //MARK: - setupLayoutConstraint
    private func setupLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            
           logoImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
           logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
           logoImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen),
           logoImage.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
           
           titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
           titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
           
           subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
           subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
           loginStackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
           loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
           passwordStackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 15),
           passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
           eyeButton.heightAnchor.constraint(equalToConstant: 15),
           eyeButton.centerYAnchor.constraint(equalTo: passwordStackView.centerYAnchor),
           eyeButton.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor, constant: -15),
           
           passwordRecoveryButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 20),
           passwordRecoveryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           
           enterButton.topAnchor.constraint(equalTo: passwordRecoveryButton.bottomAnchor, constant: 20),
           enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           enterButton.heightAnchor.constraint(equalToConstant: 50),
           
           
           newLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 50),
           newLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           
           registerButton.topAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 10),
           registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           registerButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField{
            passwordTextField.isHidden = false
            passwordIsTapped()
            passwordTextField.becomeFirstResponder()
        }
        else {
            passwordTextField.resignFirstResponder()
        }
        return true
}
}


extension LoginView: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginLabel.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        passwordLabel.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
    }
    
}
    
    
extension UIStackView {
    func setBottomBorderBlue(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = CGColor(red: 26/255, green: 23/255, blue: 80/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.03
        
    }
}

extension UIStackView {
    func setBottomBorderRed(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = CGColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.03
        
    }
}

extension LoginView: LoginViewModelProtocol {    
    func showCustomAlert(message: String) {
        self.customAlert.showAlert(image: UIImage(named: ButtonsBravve.xmarkBlue.rawValue),
                                   message: message,
                                   enterAttributed: "Tentar Novamente",
                                   on: self)
    }
    
    func showAlertCustom(message: String) {
        self.alertCustom.showAlert(image: UIImage(named: ButtonsBravve.xmarkBlue.rawValue),
                                   message: message,
                                   enterAttributed: "Tentar Novamente",
                                   on: self)
    }
    
    func presentNextScreen() {
        let vc = HomeClosedView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
