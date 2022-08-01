//
//  PasswordRecoverySMSView.swift
//  TestB
//
//  Created by user220237 on 7/20/22.
//

import UIKit

class PasswordRecoverySMSView: UIViewController, UITextFieldDelegate {

    let backgroundImage: UIImageView = {
        let image = UIImage(named: "wayEmail")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bravveIcon = UIImageView()
    
    let messageSentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enviamos o código de confirmação por SMS e precisamos dele!"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: "Ubuntu-Regular", size: 16)
        label.textColor = UIColor(named: "label")
        return label
    }()
    
    let codeImage: UIImageView = {
        let image = UIImage(named: "recoveryPassword")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let insertCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insira o código"
        label.textAlignment = .center
        label.font = UIFont(name: "Ubuntu-Medium", size: 16)
        label.textColor = UIColor(named: "label")
        return label
    }()
    
    lazy var code1TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.becomeFirstResponder()
        return textField
    }()
    
    lazy var code2TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var code3TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var code4TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var code5TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var code6TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: "Ubuntu-Medium", size: 26)
        textField.textColor = UIColor(named: "labelTextField")
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        return textField
    }()
        
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [code1TextField, code2TextField, code3TextField, code4TextField, code5TextField,code6TextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    let messageNotReceivedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let begginingText = "Não recebeu? Aguarde "
        let normalAttrs = [NSMutableAttributedString.Key.font: UIFont(name: "Ubuntu-Regular", size: 14)]
        let labelattributedString = NSMutableAttributedString(string: begginingText, attributes: normalAttrs as [NSAttributedString.Key : Any])
        let boldString = "30 "
        let attrs = [NSAttributedString.Key.font: UIFont(name: "Ubuntu-Bold", size: 14)]
        let boldMutableString = NSMutableAttributedString(string: boldString, attributes: attrs as [NSAttributedString.Key : Any])
        labelattributedString.append(boldMutableString)
        let endingString = "segundos"
        let endingMutableString = NSMutableAttributedString(string: endingString, attributes: normalAttrs as [NSAttributedString.Key : Any])
        labelattributedString.append(endingMutableString)
        label.attributedText = labelattributedString
        label.textAlignment = .center
        label.textColor = UIColor(named: "label")
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 331, height: 52))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonGray")
        button.layer.cornerRadius = 12
        return button
    }()
    
   
    let resendCodeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 109, height: 17))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reenviar código", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 15)
        let frame = CGRect(x: 0, y: button.frame.size.height + 6, width: button.frame.size.width, height: 1)
        let borderBottom = UIView(frame: frame)
        borderBottom.backgroundColor = UIColor(named: "blueNav")
        button.addSubview(borderBottom)
        button.setTitleColor(UIColor(named: "blueNav"), for: .normal)
        button.addTarget(self, action: #selector(resendCodeButtonTapped), for: .touchUpInside)
        return button
    }()

    func filledCode() {
        
        if code1TextField.text != "" && code2TextField.text != "" && code3TextField.text != "" && code4TextField.text != "" && code5TextField.text != "" && code6TextField.text != "" {

            continueButton.addTarget(nil,
                                     action: #selector(continueButtonTapped),
                                     for: .touchUpInside)
            continueButton.backgroundColor = UIColor(named: "buttonPink")
            resendCodeButton.isHidden = true
        }
        else {
            
            continueButton.removeTarget(nil,
                                        action: #selector(continueButtonTapped),
                                        for: .touchUpInside)
            continueButton.backgroundColor = UIColor(named: "buttonGray")
            resendCodeButton.isHidden = false
        }
    }
    
    @objc func continueButtonTapped() {
            
        print("Chamando próxima tela")
    }
    
    @objc func resendCodeButtonTapped() {
            
        print("Novo código enviado")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "buttonPink")?.cgColor
        textField.layer.cornerRadius = 5
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 0
        filledCode()
    }
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        
        self.code1TextField.delegate = self
        self.code2TextField.delegate = self
        self.code3TextField.delegate = self
        self.code4TextField.delegate = self
        self.code5TextField.delegate = self
        self.code6TextField.delegate = self
    }
    
    func setupView() {
        
        view.addSubviews([backgroundImage, bravveIcon, messageSentLabel, codeImage, insertCodeLabel, textFieldStackView, messageNotReceivedLabel, continueButton, resendCodeButton])

        view.backgroundColor = UIColor(named: "background")
    }
    
    func setupDefaults() {
        
        bravveIcon.setLogoToDefault()
    }
    
    private func setupConstraints() {
        
        setMessageSentLabelConstraints()
        setCodeImageConstraints()
        setInsertCodeLabelConstraints()
        setCodeTextFieldConstraints()
        setBackgroundImageConstraints()
        setTextFieldStackViewConstraints()
        setMessageNotReceivedLabelConstraints()
        setContinueButtonConstraints()
        setResendCodeButtonConstraints()
    }
    
    
    private func setMessageSentLabelConstraints() {
        
        let constraint = [
            messageSentLabel.topAnchor.constraint(equalTo: bravveIcon.bottomAnchor, constant: 55),
            messageSentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22.5),
            messageSentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22.5),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setCodeImageConstraints() {
        
        let constraint = [
            codeImage.topAnchor.constraint(equalTo: messageSentLabel.bottomAnchor, constant: 48.1),
            codeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeImage.widthAnchor.constraint(equalToConstant: 58.8),
            codeImage.heightAnchor.constraint(equalToConstant: 87.8)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setBackgroundImageConstraints() {
        
        let constraint = [
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setInsertCodeLabelConstraints() {
        
        let constraint = [
            insertCodeLabel.topAnchor.constraint(equalTo: codeImage.bottomAnchor, constant: 48.1),
            insertCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setCodeTextFieldConstraints() {
        
        let constraint = [
            code1TextField.widthAnchor.constraint(equalToConstant: 50),
            code1TextField.heightAnchor.constraint(equalToConstant: 50),
            code2TextField.widthAnchor.constraint(equalToConstant: 50),
            code2TextField.heightAnchor.constraint(equalToConstant: 50),
            code3TextField.widthAnchor.constraint(equalToConstant: 50),
            code3TextField.heightAnchor.constraint(equalToConstant: 50),
            code4TextField.widthAnchor.constraint(equalToConstant: 50),
            code4TextField.heightAnchor.constraint(equalToConstant: 50),
            code5TextField.widthAnchor.constraint(equalToConstant: 50),
            code5TextField.heightAnchor.constraint(equalToConstant: 50),
            code6TextField.widthAnchor.constraint(equalToConstant: 50),
            code6TextField.heightAnchor.constraint(equalToConstant: 50),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setTextFieldStackViewConstraints() {
        
        let constraint = [
            textFieldStackView.topAnchor.constraint(equalTo: insertCodeLabel.bottomAnchor, constant: 20),
            textFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setMessageNotReceivedLabelConstraints() {
        
        let constraint = [
            messageNotReceivedLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 41.33),
            messageNotReceivedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setContinueButtonConstraints() {
        
        let constraint = [
            continueButton.topAnchor.constraint(equalTo: messageNotReceivedLabel.bottomAnchor, constant: 41.33),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 331),
            continueButton.heightAnchor.constraint(equalToConstant: 52)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setResendCodeButtonConstraints() {
        
        let constraint = [
            resendCodeButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 26),
            resendCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }

}



