//
//  TokenView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 16/08/22.
//

import UIKit

class TokenView: UIViewController, UITextFieldDelegate {

    
    let backgroundImage = UIImageView()
        
    let continueButton = UIButton()
    
    let messageSentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enviamos o código de confirmação por SMS e precisamos dele!"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
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
        label.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    lazy var code1TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.becomeFirstResponder()
        textField.tag = 1
        return textField
    }()
    
    lazy var code2TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.tag = 2
        return textField
    }()
    
    lazy var code3TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.tag = 3
        return textField
    }()
    
    lazy var code4TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.tag = 4
        return textField
    }()
    
    lazy var code5TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.tag = 5
        return textField
    }()
    
    lazy var code6TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(26).generateSizeForScreen)
        textField.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textAlignment = .center
        textField.tag = 6
        return textField
    }()
        
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [code1TextField, code2TextField, code3TextField, code4TextField, code5TextField,code6TextField])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = CGFloat(7).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    let messageNotReceivedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let begginingText = "Não recebeu? Aguarde "
        let normalAttrs = [NSMutableAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(14).generateSizeForScreen)]
        let labelattributedString = NSMutableAttributedString(string: begginingText, attributes: normalAttrs as [NSAttributedString.Key : Any])
        let boldString = "30 "
        let attrs = [NSAttributedString.Key.font: UIFont(name: FontsBravve.bold.rawValue,size: CGFloat(14).generateSizeForScreen)]
        let boldMutableString = NSMutableAttributedString(string: boldString, attributes: attrs as [NSAttributedString.Key : Any])
        labelattributedString.append(boldMutableString)
        let endingString = "segundos"
        let endingMutableString = NSMutableAttributedString(string: endingString, attributes: normalAttrs as [NSAttributedString.Key : Any])
        labelattributedString.append(endingMutableString)
        label.attributedText = labelattributedString
        label.textAlignment = .center
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    let resendCodeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 109, height: 17))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reenviar código", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,size: CGFloat(15).generateSizeForScreen)
        let frame = CGRect(x: 0, y: button.frame.size.height + CGFloat(6).generateSizeForScreen, width: button.frame.size.width.generateSizeForScreen, height: CGFloat(1).generateSizeForScreen)
        let borderBottom = UIView(frame: frame)
        borderBottom.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        button.addSubview(borderBottom)
        button.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        button.addTarget(TokenView.self, action: #selector(resendCodeButtonTapped), for: .touchUpInside)
        return button
    }()

    func filledCode() {
        
        if code1TextField.text != "" && code2TextField.text != "" && code3TextField.text != "" && code4TextField.text != "" && code5TextField.text != "" && code6TextField.text != "" {

            continueButton.addTarget(nil,
                                     action: #selector(continueButtonTapped),
                                     for: .touchUpInside)
            continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            resendCodeButton.isHidden = true
        }
        else {
            
            continueButton.removeTarget(nil,
                                        action: #selector(continueButtonTapped),
                                        for: .touchUpInside)
            continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
            resendCodeButton.isHidden = false
        }
    }
    
    @objc func continueButtonTapped() {
        let vc = FotoView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func resendCodeButtonTapped() {
            
        print("Novo código enviado")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = CGFloat(1).generateSizeForScreen
        textField.layer.borderColor = UIColor(named: ColorsBravve.buttonPink.rawValue)?.cgColor
        textField.layer.cornerRadius = CGFloat(5).generateSizeForScreen
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 1{
            textField.endEditing(true)
            textField.resignFirstResponder()
            
            switch textField.tag{
            case 1:
                code2TextField.becomeFirstResponder()
            case 2:
                code3TextField.becomeFirstResponder()
            case 3:
                code4TextField.becomeFirstResponder()
            case 4:
                code5TextField.becomeFirstResponder()
            case 5:
                code6TextField.becomeFirstResponder()
            case 6:
                code2TextField.resignFirstResponder()
            default:
                textField.endEditing(true)
                textField.resignFirstResponder()
            }
        }

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
        
        view.addSubviews([backgroundImage, messageSentLabel, codeImage, insertCodeLabel, textFieldStackView, messageNotReceivedLabel, continueButton, resendCodeButton])

        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.createRegisterCustomBar(.backPink) { _ in
            self.dismiss(animated: true)
        }
        
    }

    
    func setupDefaults() {
        
        backgroundImage.setWayToDefault(ImagesBravve.wayEmail)
        continueButton.setToBottomButtonKeyboardDefault()
    }
    
    private func setupConstraints() {
        
        setMessageSentLabelConstraints()
        setCodeImageConstraints()
        setInsertCodeLabelConstraints()
        setCodeTextFieldConstraints()
        setTextFieldStackViewConstraints()
        setMessageNotReceivedLabelConstraints()
        setResendCodeButtonConstraints()
    }
    
    
    private func setMessageSentLabelConstraints() {
        
        let constraint = [
            messageSentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(152).generateSizeForScreen),
            messageSentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22.5).generateSizeForScreen),
            messageSentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22.5).generateSizeForScreen),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setCodeImageConstraints() {
        
        let constraint = [
            codeImage.topAnchor.constraint(equalTo: messageSentLabel.bottomAnchor, constant: CGFloat(48.1).generateSizeForScreen),
            codeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeImage.widthAnchor.constraint(equalToConstant: CGFloat(58.8).generateSizeForScreen),
            codeImage.heightAnchor.constraint(equalToConstant: CGFloat(87.8).generateSizeForScreen)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    
    private func setInsertCodeLabelConstraints() {
        
        let constraint = [
            insertCodeLabel.topAnchor.constraint(equalTo: codeImage.bottomAnchor, constant: CGFloat(48.1).generateSizeForScreen),
            insertCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setCodeTextFieldConstraints() {
        
        let constraint = [
            code1TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code1TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code2TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code2TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code3TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code3TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code4TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code4TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code5TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code5TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code6TextField.widthAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
            code6TextField.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setTextFieldStackViewConstraints() {
        
        let constraint = [
            textFieldStackView.topAnchor.constraint(equalTo: insertCodeLabel.bottomAnchor, constant: CGFloat(20).generateSizeForScreen),
            textFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22).generateSizeForScreen),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22).generateSizeForScreen),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setMessageNotReceivedLabelConstraints() {
        
        let constraint = [
            messageNotReceivedLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: CGFloat(41.33).generateSizeForScreen),
            messageNotReceivedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setResendCodeButtonConstraints() {
        
        let constraint = [
            resendCodeButton.topAnchor.constraint(equalTo: messageNotReceivedLabel.bottomAnchor, constant: CGFloat(23).generateSizeForScreen),
            resendCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }

}
