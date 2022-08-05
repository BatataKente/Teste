//
//  Recuperar1View.swift
//  Teste
//
//  Created by user218997 on 22/07/22.
//

import Foundation
import UIKit

class Recuperar1View: UIViewController {
    
    override var prefersStatusBarHidden: Bool {

        return true
    }
    
    private let backgroundImage = UIImageView()
    
    private let buttonBack = UIButton()
    
    private let imageLogo = UIImageView()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons([
                                                IconsBravve.emailBlue.rawValue,
                                                IconsBravve.padlockGray.rawValue
                                                ])
        let stackView = UIStackView(arrangedSubviews: buttons)
        buttons[0].setTitle(" Email", for: .normal)
        stackView.spacing = CGFloat(5).generateSizeForScreen
        
        return (stack: stackView,
                buttons: buttons)
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
    
    let stackMargins: CGFloat =  CGFloat(12).generateSizeForScreen
        
    private lazy var stackViewEmail: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [labelEmail_, textFieldEmail])
        stackView.spacing =  CGFloat(5).generateSizeForScreen
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderColor =  UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                               left: stackMargins,
                                                               bottom: stackMargins,
                                                               right: stackMargins)
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

        view.addSubviews([backgroundImage, buttonBack, imageLogo, progressBarStackView.stack, label, customShaddow, stackViewEmail, buttonContinue])
        
        defaults()
        addConstraints()
        addTargets()

    }
    
    private func defaults() {
        
        buttonBack.setToBackButtonDefault(.backPink) {_ in
            
            self.dismiss(animated: true)
        }
        imageLogo.setLogoToDefault()
        buttonContinue.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayCell)
        
    }
    
    private func addConstraints() {
        
        progressBarStackView.stack.constraintOutsideTo(.top, imageLogo, CGFloat(50).generateSizeForScreen)
        progressBarStackView.stack.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.stack.heightAnchorInSuperview()
        
        label.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintOutsideTo(.top, progressBarStackView.stack, CGFloat(50).generateSizeForScreen)
        
        stackViewEmail.constraintOutsideTo(.top, label, CGFloat(65).generateSizeForScreen)
        stackViewEmail.constraintInsideTo(.leading, label)
        stackViewEmail.constraintInsideTo(.trailing, label)
        stackViewEmail.heightAnchorInSuperview( CGFloat(65).generateSizeForScreen)
    
        customShaddow.constraintInsideTo(.top, stackViewEmail)
        customShaddow.constraintInsideTo(.leading, stackViewEmail)
        customShaddow.constraintInsideTo(.trailing, stackViewEmail)
        customShaddow.constraintTo(.bottom, stackViewEmail, CGFloat(1).generateSizeForScreen)
        
    }
    
    private func addTargets() {
        
        buttonBack.addTarget(self, action: #selector(actionButtonBack), for: .touchUpInside)
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        stackViewEmail.addGestureRecognizer(stackViewTap)
    }
    
    @objc func stackViewTapped() {
          
        labelEmail_.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(11).generateSizeForScreen)
                
        customShaddow.isHidden = false
        
        textFieldEmail.isHidden = false
        
        textFieldEmail.addTarget(self, action: #selector(changeText), for: .editingChanged)
    }

    
    @objc func actionButtonBack(sender: UIButton){
        print("voltar")
    }
  
    
    @objc func actionButtonContinue() {

        print("ok")
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

