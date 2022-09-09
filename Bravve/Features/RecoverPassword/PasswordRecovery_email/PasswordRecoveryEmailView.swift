//
//  Recuperar1View.swift
//  Bravve
//
//  Created by user218997 on 22/07/22.
//

import Foundation
import UIKit

class PasswordRecoveryEmailView: UIViewController {
    
    let passwordRecoveryEmailViewModel = PasswordRecoveryEmailViewModel()
    
    override var prefersStatusBarHidden: Bool {
        
        return true
        
    }
    
    private let customAlert = CustomAlert()
    
    private let backgroundImage = UIImageView()
    
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtonsWithoutActions([
            IconsBravve.emailBlue.rawValue,
            IconsBravve.padlockGray.rawValue
        ])
        return buttons
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Informe seu e-mail para enviarmos um código de confirmação!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.label.rawValue)
        textField.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.addTarget(nil, action: #selector(changeText), for: .allEditingEvents)
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let labelEmail_: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackViewEmail: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelEmail_, textFieldEmail])
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: CGFloat(10).generateSizeForScreen, left: CGFloat(10).generateSizeForScreen, bottom: CGFloat(10).generateSizeForScreen, right: CGFloat(10).generateSizeForScreen)
        stackView.axis = .vertical
        stackView.layer.borderWidth = CGFloat(1).generateSizeForScreen
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let customShaddow: UIView = {
        let customShaddow = UIView()
        customShaddow.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        customShaddow.translatesAutoresizingMaskIntoConstraints = false
        return customShaddow
    }()
    
    private let registerFailLabel: UILabel = {
            let registerFailLabel = UILabel()
        registerFailLabel.text = "Formato de e-mail inválido"
            registerFailLabel.font = UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(11).generateSizeForScreen)
            registerFailLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        registerFailLabel.translatesAutoresizingMaskIntoConstraints = false
            return registerFailLabel
        }()
    
    
    private let buttonContinue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([backgroundImage, label, customShaddow, stackViewEmail, buttonContinue, registerFailLabel])
        
        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            self.dismiss(animated: true)
        }
        
        registerFailLabel.isHidden = true
        
        defaults()
        addConstraints()
        addTargets()
        passwordRecoveryEmailViewModel.delegate = self
    }
    
    private func defaults() {
        
        buttonContinue.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayConfirm_2)
        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(23).generateSizeForScreen),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-23).generateSizeForScreen),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(235).generateSizeForScreen),
            
            stackViewEmail.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            stackViewEmail.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            stackViewEmail.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CGFloat(70).generateSizeForScreen),
            stackViewEmail.heightAnchor.constraint(equalToConstant: CGFloat(65).generateSizeForScreen),
            
            registerFailLabel.topAnchor.constraint(equalTo: stackViewEmail.bottomAnchor, constant: CGFloat(5).generateSizeForScreen),
            registerFailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(25).generateSizeForScreen),
            
            customShaddow.topAnchor.constraint(equalTo: stackViewEmail.topAnchor),
            customShaddow.leadingAnchor.constraint(equalTo: stackViewEmail.leadingAnchor),
            customShaddow.trailingAnchor.constraint(equalTo: stackViewEmail.trailingAnchor),
            customShaddow.bottomAnchor.constraint(equalTo: stackViewEmail.bottomAnchor,
                                                  constant: Ride.up.rawValue)
        
        ])
        
    }
    
    private func addTargets() {
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        stackViewEmail.addGestureRecognizer(stackViewTap)
    }
    
    @objc func stackViewTapped() {
        
        labelEmail_.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
        
        customShaddow.isHidden = false
        
        textFieldEmail.isHidden = false
        
        textFieldEmail.becomeFirstResponder()
        
        textFieldEmail.addTarget(self, action: #selector(changeText), for: .editingChanged)
    }
    
    
    @objc func actionButtonContinue() {
        passwordRecoveryEmailViewModel.makeAPICall(email: textFieldEmail.text ?? "")
//        goToNextScreen()
    }

    //MARK: changeText
    @objc func changeText(_ sender: UITextField) {
        
        if validateEmail(sender.text ?? "") {
            
            passwordRecoveryEmailViewModel.refreshScreen()
            labelEmail_.textColor = UIColor.gray
            registerFailLabel.isHidden = true
            customShaddow.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
            buttonContinue.addTarget(nil,action: #selector(actionButtonContinue),for: .touchUpInside)
            buttonContinue.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {
            
            passwordRecoveryEmailViewModel.makeFailScreen()
            labelEmail_.textColor = UIColor.red
            registerFailLabel.isHidden = false
            customShaddow.backgroundColor = UIColor.red
            buttonContinue.removeTarget(nil,action: #selector(actionButtonContinue),for: .touchUpInside)
            buttonContinue.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        }
    }
}

extension PasswordRecoveryEmailView: PasswordRecoveryEmailViewProtocol {
    
    func setIshidden(alertButton: Bool, registerFailLabel: Bool, rightTextField: Bool, ways: [Bool]) {
        
    }
    
    func setFont(font: UIFont) {
        
    }
    
    func setColors(textColor: UIColor?, customShaddowbackgroundColor: UIColor?) {
        
    }
    
    func setText(rightLabel: String, rightTextField: String, infoLabel: String, registerFailLabel: String) {
        
    }
    
    func freezeButton() {
        func freezeButton_() {
            
            buttonContinue.removeTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
            buttonContinue.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        }
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        
    }
    
    func goToNextScreen() {
        
        let vc = PasswordRecoveryPassword()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func showAlert(message: String) {
        self.customAlert.showAlert(image: UIImage(named: ButtonsBravve.xmarkBlue.rawValue),
                                   message: message,
                                   enterAttributed: "Tentar Novamente",
                                   on: self)
    }
    
    
}
