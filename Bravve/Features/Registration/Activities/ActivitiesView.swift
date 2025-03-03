//
//  AtividadesView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ActivitiesView: UIViewController {
    
    let backgroundImage = UIImageView()
    
    let continueButton = UIButton()
    
    private let registerButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.photoGray.rawValue,
                                                      IconsBravve.noteGray.rawValue,
                                                      IconsBravve.hobbiesGray.rawValue,
                                                      IconsBravve.activitiesBlue.rawValue])
        
        let tripleDismissHandler = {(action: UIAction) in
            if let hobbiesView = self.presentingViewController,
               let professionView = hobbiesView.presentingViewController,
               let photoView = professionView.presentingViewController{
                
                hobbiesView.view.isHidden = true
                professionView.view.isHidden = true
                photoView.dismiss(animated: false)
            }
        }
        
        let doubleDismissHandler = {(action: UIAction) in
            
            if let professionView = self.presentingViewController,
               let photoView = professionView.presentingViewController {
                
                professionView.view.isHidden = true
                photoView.dismiss(animated: false)
            }
        }
        
        let dismissHandler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: tripleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[2].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        return buttons
    }()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        return stackView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let begginingText = "Sobre o que você gosta de conversar? Escolha\no que mais te interessa.\n"
        let normalAttrs = [NSMutableAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(16).generateSizeForScreen)]
        let labelattributedString = NSMutableAttributedString(string: begginingText, attributes: normalAttrs as [NSAttributedString.Key : Any])
        let smallAttrs = [NSAttributedString.Key.font: UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(12).generateSizeForScreen)]
        let endingString = "(Selecione no máximo 3)"
        let endingMutableString = NSMutableAttributedString(string: endingString, attributes: smallAttrs as [NSAttributedString.Key : Any])
        labelattributedString.append(endingMutableString)
        label.attributedText = labelattributedString
        label.numberOfLines = 5
        label.textAlignment = .center
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    lazy var interestsButtons: [UIButton] = []
    
    lazy var interestsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: interestsButtons)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CGFloat(12).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var arrayItems: [String] = []
    var interestArray: [String] = []
    let sessionManager = APIService()
    
    let activitiesViewModel = ActivitiesViewModel()
    
       
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {

        setupView()
        setupDefaults()
        setupConstraints()
        activeButton()
        activitiesViewModel.interestActivities()

        activitiesViewModel.activitiesDelegate = self

      
    }
    
    /// This function adds select action on capsuleButton and limits to three selected buttons.
    /// - Parameter button: capsuleButtons
    @objc func buttonTapped(button: UIButton) {
        if arrayItems.count >= 3 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            } else {
                print("Escolha no máximo 3 interesses")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                arrayItems.append(button.titleLabel?.text ?? "")
                } else {
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                    button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                    let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                    arrayItems = filteredArray
                }
        }
        print(arrayItems)
    }
    
    /// This function adds target and backgroundColor in continueButton.
    func activeButton() {

        continueButton.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
    
    /// This function adds action in continueButton.
    @objc func continueButtonTapped() {
        let vc = FinalizeView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func hideJumpButtonTapped() {
            
        print("Pulando tela")
    }
    
    /// This function adds view elements and actions.
    func setupView() {
            
        view.addSubviews([backgroundImage, registerButton, progressBarStackView, infoLabel, interestsStackView, continueButton])
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        let handler = {(action: UIAction) in
            let vc = FinalizeView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        view.createRegisterCustomBar(progressBarButtons: buttons,
                                     jumpAction: UIAction(handler: handler)) {_ in
            if let hobbiesView = self.presentingViewController,
               let professionView = hobbiesView.presentingViewController,
               let photoView = professionView.presentingViewController,
               let tokenView = photoView.presentingViewController,
               let confirmDataView = tokenView.presentingViewController,
               let passwordView = confirmDataView.presentingViewController,
               let emailView = passwordView.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController,
               let loginView = nomeView.presentingViewController{
                
                tokenView.view.isHidden = true
                confirmDataView.view.isHidden = true
                passwordView.view.isHidden = true
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.view.isHidden = true
                loginView.dismiss(animated: false)
            }
        }
        
    }
    
    
    /// This function adds background image and continueButton in view
    func setupDefaults() {
        
        continueButton.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayActivities)
    }
    
    /// This function adds constraints in the view elements
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(236).generateSizeForScreen),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22.5).generateSizeForScreen),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22.5).generateSizeForScreen),
        
            interestsStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            interestsStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
        ])
    }

}

extension ActivitiesView: ActivitiesViewModelProtocol {
    func setupActivities() {
        
        self.interestsButtons = self.createCapsuleButtons(self.activitiesViewModel.interestArray, ColorsBravve.capsuleButton)
        for InterestButton in self.interestsButtons {
            InterestButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        }
        self.interestsStackView.addArrangedSubviews(self.activitiesViewModel.setupStackView(self.interestsButtons))
    }
    func setupButton(button: UIButton) {
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
    }
}
