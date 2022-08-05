//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class NomeView: UIViewController {
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let registerButton = UIButton()

    var progressBarStackView = UIStackView()
    
    private lazy var buttons: [UIButton] = {

        let buttons = createProgressBarButtons([IconsBravve.userBlue.rawValue,
                                                IconsBravve.userGray.rawValue,
                                                IconsBravve.cellBlue.rawValue,
                                                IconsBravve.cellGray.rawValue,
                                                IconsBravve.emailBlue.rawValue,
                                                IconsBravve.emailGray.rawValue,
                                                IconsBravve.padlockGray.rawValue,
                                                IconsBravve.hobbiesGray.rawValue])

        buttons[1].removeTarget(nil, action: nil, for: .allTouchEvents)
        buttons[3].removeTarget(nil, action: nil, for: .allTouchEvents)
        buttons[5].removeTarget(nil, action: nil, for: .allTouchEvents)

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
        
        let stackMargins: CGFloat = CGFloat(20).generateSizeForScreen
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        let font = UIFont(name: FontsBravve.medium.rawValue,
                          size: CGFloat(15).generateSizeForScreen)
        
        let ddisLabel = UILabel()
        ddisLabel.text = "+55"
        ddisLabel.font = smallFont
        
        let ddiChoseLabel = UILabel()
        ddiChoseLabel.text = "+55"
        ddiChoseLabel.font = font
        
        let stackView = UIStackView(arrangedSubviews: [ddisLabel, ddiChoseLabel])
        stackView.axis = .vertical
        
        let ddisButton = UIButton()
        
        let leftStackView = UIStackView(arrangedSubviews: [stackView, ddisButton])
        leftStackView.backgroundColor = .white
        leftStackView.layer.cornerRadius = 10
        leftStackView.isLayoutMarginsRelativeArrangement = true
        leftStackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                   left: stackMargins,
                                                   bottom: stackMargins,
                                                   right: 0)
        
        let rightLabel = UILabel()
        rightLabel.font = smallFont
        
        let rightTextField = UITextField()
        rightTextField.font = font
        
        let rightStackView = UIStackView(arrangedSubviews: [rightLabel,
                                                            rightTextField])
        rightStackView.spacing = 10
        rightStackView.axis = .vertical
        rightStackView.backgroundColor = .white
        rightStackView.layer.cornerRadius = 8
        rightStackView.isLayoutMarginsRelativeArrangement = true
        rightStackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                    left: stackMargins,
                                                    bottom: stackMargins,
                                                    right: stackMargins)
        
        
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
        registerStackView.backgroundColor = .white
        registerStackView.layer.borderWidth = 1
        registerStackView.spacing = 15
        registerStackView.layer.cornerRadius = 8

        return registerStackView
    }()
    
    private let nomeViewModel: NomeViewModel
    
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
                                     view.safeAreaLayoutGuide,
                                     view.frame.size.height*0.3)
        infoLabel.constraintInsideTo(.leading,
                                     view.safeAreaLayoutGuide, 40)
        infoLabel.constraintInsideTo(.trailing,
                                     view.safeAreaLayoutGuide, 40)
        
        registerStackView.constraintInsideTo(.centerY,
                                             view.safeAreaLayoutGuide,
                                             view.frame.size.height*0.05)
        registerStackView.constraintInsideTo(.leading, infoLabel)
        registerStackView.constraintInsideTo(.trailing, infoLabel)
        
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
        
        buttons[1].addTarget(self,
                             action: #selector(progressBarAction),
                             for: .touchUpInside)
        buttons[3].addTarget(self,
                             action: #selector(progressBarAction),
                             for: .touchUpInside)
        buttons[5].addTarget(self,
                             action: #selector(progressBarAction),
                             for: .touchUpInside)
    }
    
    @objc func stackViewTapped() {
        
        viewElements.rightLabel.font = UIFont.systemFont(ofSize: 11)
        viewElements.ddisLabel.font = UIFont.systemFont(ofSize: 11)
        
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
    
    @objc func progressBarAction(_ sender: UIButton) {
        
        nomeViewModel.changeScreenWithProgressBar(sender)
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
        registerButton.backgroundColor = UIColor(named: "reservedCancel")
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        
        viewElements.rightTextField.keyboardType = keyboardType
    }
}
