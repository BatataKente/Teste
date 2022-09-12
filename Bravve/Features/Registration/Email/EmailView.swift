//
//  EmailView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit



class EmailView: UIViewController {
    
    
    //MARK: prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: - var and let
    var userToRegister: UserParameters
    private let emailViewModel = EmailViewModel()
    
    
    //MARK: - ways
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    //MARK: - registerButton
    private let registerButton = UIButton()
    
    //MARK: - init
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    //MARK: - buttons - ProgressBar
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailBlue.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        let doubleDismissHandler = {(action: UIAction) in
            self.popToViewController(numberOfViewsToBack: 2)
        }
        
        let dismissHandler = {(action: UIAction) in
            self.popToViewController(numberOfViewsToBack: 1)
        }
        
        buttons[0].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
        return buttons
    }()
    
    
    //MARK: - infoLabel
    private let infoLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.light.rawValue,
                                size: CGFloat(16).generateSizeForScreen)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - customShaddow
    private let customShaddow: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        let stack = UIStackView(arrangedSubviews: [viewElements.rightStackView])
        stack.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stack.layer.cornerRadius = 8
        stack.spacing = CGFloat(30).generateSizeForScreen
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - registerFailLabel
    private let registerFailLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                                        size: CGFloat(11).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDefaults()
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Flags.shared.flag == 1{
            self.stackViewTapped()
            self.viewElements.rightTextField.text = UserDefaults.standard.string(forKey: "Mail")
        }
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Navigation Setup
    
    private func popToViewController(numberOfViewsToBack: Int){
        guard let navigationViewControllers = self.navigationController?.viewControllers else {return}
        self.navigationController?.popToViewController(navigationViewControllers[navigationViewControllers.count - (1 + numberOfViewsToBack)], animated: true)
    }
    
    //MARK: setupView
    private func setupView() {
        
        emailViewModel.delegate = self
        emailViewModel.makeEmailScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            if Flags.shared.flag == 0{
                if let phoneView = self.presentingViewController,
                   let nomeView = phoneView.presentingViewController,
                   let loginView = nomeView.presentingViewController {
                    
                    phoneView.view.isHidden = true
                    nomeView.view.isHidden = true
                    loginView.dismiss(animated: true)
                }
                
            }else{
                self.popToViewController(numberOfViewsToBack: 1)
            }
        }
        
        let registerStackTapped = UITapGestureRecognizer(target: self,
                                                      action: #selector(rightStackViewTap))
        registerStackView.addGestureRecognizer(registerStackTapped)
        
        view.setToDefaultBackgroundColor()
    }
    
    
    @objc func rightStackViewTap() {
        stackViewTapped()
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
        
        
        NSLayoutConstraint.activate([
    
            
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 224),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            registerStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 65),
            registerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            registerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            
            registerFailLabel.topAnchor.constraint(equalTo: registerStackView.bottomAnchor, constant: 5),
            registerFailLabel.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor, constant: 15),
            
            
            customShaddow.topAnchor.constraint(equalTo: registerStackView.topAnchor),
            customShaddow.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor),
            customShaddow.trailingAnchor.constraint(equalTo: registerStackView.trailingAnchor),
            customShaddow.bottomAnchor.constraint(equalTo: registerStackView.bottomAnchor, constant: Ride.up.rawValue),
        
        ])
            
    
    }

    //MARK: stackViewTapped
    @objc func stackViewTapped() {
        viewElements.rightLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        viewElements.rightTextField.becomeFirstResponder()
        viewElements.rightTextField.isHidden = false
        
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
        
        if Flags.shared.flag == 0{
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
