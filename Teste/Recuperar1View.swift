//
//  Recuperar1View.swift
//  Teste
//
//  Created by user218997 on 22/07/22.
//

import Foundation
import UIKit

class Recuperar1View: UIViewController {
    
    let backgroundImage = UIImageView()
    
    let buttonBack = UIButton()
    
    let imageLogo = UIImageView()
    
    let buttonEmail: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emailBlueSmall"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelEmail: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont(name: "Ubuntu-Medium", size: 14)
        label.textColor = UIColor(named: "BlueBravve")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonPasswordRecovery: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "padlockGray"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ buttonEmail, labelEmail, buttonPasswordRecovery ])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Informe seu e-mail para enviarmos um código de confirmação!"
        label.textAlignment = .center
        label.font = UIFont(name: "Ubuntu-Light", size: 16)
        label.textColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Ubuntu-Medium", size: 16)
        textField.textColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0)
        textField.backgroundColor = .white
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let labelEmail_: UILabel = {
        let label = UILabel()
        label.text = " E-mail"
        label.font = UIFont(name: "Ubuntu-Regular", size: 15)
        label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackMargins: CGFloat = 12
        
    lazy var stackViewEmail: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [labelEmail_, textFieldEmail])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.borderColor = CGColor(red: 0.82, green: 0.84, blue: 0.87, alpha: 1.0)
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

    let customShaddow: UIView = {
        
        let customShaddow = UIView()
        customShaddow.backgroundColor = UIColor(red: 0.03, green: 0.01, blue: 0.41, alpha: 1.0)
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()

    
    let buttonContinue = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "WhiteBrave")

        addSubviews()
        addConstraints()
        
        buttonBack.addTarget(self, action: #selector(actionButtonBack), for: .touchUpInside)
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        stackViewEmail.addGestureRecognizer(stackViewTap)

        
    }
    
    func addSubviews() {
        
        view.addSubview(backgroundImage)
        view.addSubview(buttonBack)
        view.addSubview(imageLogo)
        view.addSubview(stackView)
        view.addSubview(label)
        view.addSubview(customShaddow)
        view.addSubview(stackViewEmail)
        view.addSubview(buttonContinue)
    }
    
    func addConstraints() {
        
        buttonBack.setToBackButtonDefault("PinkBravve", 22)
        imageLogo.setLogoToDefault()
        buttonContinue.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault("way1")
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 105),
            stackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 50),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            label.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
                        
            stackViewEmail.heightAnchor.constraint(equalToConstant: 65),
            
        ])
        
        stackViewEmail.constraintOutsideTo(.top, label, 70)
        stackViewEmail.constraintInsideTo(.leading, label)
        stackViewEmail.constraintInsideTo(.trailing, label)
        
        customShaddow.constraintInsideTo(.top, stackViewEmail)
        customShaddow.constraintInsideTo(.leading, stackViewEmail)
        customShaddow.constraintInsideTo(.trailing, stackViewEmail)
        
        view.addConstraint(NSLayoutConstraint(item: customShaddow,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: stackViewEmail,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 1))
    }
    
    @objc func stackViewTapped() {
          
        labelEmail_.font = UIFont(name: "Ubuntu-Regular", size: 11)
        
        customShaddow.isHidden = false
        
        textFieldEmail.isHidden = false
        
        textFieldEmail.addTarget(self, action: #selector(changeText), for: .editingChanged)
    }

    
    @objc func actionButtonBack(sender: UIButton){
        
    }
  
    
    @objc func actionButtonContinue() {

        print("ok")
    }
    
    func freezeButton_() {
        
        buttonContinue.removeTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        buttonContinue.backgroundColor = UIColor(named: "GrayBravve")
    }


    @objc func changeText(_ sender: UITextField) {
           
           if sender.text != "" {

               buttonContinue.addTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
               buttonContinue.backgroundColor = UIColor(named: "PinkBravve")
           }
           else {
               
               buttonContinue.removeTarget(nil, action: #selector(actionButtonContinue), for: .touchUpInside)
               buttonContinue.backgroundColor = UIColor(named: "GrayBravve")
           }
       }

    
    
}
