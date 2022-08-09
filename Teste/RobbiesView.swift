//
//  RobbiesView.swift
//  TestB
//
//  Created by user220237 on 8/9/22.
//

import UIKit

class RobbiesView: UIViewController {
    
    let backgroundImage = UIImageView()
    
    let continueButton = UIButton()
    

    private let registerButton = UIButton()
    
    private lazy var buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.photoGray.rawValue,
                                                      IconsBravve.noteGray.rawValue,
                                                      IconsBravve.hobbiesBlue.rawValue,
                                                      IconsBravve.activitiesGray.rawValue])
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
    
    
    lazy var hobbiesButtons: [UIButton] = {
           var hobbiesButtons = [UIButton]()
        hobbiesButtons = createCapsuleButtons(["Futebol", "Ciclismo", "Yoga", "Corrida", "Culinária", "Fotografia", "Viagens", "Artes", "Games", "Natação", "Leitura", "Música"], ColorsBravve.capsuleButton)
        
        for hobbiesButton in hobbiesButtons {
            hobbiesButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        return hobbiesButtons
        
    }()
    
    
    lazy var hobbiesStackView: UIStackView = {
        let line1 = UIStackView(arrangedSubviews: [hobbiesButtons[0], hobbiesButtons[1], hobbiesButtons[2]])
        line1.axis = .horizontal
        line1.spacing = CGFloat(4).generateSizeForScreen

        let line2 = UIStackView(arrangedSubviews: [hobbiesButtons[3], hobbiesButtons[4], hobbiesButtons[5]])
        line2.axis = .horizontal
        line2.spacing = CGFloat(4).generateSizeForScreen

        let line3 = UIStackView(arrangedSubviews: [hobbiesButtons[6], hobbiesButtons[7], hobbiesButtons[8]])
        line3.axis = .horizontal
        line3.spacing = CGFloat(4).generateSizeForScreen

        let line4 = UIStackView(arrangedSubviews: [hobbiesButtons[9], hobbiesButtons[10], hobbiesButtons[11]])
        line4.axis = .horizontal
        line4.spacing = CGFloat(4).generateSizeForScreen
        
        let stackView = UIStackView(arrangedSubviews: [line1, line2, line3, line4])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CGFloat(12).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    var arrayItems: [String] = []
    
    @objc func buttonTapped(button: UIButton) {
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
        print(arrayItems)
    }
    
    func activeButton() {

        continueButton.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
    }
    
    @objc func continueButtonTapped() {
            
        print("Chamando próxima tela")
    }
    
    @objc func hideJumpButtonTapped() {
            
        print("Pulando tela")
    }
    
    
    override func viewDidLoad() {

        setupView()
        setupDefaults()
        setupConstraints()
        activeButton()
    }
    
    func setupView() {
        	
        view.addSubviews([backgroundImage, registerButton, progressBarStackView, infoLabel, hobbiesStackView, continueButton])
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.createRegisterCustomBar(progressBarButtons: buttons,
                                     hideJumpButton: false) {_ in
            
            // call screen it should go to
           
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
