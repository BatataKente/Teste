//
//  ConfirmarDadosView.swift
//  Bravve
//
//  Created by user218997 on 29/07/22.
//

import UIKit

class ConfirmDataView: UIViewController {
    
    let sessionManager = SessionManager()
    
    var userToRegister: UserParameters
    
    
    init(_ userToRegister: UserParameters = UserParameters(name: nil,
                                                           phone_number: nil,
                                                           email: nil,
                                                           password: nil)) {
        
        self.userToRegister = userToRegister
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        
        return true
        
    }
    
    private let backgroundImage1 = UIImageView()
    
    private let backgroundImage2 = UIImageView()
    
    //MARK: - Buttons
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtonsWithoutActions([
            IconsBravve.userGray.rawValue,
            IconsBravve.cellGray.rawValue,
            IconsBravve.emailGray.rawValue,
            IconsBravve.padlockGray.rawValue,
            IconsBravve.pencilBlue.rawValue
        ])
        let fourDismissHandler = {(action: UIAction) in
            if let passwordView = self.presentingViewController,
               let emailView = passwordView.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController{
                
                passwordView.view.isHidden = true
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.dismiss(animated: false)
            }
        }
        
        let tripleDismissHandler = {(action: UIAction) in
            if let emailView = self.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController{
                
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.dismiss(animated: false)
            }
        }
        
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
        
        buttons[0].addAction(UIAction(handler: fourDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: tripleDismissHandler), for: .touchUpInside)
        buttons[2].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[3].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
        return buttons
    }()
    //MARK: - Labels
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Bravo! Que tal revisar suas informações, aqui você pode alterá-las!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.text = userToRegister.name
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
//        label.text = userToRegister.phone_number
        return label
    }()
    
    private lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.text = userToRegister.email
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    //MARK: - EditButtons
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
    //MARK: - stackViews
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
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([ label, backgroundImage1, backgroundImage2, stackViewLabels, buttonContinue])
        
        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            
            if let passwordView = self.presentingViewController,
               let emailView = passwordView.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController,
               let loginView = nomeView.presentingViewController {
                
                passwordView.view.isHidden = true
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.view.isHidden = true
                loginView.dismiss(animated: true)
            }
        }
        print("teste", userToRegister)
        defaults()
        addConstraints()
        addTargets()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = 1
        
        let data = UserDefaults.standard
        
        labelName.text = data.string(forKey: "Name")
        labelCell.text = data.string(forKey: "Number")
        labelEmail.text = data.string(forKey: "Mail")
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Funcs
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
    //MARK: - addConstraints
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
    //MARK: - addTargets
    private func addTargets() {
        
        buttonContinue.addTarget(self, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        buttons[0].addTarget(self, action: #selector(actionEditButtonName), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(actionEditButtonPhone), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(actionEditButtonEmail), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(actionButtonPassword), for: .touchUpInside)
        
        editButtonName.addTarget(self, action: #selector(actionEditButtonName), for: .touchUpInside)
        editButtonCell.addTarget(self, action: #selector(actionEditButtonPhone), for: .touchUpInside)
        editButtonEmail.addTarget(self, action: #selector(actionEditButtonEmail), for: .touchUpInside)
        
    }
    
    //MARK: - @objc Funcs
    @objc func actionButtonPassword() {
        let vc = PasswordView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionButtonContinue() {
        self.userToRegister = UserParameters(name: labelName.text, phone_number: "+55\(labelCell.text ?? "")", email: labelEmail.text, password: userToRegister.password)
        
        print("user", self.userToRegister)
        
        sessionManager.postDataWithOpenResponse(endpoint: .users, parameters: self.userToRegister) { (statusCode, error, user: User?) in
            
            guard let userUUID = user?.uuid else {
                print(statusCode)
                print(error?.localizedDescription)
                return
            }
            
            guard let userEmail = user?.email else { return }
            
            guard let userPassword = self.userToRegister.password else { return }
            
            let vc = TokenView(userUUID: userUUID, userEmail: userEmail, userPassword: userPassword)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func actionEditButtonName() {
        let vc = NomeView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionEditButtonPhone() {
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
