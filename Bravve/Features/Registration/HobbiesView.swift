//
//  HobbiesView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HobbiesView: UIViewController {
    
    let networkManager = NetworkManager()
    
    let sessionManager = SessionManager()
    
    var aPIHobbiesArray: [String] = []

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
            
    lazy var hobbiesButtons: [UIButton] = {
        var hobbiesButtons = [UIButton]()
        hobbiesButtons = createCapsuleButtons(["Futebol", "Ciclismo", "Natação", "Corrida", "Culinária", "Fotografia", "Viagens", "Artes", "Games", "Yoga", "Leitura", "Música"], ColorsBravve.capsuleButton)
        
        for hobbiesButton in hobbiesButtons {
            hobbiesButton.addTarget(self, action: #selector(chooseHobbie), for: .touchUpInside)
        }
        return hobbiesButtons
        
    }()
    
    lazy var stackLine1: UIStackView = {
        let stack1 = UIStackView()
        stack1.axis = .horizontal
        stack1.spacing = CGFloat(4).generateSizeForScreen
        return stack1
    }()
    
    lazy var hobbiesStackView: UIStackView = {
        
        let line2 = UIStackView(arrangedSubviews: [hobbiesButtons[3], hobbiesButtons[4], hobbiesButtons[5]])
        line2.axis = .horizontal
        line2.spacing = CGFloat(4).generateSizeForScreen
        
        let line3 = UIStackView(arrangedSubviews: [hobbiesButtons[6], hobbiesButtons[7], hobbiesButtons[8]])
        line3.axis = .horizontal
        line3.spacing = CGFloat(4).generateSizeForScreen
        
        let line4 = UIStackView(arrangedSubviews: [hobbiesButtons[9], hobbiesButtons[10], hobbiesButtons[11]])
        line4.axis = .horizontal
        line4.spacing = CGFloat(4).generateSizeForScreen
        
        let stackView = UIStackView(arrangedSubviews: [stackLine1, line2, line3, line4])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CGFloat(12).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        activeButton()
        setupHobbiesArray()
    }
    
    func setupHobbiesArray() {

        networkManager.getDataArray(endpoint: .usersHobbies) { (hobbiesList: [Hobbies]? ) in

            guard let hobbiesList = hobbiesList else { return }
            
            for hobbies in hobbiesList {
                (self.aPIHobbiesArray.append(hobbies.name ?? ""))
            }
            self.sessionHobbiesButtons = self.createCapsuleButtons(self.aPIHobbiesArray, ColorsBravve.capsuleButton)
            
            for hobbiesButton in self.sessionHobbiesButtons {
                hobbiesButton.addTarget(self, action: #selector(self.chooseHobbie), for: .touchUpInside)
            }
            
            self.stackLine1.addArrangedSubviews(self.sessionHobbiesButtons)
        }
    }
    
    var arrayItems: [String] = []
    
    @objc func chooseHobbie(button: UIButton) {
        if arrayItems.count >= 3 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            } else {
                print("Escolha no máximo 3 Hobbies")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .white
                arrayItems.append(button.titleLabel?.text ?? "")
            } else {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            }
        }
    }
    
    func activeButton() {
        
        continueButton.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
    
    @objc func continueButtonTapped() {
        let vc = ActivitiesView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

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
            self.dismiss(animated: true)
        }
    }
    
    func setupDefaults() {
        
        continueButton.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayName)
    }
    
    func setupConstraints() {
        
        setInfoLabelConstraints()
        setHobbiesStackConstraints()
    }
    
    
    private func setInfoLabelConstraints() {
        let constraint = [
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(236).generateSizeForScreen),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(22.5).generateSizeForScreen),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-22.5).generateSizeForScreen),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setHobbiesStackConstraints() {
        let constraint = [
            hobbiesStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            hobbiesStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
}

