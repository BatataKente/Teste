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
        return buttons
    }()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = CGFloat(8).generateSizeForScreen
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
//        let line1 = UIStackView(arrangedSubviews: [interestsButtons[0], interestsButtons[1]])
//        line1.axis = .horizontal
//        line1.spacing = CGFloat(4).generateSizeForScreen
//
//        let line2 = UIStackView(arrangedSubviews: [interestsButtons[2], interestsButtons[3], interestsButtons[4]])
//        line2.axis = .horizontal
//        line2.spacing = CGFloat(4).generateSizeForScreen
//
//        let line3 = UIStackView(arrangedSubviews: [interestsButtons[5], interestsButtons[6], interestsButtons[7]])
//        line3.axis = .horizontal
//        line3.spacing = CGFloat(4).generateSizeForScreen
//
//        let line4 = UIStackView(arrangedSubviews: [interestsButtons[8], interestsButtons[9]])
//        line4.axis = .horizontal
//        line4.spacing = CGFloat(4).generateSizeForScreen
//
//        let line5 = UIStackView(arrangedSubviews: [interestsButtons[10], interestsButtons[11]])
//        line4.axis = .horizontal
//        line4.spacing = CGFloat(4).generateSizeForScreen
//
//        let stackView = UIStackView(arrangedSubviews: [line1, line2, line3, line4, line5])
        let stackView = UIStackView(arrangedSubviews: interestsButtons)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CGFloat(12).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var arrayItems: [String] = []
    var interestArray: [String] = []
    let networkManager = NetworkManager()
       
    override func viewDidLoad() {

        setupView()
        setupDefaults()
        setupConstraints()
        activeButton()
        interestActivities()
        print(interestArray)
    }
    
    @objc func buttonTapped(button: UIButton) {
        if arrayItems.count >= 3 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            } else {
                print("Escolha no máximo 3 interesses")
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
        print(arrayItems)
    }
    
    func activeButton() {

        continueButton.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
    
    @objc func continueButtonTapped() {
        let vc = FinalizeView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func hideJumpButtonTapped() {
            
        print("Pulando tela")
    }
    
    func interestActivities() {
        networkManager.getDataArray(endpoint: .usersInterests) { (interestActivities: [Interests]?) in
            guard let interestActivities = interestActivities else {
                return
            }
            for interestActivity in interestActivities {
                self.interestArray.append(interestActivity.name ?? "")
                print(self.interestArray)
            }
            self.interestsButtons = self.createCapsuleButtons(self.interestArray, ColorsBravve.capsuleButton)
            for InterestButton in self.interestsButtons {
                InterestButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
            }
            self.interestsStackView.addArrangedSubviews(self.interestsButtons)
        }
    }
    
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
            self.dismiss(animated: true)
        }
        
    }
    
    func setupDefaults() {
        
        continueButton.setToBottomButtonKeyboardDefault()
        backgroundImage.setWayToDefault(.wayActivities)
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
            interestsStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            interestsStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }

}

