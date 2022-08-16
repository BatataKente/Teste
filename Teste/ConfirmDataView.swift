//
//  ConfirmarDadosView.swift
//  Bravve
//
//  Created by user218997 on 29/07/22.
//

import UIKit

class ConfirmDataView: UIViewController {
    
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
    
    override var prefersStatusBarHidden: Bool {

            return true

        }
    
    private let backgroundImage1 = UIImageView()
    
    private let backgroundImage2 = UIImageView()
    
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtons([
            IconsBravve.userGray.rawValue,
            IconsBravve.cellGray.rawValue,
            IconsBravve.emailGray.rawValue,
            IconsBravve.padlockGray.rawValue,
            IconsBravve.pencilBlue.rawValue
        ])
        buttons[4].setTitle(" Confirmação", for: .normal)
        return buttons
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Bravo! Que tal revisar suas informações, aqui você pode alterá-las!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        return label
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "Ana Maria Silva"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "11 99686 2647"
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "teste@bravve.com.br"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var editButtonName: UIButton = {
        let button = myButton()
        return button
    }()
    private lazy var editButtonCell: UIButton = {
        let button = myButton()
        return button
    }()
    private lazy var editButtonEmail: UIButton = {
        let button = myButton()
        return button
    }()
    
    private lazy var stackViewName: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelName, editButtonName])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        return stackView
    }()
    
    private lazy var stackViewCell: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelCell, editButtonCell])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        return stackView
    }()
    
    private lazy var stackViewEmail: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelEmail, editButtonEmail])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        return stackView
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewName, stackViewCell, stackViewEmail])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let buttonContinue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
         
        view.addSubviews([ label, backgroundImage1, backgroundImage2, stackViewLabels, buttonContinue])
        
        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            let vc = PasswordView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        defaults()
        addConstraints()
        addTargets()
        
    }
    
    func myButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.edit_blue.rawValue), for: .normal)
        return button
    }
    
    private func defaults() {
        
        buttonContinue.setToBottomButtonKeyboardDefault("Continuar", backgroundColor: .buttonPink)
        backgroundImage1.setWayToDefault(.wayConfirm_2)
        backgroundImage2.setWayToDefault(.wayConfirm_1)
        
    }
    
    private func addConstraints() {
        
        label.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-22).generateSizeForScreen)
        label.constraintInsideTo(.top, view, CGFloat(240).generateSizeForScreen)
        
        stackViewName.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewCell.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewEmail.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        editButtonName.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButtonCell.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButtonEmail.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        stackViewLabels.constraintInsideTo(.leading, label)
        stackViewLabels.constraintInsideTo(.trailing, label)
        stackViewLabels.constraintOutsideTo(.top, label, CGFloat(60).generateSizeForScreen)
    
    }
    
    private func addTargets() {
        
        buttonContinue.addTarget(self, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        editButtonName.addTarget(self, action: #selector(actionEditButtonName), for: .touchUpInside)
        editButtonCell.addTarget(self, action: #selector(actionEditButtonCell), for: .touchUpInside)
        editButtonEmail.addTarget(self, action: #selector(actionEditButtonEmail), for: .touchUpInside)
        
    }
    
    
    @objc func actionButtonContinue() {
        let vc = FotoView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionEditButtonName() {
        let vc = NomeView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionEditButtonCell() {
        let vc = PhoneView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionEditButtonEmail() {
        let vc = EmailView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
