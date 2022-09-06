//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit



class NomeView: UIViewController {
    
    var userToRegister: UserParameters
    
    
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: Elements
    
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
    //MARK: - UILabels
    private let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                size: CGFloat(16).generateSizeForScreen)
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        
        return infoLabel
    }()
    
    private let registerFailLabel: UILabel = {
        
        let registerFailLabel = UILabel()
        registerFailLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                        size: CGFloat(11).generateSizeForScreen)
        registerFailLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        
        return registerFailLabel
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
        rightTextField.autocapitalizationType = .sentences
        
        
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
        registerStackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        registerStackView.layer.cornerRadius = 8
        registerStackView.spacing = CGFloat(30).generateSizeForScreen
        
        return registerStackView
    }()
    
   
    
    private let nomeViewModel = NomeViewModel()
    
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
            self.viewElements.rightTextField.text = UserDefaults.standard.string(forKey: "Name")
        }
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    
    //MARK: setupView
    private func setupView() {
        
        nomeViewModel.delegate = self
        nomeViewModel.makeNameScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            self.navigationController?.popViewController(animated: true)
            print(self.navigationController?.viewControllers)
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
    //MARK: setupTarget
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
        UserDefaults.standard.set(viewElements.rightTextField.text, forKey: "Name")
        
        if flag == 0{
        let phoneView = PhoneView(userToRegister)
            self.navigationController?.pushViewController(phoneView, animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: changeText
    @objc func changeText(_ sender: UITextField) {
        
        if validateName(sender.text ?? "") {
            nomeViewModel.refreshScreen()
            
            registerButton.addTarget(nil,
                                     action: #selector(changeScreen),
                                     for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {
            
            nomeViewModel.makeFailScreen()
            registerButton.removeTarget(nil,
                                        action: #selector(changeScreen),
                                        for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        }
    }
}
//MARK: Extension
extension NomeView: NomeViewModelProtocol {
    
    func setIshidden(alertButton: Bool,
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
