//
//  SenhaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class SenhaView: UIViewController{
    
    let backWay: UIImageView = {
        let image = UIImageView()
        image.setWayToDefault("wayPassword")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let goBackButton: UIButton = {
        let button = UIButton()
        button.setToBackButtonDefault("backPink", 32.76)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.setLogoToDefault("logoBlue")
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agora escolha uma senha de sua preferência."
        label.font = UIFont(name: "Ubuntu-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let hidePasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyeClose"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .light
        textField.keyboardType = .namePhonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([backWay, goBackButton, logoImage, stackView, descriptionLabel, passwordTextField, hidePasswordButton, confirmPasswordTextField, hideConfirmPasswordButton, numberCharEllipse])
        
    }
    
    func addConstraints(){
        goBackButton.constraintTo(.left, view.safeAreaLayoutGuide, 32.76)
        goBackButton.constraintTo(.top, view.safeAreaLayoutGuide, 76)
        goBackButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        goBackButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        logoImage.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        logoImage.constraintInsideTo(.top, view.safeAreaLayoutGuide, 65)
        logoImage.heightAnchor.constraint(equalToConstant: 43).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 163.22).isActive = true
        
        stackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.top, logoImage, 40)
        
        descriptionLabel.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        descriptionLabel.heightAnchor.constraint(equalToConstant: 43).isActive = true
        descriptionLabel.constraintOutsideTo(.top, logoImage, 124.5)
        descriptionLabel.constraintInsideTo(.left, view.safeAreaLayoutGuide)
        descriptionLabel.constraintInsideTo(.right, view.safeAreaLayoutGuide)
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        passwordTextField.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        passwordTextField.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        passwordTextField.constraintOutsideTo(.top, descriptionLabel, 30)
        
        hidePasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hidePasswordButton.constraintInsideTo(.top, passwordTextField, 25)
        hidePasswordButton.constraintInsideTo(.right, passwordTextField, -15)
        
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmPasswordTextField.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
        confirmPasswordTextField.constraintInsideTo(.right, view.safeAreaLayoutGuide, -20)
        confirmPasswordTextField.constraintOutsideTo(.top, passwordTextField, 10)
        
        hideConfirmPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideConfirmPasswordButton.constraintInsideTo(.top, confirmPasswordTextField, 25)
        hideConfirmPasswordButton.constraintInsideTo(.right, confirmPasswordTextField, -15)
        
        numberCharEllipse.heightAnchor.constraint(equalToConstant: 4).isActive = true
        numberCharEllipse.widthAnchor.constraint(equalToConstant: 4).isActive = true
        numberCharEllipse.constraintOutsideTo(.top, confirmPasswordTextField, 15)
        numberCharEllipse.constraintInsideTo(.left, view.safeAreaLayoutGuide, 20)
    }
    
}
