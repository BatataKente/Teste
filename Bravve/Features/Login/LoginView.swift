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
    let sessionManager = SessionManager()
    
    let backButton = UIButton()
    
    private let viewModel: LoginViewModel = LoginViewModel()
    
    private let customAlert: CustomAlert = CustomAlert()
    
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
        return view
    }()
    
    //MARK: - subTitleLabel
    private lazy var subTitleLabel: UILabel = {
        let view =  UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        view.textColor = .white
        view.text = "O futuro do trabalho é hibrído, remoto,\nconectado e humano!"
        view.numberOfLines = 4
        return view
    }()
    
    //MARK: - loginLabel
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.text =  "Login"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
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
        return stack
    }()
    
    //MARK: - passwordLabel
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.text =  "Senha"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
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
        return view
    }()
    
    //MARK: - eyeButton
    private lazy var eyeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        view.frame = CGRect(x:0, y:0, width: CGFloat(20).generateSizeForScreen, height:CGFloat(16).generateSizeForScreen)
        view.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
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
        return view
    }()
    
    
    //MARK: - newLabel
    private lazy var newLabel : UILabel  = {
        let view = UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        view.text = "Novo por aqui?"
        view.textColor = UIColor.white
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
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = 0
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
    

    //MARK: - loginButtonTapped
    @objc func loginButtonTapped(){
        let vc = HomeClosedView()
        vc.modalPresentationStyle = .fullScreen
        
        guard let email = self.loginTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        if self.viewModel.isValid(email: email, password: password) == true{
            
            let parameters = LoginParameters(email: email, password: password)
            
            sessionManager.postDataWithOpenResponse(endpoint: .auth, parameters: parameters) { (statusCode, error, token: Token?) in
               
                guard let tokenResponse = token?.token else {
                    
                    print(statusCode as Any)
                    print(token?.message as Any)
                    return
                }
                
                    UserDefaults.standard.setValue(tokenResponse, forKey: "access_token")
                    self.present(vc, animated: false)
            }
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
                customAlert.showAlert(image: UIImage(named: ButtonsBravve.xmarkBlue.rawValue),
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
        
        if eyeButton.isSelected {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry  = false
            eyeButton.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue), for: .normal)
        }
    }
    
    //MARK: - forgotPasswordButtonTapped
    @objc func forgotPasswordButtonTapped(){
        let vc = PasswordRecoveryEmailView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    //MARK: - setupLayoutConstraint
    private func setupLayoutConstraints() {
        
        logoImage.constraintOutsideTo(.top, backButton, 30)
        logoImage.constraintInsideTo(.leading, view.safeAreaLayoutGuide,
                                     CGFloat(20).generateSizeForScreen)
        logoImage.constraintOutsideTo(.width, logoImage, multiplier: 4)
        logoImage.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        
        titleLabel.constraintOutsideTo(.top, logoImage, CGFloat(20).generateSizeForScreen)
        titleLabel.constraintInsideTo(.leading, logoImage)
        titleLabel.constraintInsideTo(.trailing, view.safeAreaLayoutGuide,
                                      CGFloat(20).generateSizeForScreen)
        
        subTitleLabel.constraintOutsideTo(.top, titleLabel, CGFloat(5).generateSizeForScreen)
        subTitleLabel.constraintInsideTo(.leading, titleLabel)
        subTitleLabel.constraintInsideTo(.trailing, titleLabel)
    
        
        
        loginStackView.constraintOutsideTo(.top, subTitleLabel, CGFloat(20).generateSizeForScreen)
        loginStackView.constraintInsideTo(.leading, passwordStackView)
        loginStackView.constraintInsideTo(.trailing, passwordStackView)
    
        
        passwordStackView.constraintOutsideTo(.top, loginStackView, CGFloat(15).generateSizeForScreen)
        passwordStackView.constraintInsideTo(.leading, subTitleLabel)
        passwordStackView.constraintInsideTo(.trailing, subTitleLabel)
        
        eyeButton.heightAnchorInSuperview(CGFloat(15).generateSizeForScreen)
        eyeButton.constraintInsideTo(.centerY, passwordStackView)
        eyeButton.constraintInsideTo(.trailing, passwordStackView,
                                     CGFloat(15).generateSizeForScreen)
        
        enterButton.constraintOutsideTo(.top, passwordRecoveryButton, CGFloat(20).generateSizeForScreen)
        enterButton.constraintInsideTo(.leading, passwordStackView)
        enterButton.constraintInsideTo(.trailing, passwordStackView)
        enterButton.constraintInsideTo(.height, registerButton)
        
        passwordRecoveryButton.constraintOutsideTo(.top, passwordStackView, CGFloat(20).generateSizeForScreen)
        passwordRecoveryButton.constraintInsideTo(.leading, passwordStackView, 6)
        
        newLabel.constraintOutsideTo(.top, enterButton,
                                     CGFloat(50).generateSizeForScreenByHeight)
        newLabel.constraintInsideTo(.leading, enterButton)
        
        registerButton.constraintOutsideTo(.top, newLabel, CGFloat(10).generateSizeForScreen)
        registerButton.constraintInsideTo(.leading, enterButton)
        registerButton.constraintInsideTo(.trailing, enterButton)
        registerButton.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)
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
