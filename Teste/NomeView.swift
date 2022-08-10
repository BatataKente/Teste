//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class NomeView: UIViewController {
    
    init(_ stage: Stage = .first) {
        
        nomeViewModel = NomeViewModel(stage)
        
        super.init(nibName: nil, bundle: nil)
    }
    
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
                                                              IconsBravve.userGray.rawValue,
                                                              IconsBravve.cellBlue.rawValue,
                                                              IconsBravve.cellGray.rawValue,
                                                              IconsBravve.emailBlue.rawValue,
                                                              IconsBravve.emailGray.rawValue,
                                                              IconsBravve.padlockGray.rawValue,
                                                              IconsBravve.hobbiesGray.rawValue])
        
        let userHandler = {(action: UIAction) in

            self.nomeViewModel.makeNameScreen()
        }
        let cellHandler = {(action: UIAction) in

            self.nomeViewModel.makePhoneScreen()
        }
        let emailHandler = {(action: UIAction) in

            self.nomeViewModel.makeEmailScreen()
        }
        let padlockHandler = {(action: UIAction) in
            
            self.presentOtherView(PasswordView())
        }
        let confirmHandler = {(action: UIAction) in
            
            self.presentOtherView(ConfirmDataView())
        }
        
        buttons[1].addAction(UIAction(handler: userHandler),
                             for: .touchUpInside)
        buttons[3].addAction(UIAction(handler: cellHandler),
                             for: .touchUpInside)
        buttons[5].addAction(UIAction(handler: emailHandler),
                             for: .touchUpInside)
        buttons[6].addAction(UIAction(handler: padlockHandler),
                             for: .touchUpInside)
        buttons[7].addAction(UIAction(handler: confirmHandler),
                             for: .touchUpInside)
        
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
        customShaddow.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()
    
    private lazy var viewElements: (rightStackView: UIStackView,
                       leftStackView: UIStackView,
                       rightTextField: UITextField,
                       rightLabel: UILabel,
                       ddiChoseLabel: UILabel,
                       ddisLabel: UILabel,
                       ddisButton: UIButton) = {
        
        let stackVerticalMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let stackHorizontalMargins: CGFloat = CGFloat(15).generateSizeForScreen
        let textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        let font = UIFont(name: FontsBravve.medium.rawValue,
                          size: CGFloat(15).generateSizeForScreen)
        
        let ddisLabel = UILabel()
        ddisLabel.text = "DDI"
        ddisLabel.textColor = textColor
        
        let ddiChoseLabel = UILabel()
        ddiChoseLabel.text = "+55"
        ddiChoseLabel.font = font
        
        let stackView = UIStackView(arrangedSubviews: [ddisLabel, ddiChoseLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let ddisButton = UIButton()
        
        let leftStackView = UIStackView(arrangedSubviews: [stackView, ddisButton])
        leftStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        leftStackView.layer.cornerRadius = 10
        leftStackView.isLayoutMarginsRelativeArrangement = true
        leftStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                   left: stackHorizontalMargins,
                                                   bottom: stackVerticalMargins,
                                                   right: 0)
        
        let rightLabel = UILabel()
        rightLabel.textColor = textColor
        
        let rightTextField = UITextField()
        rightTextField.font = font
        
        let rightStackView = UIStackView(arrangedSubviews: [rightLabel,
                                                            rightTextField])
        rightStackView.spacing = 10
        rightStackView.axis = .vertical
        rightStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        rightStackView.layer.cornerRadius = 8
        rightStackView.isLayoutMarginsRelativeArrangement = true
        rightStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                    left: stackHorizontalMargins,
                                                    bottom: stackVerticalMargins,
                                                    right: stackHorizontalMargins)
        
        return (rightStackView: rightStackView,
                leftStackView: leftStackView,
                rightTextField: rightTextField,
                rightLabel: rightLabel,
                ddiChoseLabel: ddiChoseLabel,
                ddisLabel: ddisLabel,
                ddisButton: ddisButton)
    }()
    
    private lazy var registerStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [viewElements.leftStackView,
                                                               viewElements.rightStackView])
        registerStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        registerStackView.layer.borderWidth = 1
        registerStackView.spacing = 15
        registerStackView.layer.cornerRadius = 8

        return registerStackView
    }()
    
    private let nomeViewModel: NomeViewModel
    
    private func setupView() {
        
        nomeViewModel.delegate = self
        nomeViewModel.makeScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton])
        
        view.createRegisterCustomBar(progressBarButtons: buttons) {_ in
            
            self.nomeViewModel.turnBackScreen()
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
        
        customShaddow.constraintInsideTo(.top, registerStackView)
        customShaddow.constraintInsideTo(.leading, registerStackView)
        customShaddow.constraintInsideTo(.trailing, registerStackView)
        customShaddow.constraintTo(.bottom, registerStackView, Ride.up.rawValue)
        
        viewElements.leftStackView.widthAnchorInSuperview(CGFloat(85).generateSizeForScreen)
        viewElements.ddisButton.widthAnchorInSuperview()
    }
    
    private func setupTargets() {
        
        viewElements.ddisButton.setMenuForButton(nomeViewModel.createDDIs({(action: UIAction) in

            self.viewElements.ddiChoseLabel.text = action.title
            self.viewElements.ddisButton.setTitle(nil, for: .normal)
        }))
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        registerStackView.addGestureRecognizer(stackViewTap)
    }
    
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
        
        viewElements.rightLabel.font = UIFont.systemFont(ofSize: CGFloat(10).generateSizeForScreen)
        viewElements.ddisLabel.font = UIFont.systemFont(ofSize: CGFloat(10).generateSizeForScreen)
        viewElements.ddisLabel.text = "+55"
        
        customShaddow.isHidden = false
        
        viewElements.rightTextField.isHidden = false
        viewElements.ddiChoseLabel.isHidden = false
        viewElements.ddisButton.isEnabled = true
        
        viewElements.rightTextField.addTarget(self,
                                              action: #selector(changeText),
                                              for: .editingChanged)
    }
        
    @objc func changeScreen() {
        
        nomeViewModel.advanceScreen()
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
                     ways: [Bool]) {
        
        viewElements.leftStackView.isHidden = leftStackView
        viewElements.ddiChoseLabel.isHidden = ddiChoseLabel
        viewElements.ddisButton.isEnabled = false
        viewElements.rightTextField.isHidden = true
        
        self.ways[0].isHidden = ways[0]
        self.ways[1].isHidden = ways[1]
        self.ways[2].isHidden = ways[2]
    }
    
    func setFont(font: UIFont) {
        
        viewElements.ddisLabel.font = font
        viewElements.rightLabel.font = font
    }
    
    func setText(rightLabel: String,
                 rightTextField: String,
                 infoLabel: String) {
        
        viewElements.rightLabel.text = rightLabel
        viewElements.rightTextField.text = rightTextField
        viewElements.ddisLabel.text = "DDI"

        self.infoLabel.text = infoLabel
    }
    
    func setProgressBar(buttons: [Bool]) {
        
        self.buttons[0].isHidden = buttons[0]
        self.buttons[1].isHidden = buttons[1]
        self.buttons[2].isHidden = buttons[2]
        self.buttons[3].isHidden = buttons[3]
        self.buttons[4].isHidden = buttons[4]
        self.buttons[5].isHidden = buttons[5]
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
    
    func dismiss() {
        
        self.dismiss(animated: true)
    }
    
    func presentOtherView(_ viewController: UIViewController) {
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false)
    }
}
