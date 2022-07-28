//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class NomeView: UIViewController {
    
    private let ways = [UIImageView(), UIImageView(), UIImageView()]
    
    private let backButton = UIButton()
    
    private let bravveIcon = UIImageView()
    
    private let registerButton = UIButton()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons(["userBlue",
                                                "cellGray",
                                                "emailGray",
                                                "padlockGray",
                                                "hobbiesGray"])
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 7
        
        return (stack: stackView,
                buttons: buttons)
    }()
    
    private let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        
        return infoLabel
    }()
    
    private let customShaddow: UIView = {
        
        let customShaddow = UIView()
        customShaddow.backgroundColor = .blue
        customShaddow.layer.cornerRadius = 8
        customShaddow.isHidden = true
        
        return customShaddow
    }()
    
    private let viewElements: (rightStackView: UIStackView,
                       leftStackView: UIStackView,
                       rightTextField: UITextField,
                       rightLabel: UILabel,
                       ddiChoseLabel: UILabel,
                       ddisLabel: UILabel,
                       ddisButton: UIButton) = {
        
        let stackMargins: CGFloat = 10
        
        let ddisLabel = UILabel()
        ddisLabel.text = "+55"
        
        let ddiChoseLabel = UILabel()
        ddiChoseLabel.text = "+55"
        ddiChoseLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
        
        let stackView = UIStackView(arrangedSubviews: [ddisLabel, ddiChoseLabel])
        stackView.spacing = 10
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
        
        let rightTextField = UITextField()
        rightTextField.font = UIFont(name: "Ubuntu-Medium", size: 16)
        
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
    
    private let registerStackView: UIStackView = {

        let registerStackView = UIStackView()
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
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupConstraints()
        
        super.viewDidAppear(animated)
    }
    
    private func setupView() {
        
        nomeViewModel.delegate = self
        nomeViewModel.makeScreen()
        
        view.addSubviews(ways + [bravveIcon, backButton, progressBarStackView.stack, infoLabel, customShaddow, registerStackView, registerButton])
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupDefaults() {
        
        registerButton.setToBottomButtonKeyboardDefault()
        bravveIcon.setLogoToDefault()
        backButton.setToBackButtonDefault("backButtonPink")
        ways[0].setWayToDefault("way3")
        ways[1].setWayToDefault("way1")
        ways[2].setWayToDefault("way4")
    }
    
    private func setupConstraints() {
        
        progressBarStackView.stack.constraintOutsideTo(.top, bravveIcon, 50)
        progressBarStackView.stack.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.stack.heightAnchorInSuperview()
        
        infoLabel.constraintOutsideTo(.top, progressBarStackView.stack, 50)
        infoLabel.constraintInsideTo(.leading, view.safeAreaLayoutGuide, 40)
        infoLabel.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, 40)
        
        registerStackView.constraintInsideTo(.centerY, view.safeAreaLayoutGuide, 50)
        registerStackView.constraintInsideTo(.leading, infoLabel)
        registerStackView.constraintInsideTo(.trailing, infoLabel)
        registerStackView.heightAnchorInSuperview(60)
        
        customShaddow.constraintInsideTo(.top, registerStackView)
        customShaddow.constraintInsideTo(.leading, registerStackView)
        customShaddow.constraintInsideTo(.trailing, registerStackView)
        customShaddow.constraintTo(.bottom, registerStackView, 1)
        
        viewElements.leftStackView.widthAnchorInSuperview(80)
        viewElements.ddisButton.widthAnchorInSuperview()
    }
    
    private func setupTargets() {
        
        viewElements.ddisButton.setMenuForButton(nomeViewModel.createDDIs({(action: UIAction) in

            self.viewElements.ddiChoseLabel.text = action.title
        }))
        
        backButton.addTarget(self,
                             action: #selector(back),
                             for: .touchUpInside)
        progressBarStackView.buttons[0].addTarget(self,
                                                    action: #selector(progressBarAction),
                                                    for: .touchUpInside)
        progressBarStackView.buttons[1].addTarget(self,
                                             action: #selector(progressBarAction),
                                             for: .touchUpInside)
        progressBarStackView.buttons[2].addTarget(self,
                                             action: #selector(progressBarAction),
                                             for: .touchUpInside)
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        registerStackView.addGestureRecognizer(stackViewTap)
        
        registerStackView.addArrangedSubview(viewElements.leftStackView)
        registerStackView.addArrangedSubview(viewElements.rightStackView)
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
    
    @objc func back() {
        
        nomeViewModel.turnBackScreen()
    }
    
    @objc func changeText(_ sender: UITextField) {
        
        if sender.text != "" {

            registerButton.addTarget(nil,
                                     action: #selector(changeScreen),
                                     for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: "PinkBravve")
        }
        else {

            registerButton.removeTarget(nil,
                                        action: #selector(changeScreen),
                                        for: .touchUpInside)
            registerButton.backgroundColor = UIColor(named: "GrayBravve")
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

        self.infoLabel.setToDefault(text: infoLabel)
    }
    
    func setProgressBar(personalDataTitle: String,
                        personalDataImage: String,
                        phoneNumberTitle: String,
                        phoneNumberImage: String,
                        emailTitle: String,
                        emailImage: String) {
        
        progressBarStackView.buttons[0].configuration?.title = personalDataTitle
        progressBarStackView.buttons[0].configuration?.image = UIImage(named: personalDataImage)
        
        progressBarStackView.buttons[1].configuration?.title = phoneNumberTitle
        progressBarStackView.buttons[1].configuration?.image = UIImage(named: phoneNumberImage)
        
        progressBarStackView.buttons[2].configuration?.title = emailTitle
        progressBarStackView.buttons[2].configuration?.image = UIImage(named: emailImage)
    }
    
    func freezeButton() {
        
        registerButton.removeTarget(nil,
                                    action: #selector(changeScreen),
                                    for: .touchUpInside)
        registerButton.backgroundColor = UIColor(named: "GrayBravve")
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        
        viewElements.rightTextField.keyboardType = keyboardType
    }
}
