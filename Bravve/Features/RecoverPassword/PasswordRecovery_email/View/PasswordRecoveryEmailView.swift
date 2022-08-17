//
//  Recuperar1View.swift
//  Bravve
//
//  Created by user218997 on 22/07/22.
//

import Foundation
import UIKit

class PasswordRecoveryEmailView: UIViewController {
    
    override var prefersStatusBarHidden: Bool {

            return true

        }
    
    private let backgroundImage = UIImageView()
    
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtonsWithoutActions([
            IconsBravve.emailBlue.rawValue,
            IconsBravve.padlockGray.rawValue
        ])
        buttons[0].setTitle(" Email ", for: .normal)
        return buttons
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Informe seu e-mail para enviarmos um código de confirmação!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        return label
    }()
    
    private let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.label.rawValue)
        textField.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        textField.isHidden = true
        return textField
    }()

    private let labelEmail_: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
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
        return stackView
    }()
                                
    private let customShaddow: UIView = {
        let customShaddow = UIView()
        customShaddow.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        return customShaddow
    }()

    
    private let buttonContinue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()

        view.addSubviews([backgroundImage, label, customShaddow, stackViewEmail, buttonContinue])
        
        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            self.dismiss(animated: true)
        }
        
        defaults()
        addConstraints()
        addTargets()

    }
    
    private func defaults() {
        
        buttonContinue.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayConfirm_2)
        
    }
    
    private func addConstraints() {
        
        label.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintInsideTo(.top, view, CGFloat(250).generateSizeForScreen)
        
        stackViewEmail.constraintOutsideTo(.top, label, CGFloat(69).generateSizeForScreen)
        stackViewEmail.constraintInsideTo(.leading, label)
        stackViewEmail.constraintInsideTo(.trailing, label)
        stackViewEmail.heightAnchorInSuperview( CGFloat(65).generateSizeForScreen)
        
        customShaddow.constraintInsideTo(.top, stackViewEmail)
        customShaddow.constraintInsideTo(.leading, stackViewEmail)
        customShaddow.constraintInsideTo(.trailing, stackViewEmail)
        customShaddow.constraintTo(.bottom, stackViewEmail, CGFloat(1).generateSizeForScreen)
        
        
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
        let vc = PasswordRecoveryPassword()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func freezeButton_() {
        
        buttonContinue.removeTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        buttonContinue.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
    }


    @objc func changeText(_ sender: UITextField) {
           
           if sender.text != "" {

               buttonContinue.addTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
               buttonContinue.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
           }
           else {
               
               buttonContinue.removeTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
               buttonContinue.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
           }
       }

    
    
}
