//
//  PhoneView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import Alamofire

class PhoneView: UIViewController {
    
    
    //MARK: - var and let
    var userToRegister: UserParameters
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let registerButton = UIButton()
    
    
    //MARK: - init
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    //MARK: - progressBar
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellBlue.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.pencilGray.rawValue])
        
        let handler = {(action: UIAction) in
            self.popViewController()
        }
        
        buttons[0].addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return buttons
    }()
    
  
    //MARK: Elements
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.light.rawValue,size: 16)
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
                            leftStackView: UIStackView,
                            rightTextField: UITextField,
                            rightLabel: UILabel,
                            alertButton: UIButton,
                            ddiChoseLabel: UILabel,
                            ddisLabel: UILabel,
                            ddisButton: UIButton) = {
        
        let stackVerticalMargins: CGFloat = 20
        let stackHorizontalMargins: CGFloat = 15
        let font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        
        
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
        ddisButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let handler = {(action: UIAction) in
            
            self.ddisDropDown.showLikeAWindow(size: CGSize(width: self.registerStackView.frame.size.width*0.25,
                                                           height: CGFloat(144).generateSizeForScreen),
                                              origin: CGPoint(x: self.registerStackView.frame.minX,
                                                              y: self.registerStackView.frame.maxY))
        }
        
        ddisButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        ddisButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                            for: .normal)
        ddisButton.translatesAutoresizingMaskIntoConstraints = false
        
        
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
    
    
    //MARK: ddisDropDown
    private lazy var ddisDropDown: UIScrollView = {
        
        let ddisDropDown = UIScrollView()
        var ddis = [UIButton]()
        
        for ddi in phoneViewModel.createDDIs() {
            
            let button = UIButton()
            button.setTitle(ddi, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                 for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
            
            let handler = {(action: UIAction) in
                
                self.viewElements.ddiChoseLabel.text = button.currentTitle
                ddisDropDown.frame.size = .zero
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            button.titleLabel?.constraintInsideTo(.leading, button, 15)
            
            ddis.append(button)
        }
        ddisDropDown.turnIntoAList(ddis)
        ddisDropDown.delegate = self
        
        return ddisDropDown
    }()
    
    
    //MARK: registerStackView
    private lazy var registerStackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [viewElements.leftStackView,
                                                   viewElements.rightStackView])
        stack.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stack.layer.cornerRadius = 8
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - registerFailLabel
    private let registerFailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 11)
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        ddisDropDown.frame.size = .zero
    }
    
    private let phoneViewModel = PhoneViewModel()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        
        super.viewDidLoad()
        
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        registerStackView.addGestureRecognizer(stackViewTap)
        
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Flags.shared.flag == 1{
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
    //MARK: - Navigation Setup
    
    private func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: setupView
    private func setupView() {
        
        phoneViewModel.delegate = self
        phoneViewModel.makePhoneScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel, viewElements.ddisButton, ddisDropDown])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            if Flags.shared.flag == 0{
                if let nomeView = self.presentingViewController,
                   let loginView = nomeView.presentingViewController {
                    
                    nomeView.view.isHidden = true
                    loginView.dismiss(animated: true)
                }
            } else{
                self.popViewController()
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
        
        ways[0].translatesAutoresizingMaskIntoConstraints = false
        ways[1].translatesAutoresizingMaskIntoConstraints = false
        ways[2].translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
            
            registerStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 60),
            registerStackView.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            registerStackView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            registerStackView.heightAnchor.constraint(equalToConstant: 60),
            
            viewElements.ddisButton.centerYAnchor.constraint(equalTo: registerStackView.centerYAnchor),
            viewElements.ddisButton.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor, constant: 50),
            
            registerFailLabel.topAnchor.constraint(equalTo: registerStackView.bottomAnchor, constant: 5),
            registerFailLabel.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor, constant: 15),
            
            customShaddow.topAnchor.constraint(equalTo: registerStackView.topAnchor),
            customShaddow.leadingAnchor.constraint(equalTo: registerStackView.leadingAnchor),
            customShaddow.trailingAnchor.constraint(equalTo: registerStackView.trailingAnchor),
            customShaddow.bottomAnchor.constraint(equalTo: registerStackView.bottomAnchor,
                                                  constant: Ride.up.rawValue),
            
            viewElements.leftStackView.widthAnchor.constraint(equalToConstant: 50),
            viewElements.ddisButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])
        
        
    }
    
    
    //MARK: stackViewTapped
    @objc func stackViewTapped() {
        viewElements.rightLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        viewElements.rightTextField.becomeFirstResponder()
        viewElements.rightTextField.isHidden = false
        
        
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
        
        if Flags.shared.flag == 0{
            let emailView = EmailView(userToRegister)
            emailView.modalPresentationStyle = .fullScreen
            present(emailView, animated: false)
        } else{
            self.popViewController()
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

