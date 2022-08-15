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
        switch nomeViewModel.stage {
            
            case .first: break
            
            case .second:
            
                let userHandler = {(action: UIAction) in

                    self.nomeViewModel.makeNameScreen()
                }
                let cellHandler = {(action: UIAction) in

                    self.nomeViewModel.makePhoneScreen()
                }
                
                buttons[1].addAction(UIAction(handler: userHandler),
                                     for: .touchUpInside)
                buttons[3].addAction(UIAction(handler: cellHandler),
                                     for: .touchUpInside)
            
            default:
            
                let userHandler = {(action: UIAction) in

                    self.nomeViewModel.makeNameScreen()
                }
                let cellHandler = {(action: UIAction) in

                    self.nomeViewModel.makePhoneScreen()
                }
                let emailHandler = {(action: UIAction) in

                    self.nomeViewModel.makeEmailScreen()
                }
                
                buttons[1].addAction(UIAction(handler: userHandler),
                                     for: .touchUpInside)
                buttons[3].addAction(UIAction(handler: cellHandler),
                                     for: .touchUpInside)
                buttons[5].addAction(UIAction(handler: emailHandler),
                                     for: .touchUpInside)
        }
        
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
        
        let ddisButton = UIButton()
        ddisButton.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue),
                            for: .normal)
        
        let leftStackView = UIStackView(arrangedSubviews: [ddiStackView])
        leftStackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        leftStackView.layer.cornerRadius = 10
        leftStackView.isLayoutMarginsRelativeArrangement = true
        leftStackView.layoutMargins = UIEdgeInsets(top: stackVerticalMargins,
                                                   left: stackHorizontalMargins,
                                                   bottom: stackVerticalMargins,
                                                   right: 0)
        
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
                leftStackView: leftStackView,
                rightTextField: rightTextField,
                rightLabel: rightLabel,
                alertButton: alertButton,
                ddiChoseLabel: ddiChoseLabel,
                ddisLabel: ddisLabel,
                ddisButton: ddisButton)
    }()
    
    private lazy var registerStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [viewElements.leftStackView,
                                                               viewElements.rightStackView])
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
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0,
                                                    width: view.frame.size.width/3,
                                                    height: view.frame.size.height/5))
        
        var ddis = [UIButton]()
        
        let handler = {(action: UIAction) in
            
            scrollView.frame.size = .zero
        }
        
        for ddi in nomeViewModel.createDDIs() {
            
            let button = UIButton()
            button.setTitle(ddi, for: .normal)
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                     for: .normal)
            ddis.append(button)
        }
        scrollView.turnIntoAList(ddis)
        scrollView.delegate = self
        
        return scrollView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        scrollView.frame.size = .zero
    }
    
    private let nomeViewModel: NomeViewModel
    
    private func setupView() {
        
        nomeViewModel.delegate = self
        nomeViewModel.makeScreen()
        
        view.addSubviews(ways + [infoLabel, customShaddow, registerStackView, registerButton, registerFailLabel, viewElements.ddisButton, scrollView])
        
        viewElements.ddisButton.addSubWindow(scrollView, .downRight)
        
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
    
    private func setupTargets() {
        
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
        
        viewElements.rightLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                              size: CGFloat(10).generateSizeForScreen)
        viewElements.ddisLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(10).generateSizeForScreen)
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
        viewElements.alertButton.isHidden = true
        registerFailLabel.isHidden = true
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
        
        dismiss(animated: true)
    }
    
    func presentOtherView(_ viewController: UIViewController) {
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false)
    }
}

extension NomeView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let indicator = scrollView.subviews[scrollView.subviews.count - 1]
        
        indicator.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
}
