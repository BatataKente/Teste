//
//  PhoneView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PhoneView: UIViewController {
    
    var userToRegister: UserParameters
    
    
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
   
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let registerButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellBlue.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        let handler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return buttons
    }()
    //MARK: Elements
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
                                    leftStackView: UIStackView,
                                    rightTextField: UITextField,
                                    rightLabel: UILabel,
                                    alertButton: UIButton,
                                    ddiChoseLabel: UILabel,
                                    ddisLabel: UILabel,
                                    ddisButton: UIButton) = {
        
        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHorizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        let font = UIFont(name: FontsBravve.medium.rawValue,
                          size: CGFloat(15).generateSizeForScreen)
        
        let ddisLabel = UILabel()
        ddisLabel.text = "DDI"
        
        let ddiChoseLabel = UILabel()
        ddiChoseLabel.text = "+55"
        ddiChoseLabel.font = font
        
        let ddiStackView = UIStackView(arrangedSubviews: [ddisLabel, ddiChoseLabel])
        ddiStackView.axis = .vertical
        ddiStackView.spacing = 10
        
        let leftStackView = UIStackView(arrangedSubviews: [ddiStackView])
        leftStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        leftStackView.layer.cornerRadius = 10
        leftStackView.isLayoutMarginsRelativeArrangement = true
        leftStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                   left: stackHorizontalMargins,
                                                   bottom: stackVerticalMargins,
                                                   right: 0)
        
        let ddisButton = UIButton()
        
        let handler = {(action: UIAction) in
            
            self.ddisDropDown.showLikeAWindow(size: CGSize(width: self.registerStackView.frame.size.width*0.25,
                                                           height: CGFloat(144).generateSizeForScreen),
                                              origin: CGPoint(x: self.registerStackView.frame.minX,
                                                              y: self.registerStackView.frame.maxY))
        }
        
        ddisButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        ddisButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                            for: .normal)
        
        let rightLabel = UILabel()
        
        let rightTextField = UITextField()
        rightTextField.font = font
        rightTextField.becomeFirstResponder()
        
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
                leftStackView: leftStackView,
                rightTextField: rightTextField,
                rightLabel: rightLabel,
                alertButton: alertButton,
                ddiChoseLabel: ddiChoseLabel,
                ddisLabel: ddisLabel,
                ddisButton: ddisButton)
    }()
    //MARK: dropDown
    private lazy var ddisDropDown: UIScrollView = {
        
        let ddisDropDown = UIScrollView()
        var ddis = [UIButton]()
        
        for ddi in phoneViewModel.createDDIs() {
            
            let button = UIButton()
            button.setTitle(ddi, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                 for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                             size: CGFloat(15).generateSizeForScreen)
            
            let handler = {(action: UIAction) in
                
                self.viewElements.ddiChoseLabel.text = button.currentTitle
                ddisDropDown.frame.size = .zero
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            button.titleLabel?.constraintInsideTo(.leading, button,
                                                  CGFloat(15).generateSizeForScreen)
            
            ddis.append(button)
        }
        ddisDropDown.turnIntoAList(ddis)
        ddisDropDown.delegate = self
        
        return ddisDropDown
    }()
    //MARK: StackView
    private lazy var registerStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [viewElements.leftStackView,
                                                               viewElements.rightStackView])
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
    //MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        ddisDropDown.frame.size = .zero
    }
    
    private let phoneViewModel = PhoneViewModel()
    
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
            self.viewElements.rightTextField.text = UserDefaults.standard.string(forKey: "Number")
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
        
        phoneViewModel.delegate = self
        phoneViewModel.makePhoneScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel, viewElements.ddisButton, ddisDropDown])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            if flag == 0{
                if let nomeView = self.presentingViewController,
                   let loginView = nomeView.presentingViewController {
                    
                    nomeView.view.isHidden = true
                    loginView.dismiss(animated: true)
                }
            } else{
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
        
        viewElements.ddisButton.constraintInsideTo(.centerY, registerStackView)
        viewElements.ddisButton.constraintInsideTo(.leading, registerStackView, CGFloat(50).generateSizeForScreen)
        
        registerFailLabel.constraintOutsideTo(.top, registerStackView,
                                              CGFloat(5).generateSizeForScreen)
        registerFailLabel.constraintInsideTo(.leading, registerStackView,
                                             CGFloat(15).generateSizeForScreen)
        
        customShaddow.constraintInsideTo(.top, registerStackView)
        customShaddow.constraintInsideTo(.leading, registerStackView)
        customShaddow.constraintInsideTo(.trailing, registerStackView)
        customShaddow.constraintTo(.bottom, registerStackView, Ride.up.rawValue)
        
        viewElements.leftStackView.widthAnchorInSuperview(CGFloat(50).generateSizeForScreen)
        viewElements.ddisButton.widthAnchorInSuperview(30)
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
        
        viewElements.leftStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                                left: stackHorizontalMargins,
                                                                bottom: stackVerticalMargins,
                                                                right: 0)
        
        viewElements.rightStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                                 left: stackHorizontalMargins,
                                                                 bottom: stackVerticalMargins,
                                                                 right: stackHorizontalMargins)
        
        viewElements.rightLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                              size: CGFloat(10).generateSizeForScreen)
        viewElements.ddisLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(10).generateSizeForScreen)
        viewElements.ddisLabel.text = "+55"
        
        customShaddow.isHidden = false
        
        registerStackView.layer.borderWidth = 0
        
        viewElements.rightTextField.isHidden = false
        viewElements.ddiChoseLabel.isHidden = false
        viewElements.ddisButton.isEnabled = true
        
        viewElements.rightTextField.addTarget(self,
                                              action: #selector(changeText),
                                              for: .editingChanged)
    }
    //MARK: changeScreen
    @objc func changeScreen() {
        
//        userToRegister.phone_number = viewElements.rightTextField.text ?? ""
        UserDefaults.standard.set(viewElements.rightTextField.text, forKey: "Number")
        
        if flag == 0{
        let emailView = EmailView(userToRegister)
        emailView.modalPresentationStyle = .fullScreen
        present(emailView, animated: false)
        } else{
            
            
            self.dismiss(animated: true)
        }
    }
    //MARK: changeText
    @objc func changeText(_ sender: UITextField) {
        
        if validateCellPhone(sender.text ?? "") {
            
            phoneViewModel.refreshScreen()
            
            registerButton.addTarget(nil,
                                     action: #selector(changeScreen),
                                     for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {
            
            phoneViewModel.makeFailScreen()
            
            registerButton.removeTarget(nil,
                                        action: #selector(changeScreen),
                                        for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: ColorsBravve.reservedCancel.rawValue)
        }
    }
}
//MARK: Extension
extension PhoneView: PhoneViewModelProtocol {
    
    func setIshidden(leftStackView: Bool,
                     ddiChoseLabel: Bool,
                     alertButton: Bool,
                     registerFailLabel: Bool,
                     rightTextField: Bool,
                     ways: [Bool]) {
        
        viewElements.leftStackView.isHidden = leftStackView
        viewElements.ddiChoseLabel.isHidden = ddiChoseLabel
        viewElements.alertButton.isHidden = alertButton
        self.registerFailLabel.isHidden = registerFailLabel
        viewElements.ddisButton.isEnabled = false
        viewElements.rightTextField.isHidden = rightTextField
        
        self.ways[0].isHidden = ways[0]
        self.ways[1].isHidden = ways[1]
        self.ways[2].isHidden = ways[2]
    }
    
    func setFont(font: UIFont) {
        
        viewElements.ddisLabel.font = font
        viewElements.rightLabel.font = font
    }
    
    func setColors(textColor: UIColor?,
                   customShaddowbackgroundColor: UIColor?) {
        
        viewElements.rightLabel.textColor = textColor
        viewElements.ddisLabel.textColor = textColor
        
        customShaddow.backgroundColor = customShaddowbackgroundColor
    }
    
    func setText(rightLabel: String,
                 rightTextField: String,
                 infoLabel: String,
                 registerFailLabel: String) {
        
        viewElements.rightLabel.text = rightLabel
        viewElements.rightTextField.text = rightTextField
        viewElements.ddisLabel.text = "DDI"
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
//MARK: scrollViewDelegate
extension PhoneView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
