//
//  EmailView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit



class EmailView: UIViewController {
    
    var userToRegister: UserParameters
    
    
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: Elements
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let registerButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailBlue.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        let doubleDismissHandler = {(action: UIAction) in
            
            if let phoneView = self.presentingViewController,
               let nomeView = phoneView.presentingViewController {
                
                phoneView.view.isHidden = true
                nomeView.dismiss(animated: false)
            }
        }
        
        let dismissHandler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
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
    //MARK: viewElements
    lazy var viewElements: (rightStackView: UIStackView,
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
        rightTextField.becomeFirstResponder()
        rightTextField.autocapitalizationType = UITextAutocapitalizationType.none
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
    //MARK: StackView
    private lazy var registerStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [viewElements.rightStackView])
        registerStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        registerStackView.layer.borderWidth = 1
        registerStackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
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
    
    private let emailViewModel = EmailViewModel()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupTargets()
        setupConstraints()
        
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if flag == 1{
            self.stackViewTapped()
            self.viewElements.rightTextField.becomeFirstResponder()
            self.viewElements.rightTextField.text = UserDefaults.standard.string(forKey: "Mail")
        }
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: setupView
    private func setupView() {
        
        emailViewModel.delegate = self
        emailViewModel.makeEmailScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            if flag == 0{
                if let phoneView = self.presentingViewController,
                   let nomeView = phoneView.presentingViewController,
                   let loginView = nomeView.presentingViewController {
                    
                    phoneView.view.isHidden = true
                    nomeView.view.isHidden = true
                    loginView.dismiss(animated: true)
                }
                
            }else{
                self.dismiss(animated: true)
            }
        }
        
        view.setToDefaultBackgroundColor()
    }
    //MARK: setupDefaults
    private func setupDefaults() {
        
        registerButton.setToBottomButtonKeyboardDefault()
        ways[2].setWayToDefault(.wayConfirm_1)
        ways[0].setWayToDefault(.wayEmail)
        ways[1].setWayToDefault(.wayCell)
    }
    //MARK: setupConstraints
    private func setupConstraints() {
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        infoLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: CGFloat(250).generateSizeForScreen).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: CGFloat(40).generateSizeForScreen).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: CGFloat(-40).generateSizeForScreen).isActive = true
        
        registerStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,
                                               constant: CGFloat(60).generateSizeForScreen).isActive = true
        registerStackView.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor).isActive = true
        registerStackView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor).isActive = true
        registerStackView.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen).isActive = true
        
        registerFailLabel.topAnchor.constraint(equalTo: registerStackView.bottomAnchor,
                                               constant: CGFloat(5).generateSizeForScreen).isActive = true
        registerFailLabel.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor,
                                                   constant: CGFloat(15).generateSizeForScreen).isActive = true
        
        customShaddow.topAnchor.constraint(equalTo: registerStackView.topAnchor).isActive = true
        customShaddow.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor).isActive = true
        customShaddow.trailingAnchor.constraint(equalTo: registerStackView.trailingAnchor).isActive = true
        customShaddow.bottomAnchor.constraint(equalTo: registerStackView.bottomAnchor,
                                              constant: Ride.up.rawValue).isActive = true
    }
    //MARK: setupTargets
    private func setupTargets() {
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        registerStackView.addGestureRecognizer(stackViewTap)
    }
    //MARK: stackViewTapped
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
        
        registerStackView.layer.borderWidth = 0
        
        viewElements.rightTextField.isHidden = false
        
        viewElements.rightTextField.addTarget(self,
                                              action: #selector(changeText),
                                              for: .editingChanged)
    }
    //MARK: changeScreen
    @objc func changeScreen() {
        
        //        userToRegister.email = viewElements.rightTextField.text ?? ""
        UserDefaults.standard.set(viewElements.rightTextField.text, forKey: "Mail")
        
        if flag == 0{
            let passwordView = PasswordView(userToRegister)
            passwordView.modalPresentationStyle = .fullScreen
            present(passwordView, animated: false)
        }else{
            self.dismiss(animated: true)
        }
    }
    //MARK: changeText
    @objc func changeText(_ sender: UITextField) {
        
        if validateEmail(sender.text ?? "") {
            
            emailViewModel.refreshScreen()
            
            registerButton.addTarget(nil,
                                     action: #selector(changeScreen),
                                     for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {
            
            emailViewModel.makeFailScreen()
            
            registerButton.removeTarget(nil,
                                        action: #selector(changeScreen),
                                        for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        }
    }
}
//MARK: Extension
extension EmailView: EmailViewModelProtocol {
    
    func setIshidden(alertButton: Bool,
                     registerFailLabel: Bool,
                     rightTextField: Bool,
                     ways: [Bool]) {
        
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
