//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class NomeView: UIViewController {
    
    init(_ userToRegister: UserParameters = UserParameters(name: "",
                                                           phone_number: "",
                                                           email: "",
                                                           password: "")) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    var userToRegister: UserParameters
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupTargets()
        setupConstraints()
        
        super.viewDidLoad()
    }
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let registerButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userBlue.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        return buttons
    }()
    
    private let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                size: CGFloat(16).generateSizeForScreen)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        
        return infoLabel
    }()
    
    private let customShaddow: UIView = {
        
        let customShaddow = UIView()
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()
    
    private lazy var viewElements: (rightStackView: UIStackView,
                                    rightTextField: UITextField,
                                    rightLabel: UILabel,
                                    alertButton: UIButton) = {
        
        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHorizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        let font = UIFont(name: FontsBravve.medium.rawValue,
                          size: CGFloat(15).generateSizeForScreen)
        
        let rightLabel = UILabel()
        
        let rightTextField = UITextField()
        rightTextField.font = font
        
        let stackView = UIStackView(arrangedSubviews: [rightLabel,
                                                       rightTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        let alertButton = UIButton()
        alertButton.setImage(UIImage(named: ButtonsBravve.alert.rawValue),
                             for: .normal)
        
        let rightStackView = UIStackView(arrangedSubviews: [stackView])
        rightStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        rightStackView.distribution = .fillProportionally
        rightStackView.layer.cornerRadius = 8
        rightStackView.isLayoutMarginsRelativeArrangement = true
        rightStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                    left: stackHorizontalMargins,
                                                    bottom: stackVerticalMargins,
                                                    right: stackHorizontalMargins)
        
        rightStackView.addSubview(alertButton)
        
        alertButton.constraintInsideTo(.centerY, rightStackView)
        alertButton.constraintInsideTo(.trailing, rightStackView,
                                       stackHorizontalMargins)
        alertButton.heightAnchorInSuperview(CGFloat(16.5).generateSizeForScreen)
        alertButton.constraintOutsideTo(.width, alertButton)
        
        return (rightStackView: rightStackView,
                rightTextField: rightTextField,
                rightLabel: rightLabel,
                alertButton: alertButton)
    }()
    
    private lazy var registerStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [viewElements.rightStackView])
        registerStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        registerStackView.layer.borderWidth = 1
        registerStackView.layer.cornerRadius = 8
        registerStackView.spacing = CGFloat(30).generateSizeForScreen

        return registerStackView
    }()
    
    private let registerFailLabel: UILabel = {
        
        let registerFailLabel = UILabel()
        registerFailLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                        size: CGFloat(11).generateSizeForScreen)
        registerFailLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        
        return registerFailLabel
    }()
    
    private let nomeViewModel = NomeViewModel()
    
    private func setupView() {
        
        nomeViewModel.delegate = self
        nomeViewModel.makeNameScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            self.dismiss(animated: true)
        }
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupDefaults() {
        
        registerButton.setToBottomButtonKeyboardDefault()
        ways[2].setWayToDefault(.wayConfirm_1)
        ways[0].setWayToDefault(.wayEmail)
        ways[1].setWayToDefault(.wayCell)
    }
    
    private func setupConstraints() {
        
        infoLabel.constraintInsideTo(.top,
                                     view,
                                     CGFloat(250).generateSizeForScreen)
        infoLabel.constraintInsideTo(.leading,
                                     view.safeAreaLayoutGuide,
                                     CGFloat(40).generateSizeForScreen)
        infoLabel.constraintInsideTo(.trailing,
                                     view.safeAreaLayoutGuide,
                                     CGFloat(40).generateSizeForScreen)
        
        registerStackView.constraintOutsideTo(.top,
                                              infoLabel,
                                              CGFloat(60).generateSizeForScreen)
        registerStackView.constraintInsideTo(.leading, infoLabel)
        registerStackView.constraintInsideTo(.trailing, infoLabel)
        registerStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        registerFailLabel.constraintOutsideTo(.top, registerStackView,
                                              CGFloat(5).generateSizeForScreen)
        registerFailLabel.constraintInsideTo(.leading, registerStackView,
                                             CGFloat(15).generateSizeForScreen)
        
        customShaddow.constraintInsideTo(.top, registerStackView)
        customShaddow.constraintInsideTo(.leading, registerStackView)
        customShaddow.constraintInsideTo(.trailing, registerStackView)
        customShaddow.constraintTo(.bottom, registerStackView, Ride.up.rawValue)
    }
    
    private func setupTargets() {
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        registerStackView.addGestureRecognizer(stackViewTap)
    }
    
    @objc func stackViewTapped() {
        
        let stackVerticalMargins: CGFloat = CGFloat(10).generateSizeForScreen
        let stackHorizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        
        viewElements.rightStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                                left: stackHorizontalMargins,
                                                                bottom: stackVerticalMargins,
                                                                right: stackHorizontalMargins)
        
        viewElements.rightLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                              size: CGFloat(10).generateSizeForScreen)
        
        customShaddow.isHidden = false
        
        viewElements.rightTextField.isHidden = false
        
        viewElements.rightTextField.addTarget(self,
                                              action: #selector(changeText),
                                              for: .editingChanged)
    }
        
    @objc func changeScreen() {
        
        if validateName(viewElements.rightTextField.text ?? "") {
            
            userToRegister.name = viewElements.rightTextField.text ?? ""
            
//            let phoneView = PhoneView(userToRegister)
            let phoneView = PhoneView()
            phoneView.modalPresentationStyle = .fullScreen
            present(phoneView, animated: false)
        }
        else {
            
            nomeViewModel.makeFailScreen()
        }
    }
    
    @objc func changeText(_ sender: UITextField) {
        
        if sender.text != "" {

            registerButton.addTarget(nil,
                                     action: #selector(changeScreen),
                                     for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {

            registerButton.removeTarget(nil,
                                        action: #selector(changeScreen),
                                        for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        }
    }
}

extension NomeView: NomeViewModelProtocol {
    
    func setIshidden(leftStackView: Bool,
                     ddiChoseLabel: Bool,
                     alertButton: Bool,
                     registerFailLabel: Bool,
                     rightTextField: Bool,
                     ways: [Bool])  {
        
        viewElements.alertButton.isHidden = alertButton
        self.registerFailLabel.isHidden = registerFailLabel
        viewElements.rightTextField.isHidden = rightTextField
        
        self.ways[0].isHidden = ways[0]
        self.ways[1].isHidden = ways[1]
        self.ways[2].isHidden = ways[2]
    }
    
    func setFont(font: UIFont) {
        
        viewElements.rightLabel.font = font
    }
    
    func setColors(textColor: UIColor?,
                   customShaddowbackgroundColor: UIColor?) {
        
        viewElements.rightLabel.textColor = textColor
        
        customShaddow.backgroundColor = customShaddowbackgroundColor
    }
    
    func setText(rightLabel: String,
                 rightTextField: String,
                 infoLabel: String,
                 registerFailLabel: String) {
        
        viewElements.rightLabel.text = rightLabel
        viewElements.rightTextField.text = rightTextField
        self.registerFailLabel.text = registerFailLabel

        self.infoLabel.text = infoLabel
    }
    
    func freezeButton() {
        
        registerButton.removeTarget(nil,
                                    action: #selector(changeScreen),
                                    for: .touchUpInside)
        registerButton.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        
        viewElements.rightTextField.keyboardType = keyboardType
    }
}
