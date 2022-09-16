//
//  HobbiesView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HobbiesView: UIViewController {
    
    let networkManager = NetworkManager()
    
    let sessionManager = APIService()
    
    let hobbiesViewModel = HobbiesViewModel()

    let backgroundImage = UIImageView()
    
    let continueButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.photoGray.rawValue,
                                                       IconsBravve.noteGray.rawValue,
                                                       IconsBravve.hobbiesBlue.rawValue,
                                                              IconsBravve.activitiesGray.rawValue])
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
        
        buttons[0].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
        return buttons
    }()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        return stackView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let begginingText = "Hobbies nos ajudam e nos tornam mais\ncriativos. Quais são os seus\n"
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
    
    
    var sessionHobbiesButtons = [UIButton]()
            
    lazy var hobbiesButtons: [UIButton] = []
    
    lazy var hobbiesStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: hobbiesButtons)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CGFloat(12).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        activeButton()
        hobbiesViewModel.hobbiesDelegate = self
        hobbiesViewModel.setupHobbiesArray()
        
    }
    
    var arrayItems: [String] = []
    
    /// This function adds select action on capsuleButton and limits to three selected buttons
    /// - Parameter button: capsuleButton
    @objc func chooseHobbie(button: UIButton) {
        if arrayItems.count >= 3 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            } else {
                print("Escolha no máximo 3 Hobbies")
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
    }
    
    /// This function adds target and backgroundColor in continueButton
    func activeButton() {
        
        continueButton.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
    
    
    /// This function adds action in continueButton
    @objc func continueButtonTapped() {
        let vc = ActivitiesView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    /// This function adds view elements and actions
    func setupView() {
        
        view.addSubviews([backgroundImage, progressBarStackView, infoLabel, hobbiesStackView, continueButton])
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        let handler = {(action: UIAction) in
            let vc = ActivitiesView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        view.createRegisterCustomBar(progressBarButtons: buttons,
                                     jumpAction: UIAction(handler: handler)) {_ in
            if let professionView = self.presentingViewController,
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
    
    /// This function adds the background image and continueButton to the view
    func setupDefaults() {
        
        continueButton.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayName)
    }
    
    /// This function adds the constraints of view elements
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(236).generateSizeForScreen),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22.5).generateSizeForScreen),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22.5).generateSizeForScreen),
            
            hobbiesStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            hobbiesStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
        ])
        
    }
    
}

extension HobbiesView: HobbiesViewModelProtocol {
    
    func setupHobbies() {
        self.hobbiesButtons = self.createCapsuleButtons(self.hobbiesViewModel.aPIHobbiesArray, ColorsBravve.capsuleButton)
        
        for hobbiesButton in self.hobbiesButtons {
            hobbiesButton.addTarget(self, action: #selector(self.chooseHobbie), for: .touchUpInside)
        }
        
        self.hobbiesStackView.addArrangedSubviews(self.hobbiesViewModel.setupStackView(self.hobbiesButtons))
    }

    func setupButton(button: UIButton) {
        button.addTarget(self, action: #selector(self.chooseHobbie),  for: .touchUpInside)
    }

}
