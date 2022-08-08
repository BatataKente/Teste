//
//  loginView.swift
//  Bravve
//
//  Created by user217108 on 8/2/22.
//

import UIKit

class LoginView: UIViewController {
    
    let backButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupLayoutConstraints()
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    func setupView() {
        
        view.addSubviews([wayImage, titleLabel, subTitleLabel, cellStackView, passwordStackView, eyeButton, passwordRecoveryButton, enterButton, newLabel, registerButton, backButton, logoImage])
        
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        
        wayImage.setWayToDefault(.wayLogin)
        
        let cellStackViewTap = UITapGestureRecognizer(target: self,
                                                      action: #selector(cellStackViewTapped))
        cellStackView.addGestureRecognizer(cellStackViewTap)
        
        let passwordStackViewTap = UITapGestureRecognizer(target: self,
                                                          action: #selector(passwordStackViewTapped))
        passwordStackView.addGestureRecognizer(passwordStackViewTap)
        
        backButton.setToBackButtonDefault {_ in
            
            self.dismiss(animated: true)
        }
    }
    
    func showTextFields() {
        
        let layoutVerticalMargins = CGFloat(10).generateSizeForScreen
        let layoutHorizontalMargins = CGFloat(15).generateSizeForScreen
        
        cellLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                size: CGFloat(10).generateSizeForScreen)
        cellTextField.isHidden = false
        cellStackView.layoutMargins = UIEdgeInsets(top: layoutVerticalMargins,
                                                   left: layoutHorizontalMargins,
                                                   bottom: layoutVerticalMargins,
                                                   right: layoutHorizontalMargins)
        
        passwordLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                    size: CGFloat(10).generateSizeForScreen)
        passwordTextField.isHidden = false
        passwordStackView.layoutMargins = UIEdgeInsets(top: layoutVerticalMargins,
                                                       left: layoutHorizontalMargins,
                                                       bottom: layoutVerticalMargins,
                                                       right: layoutHorizontalMargins)
    }
    
    @objc func cellStackViewTapped() {
        
        showTextFields()
    }
    
    @objc func passwordStackViewTapped() {
        
        showTextFields()
    }

    private lazy var backgroundView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        
        let view = UIImageView()
        view.image = UIImage(named: ImagesBravve.logoWhite.rawValue)
        view.contentMode = .scaleAspectFill
        
        return view
        
    }()
    
    private lazy var wayImage = UIImageView()
      
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont(name: FontsBravve.koho.rawValue,
                           size: CGFloat(50).generateSizeForScreenByHeight)
        view.textColor = .white
        view.numberOfLines = 0
        
        view.text = "Bem vindo(a) à Bravve "
        
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        
        let view =  UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        view.textColor = .white
        view.text = "O futuro do trabalho é hibrído, remoto,\nconectado e humano!"
        view.numberOfLines = 4
        
        return view
    }()
    
    private lazy var cellLabel: UILabel = {
        
        let view = UILabel()
        view.text =  "Número de Celular"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        return view
    }()
    
    private lazy var cellTextField: UITextField = {
        
        let view = UITextField()
        view.font = UIFont(name: FontsBravve.medium.rawValue,
                           size: CGFloat(16).generateSizeForScreen)
        view.isHidden = true
        view.keyboardType = .namePhonePad
        
        return view
    }()
        
    private lazy var cellStackView: UIStackView = {

        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHotizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen

        let cellStackView = UIStackView(arrangedSubviews: [cellLabel,cellTextField])
        cellStackView.spacing = CGFloat(5).generateSizeForScreen
        cellStackView.axis = .vertical
        cellStackView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        cellStackView.layer.cornerRadius = 8
        cellStackView.isLayoutMarginsRelativeArrangement = true
        cellStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                   left: stackHotizontalMargins,
                                                   bottom: stackVerticalMargins,
                                                   right: stackHotizontalMargins)
        return cellStackView
    }()
    
    private lazy var passwordLabel: UILabel = {
        
        let view = UILabel()
        view.text =  "Senha"
        view.font = UIFont(name: FontsBravve.light.rawValue,
                           size: CGFloat(15).generateSizeForScreen)
        view.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        
        let view = UITextField()
        view.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
        view.isHidden = true
        view.keyboardType = .namePhonePad
        
        return view
    }()
    
    private lazy var eyeButton: UIButton = {
        
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: ButtonsBravve.eyeOpen.rawValue), for: .normal)
        view.setImage(UIImage(named: ButtonsBravve.eyeClose.rawValue), for: .selected)
        view.frame = CGRect(x:0, y:0, width: CGFloat(20).generateSizeForScreen, height:CGFloat(16).generateSizeForScreen)
        view.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
        
        return view
    }()
    
    @objc func tapEyeButton () {
        
        eyeButton.isSelected.toggle()
        
        if eyeButton.isSelected {
            passwordTextField.isSecureTextEntry = true
        } else {
            passwordTextField.isSecureTextEntry  = false
        }
    }

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
    
    private lazy var passwordRecoveryButton : UIButton = {
        
        let view = UIButton()
      
        let attributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.underlineStyle: 1,
        NSAttributedString.Key.font: UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen) as Any,
        NSAttributedString.Key.foregroundColor: UIColor.cyan as Any]

        let attributedString = NSMutableAttributedString(string: "Esqueci minha senha", attributes: attributes)
        view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        
        return view
    }()
    
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
        
        return view
    }()
    
    
    private lazy var newLabel : UILabel  = {
        
        let view = UILabel()
        view.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        view.text = "Novo por aqui?"
        view.textColor = UIColor.white
    
        return view
    }()
    
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
        
        cellStackView.constraintOutsideTo(.top, subTitleLabel, CGFloat(20).generateSizeForScreen)
        cellStackView.constraintInsideTo(.leading, passwordStackView)
        cellStackView.constraintInsideTo(.trailing, passwordStackView)
        
        passwordStackView.constraintOutsideTo(.top, cellStackView, CGFloat(15).generateSizeForScreen)
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
