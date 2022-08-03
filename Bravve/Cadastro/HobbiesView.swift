//
//  HobbiesView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation

import UIKit

class HobbiesView: UIViewController {
    
    let backgroundImage = UIImageView()
    
    let bravveIcon = UIImageView()
    
    lazy var progressBarButtons: [UIButton] = {
       var buttons = [UIButton]()
       buttons = createProgressBarButtons(["photoGray",
                                        "noteGray",
                                        "hobbiesBlue",
                                        "activitiesGray"])
       return buttons
    }()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressBarButtons)
        stackView.spacing = 8
        
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
        label.textColor = UIColor(named: "label")
        return label
    }()
    
    
    lazy var hobbiesButtons: [UIButton] = {
           var hobbiesButtons = [UIButton]()
        hobbiesButtons = createCapsuleButtons(["Futebol", "Ciclismo", "Yoga", "Corrida", "Culinária", "Fotografia", "Viagens", "Artes", "Games", "Natação", "Leitura", "Música"], .cards)
        
        for hobbiesButton in hobbiesButtons {
            hobbiesButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        return hobbiesButtons
        
    }()
    
    
    lazy var hobbiesStackView: UIStackView = {
        let line1 = UIStackView(arrangedSubviews: [hobbiesButtons[0], hobbiesButtons[1], hobbiesButtons[2]])
        line1.axis = .horizontal
        line1.spacing = 4

        let line2 = UIStackView(arrangedSubviews: [hobbiesButtons[3], hobbiesButtons[4], hobbiesButtons[5]])
        line2.axis = .horizontal
        line2.spacing = 4

        let line3 = UIStackView(arrangedSubviews: [hobbiesButtons[6], hobbiesButtons[7], hobbiesButtons[8]])
        line3.axis = .horizontal
        line3.spacing = 4

        let line4 = UIStackView(arrangedSubviews: [hobbiesButtons[9], hobbiesButtons[10], hobbiesButtons[11]])
        line4.axis = .horizontal
        line4.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [line1, line2, line3, line4])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 331, height: 52))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,size: CGFloat(16).generateSizeForScreen)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonPink")
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 17))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pular", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,size: CGFloat(15).generateSizeForScreen)
        let frame = CGRect(x: 0, y: button.frame.size.height + 6, width: button.frame.size.width, height: 1)
        let borderBottom = UIView(frame: frame)
        borderBottom.backgroundColor = UIColor(named: "blueNav")
        button.addSubview(borderBottom)
        button.setTitleColor(UIColor(named: "blueNav"), for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    var arrayItems: [String] = []
    
    @objc func buttonTapped(button: UIButton) {
        if arrayItems.count >= 3 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = .white
                button.configuration?.attributedTitle?.foregroundColor = .black
                let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                arrayItems = filteredArray
            } else {
                print("Escolha no máximo 3 Hobbies")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                    button.configuration?.background.backgroundColor = UIColor(named: "blueNav")
                button.configuration?.attributedTitle?.foregroundColor = .white
                arrayItems.append(button.titleLabel?.text ?? "")
                } else {
                    button.configuration?.background.backgroundColor = .white
                    button.configuration?.attributedTitle?.foregroundColor = .black
                    let filteredArray = arrayItems.filter {$0 != button.titleLabel?.text ?? ""}
                    arrayItems = filteredArray
                }
        }
        print(arrayItems)
    }
    
    
    @objc func continueButtonTapped() {
            
        print("Chamando próxima tela")
    }
    
    @objc func skipButtonTapped() {
            
        print("Pulando tela")
    }
    
    
    override func viewDidLoad() {

        setupView()
        setupDefaults()
        setupConstraints()
    }
    
    func setupView() {
        
        view.addSubviews([backgroundImage, bravveIcon, progressBarStackView, infoLabel, hobbiesStackView, continueButton, skipButton])
        
        view.backgroundColor = UIColor(named: "background")
    }
    
    func setupDefaults() {
        
        bravveIcon.setLogoToDefault()
        //backgroundImage.setWayToDefault(.)
    }
    
    func setupConstraints() {
        setProgressBarStackViewConstraints()
        setInfoLabelConstraints()
        setHobbiesStackConstraints()
        setSkipButtonConstraints()
        setContinueButtonConstraints()
    }
    
    func setBravveImageConstraints() {
        
        let constraint = [
            bravveIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            bravveIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bravveIcon.widthAnchor.constraint(equalToConstant: CGFloat(123).generateSizeForScreen),
            bravveIcon.heightAnchor.constraint(equalToConstant: CGFloat(23).generateSizeForScreen)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setProgressBarStackViewConstraints() {
        
        progressBarStackView.constraintOutsideTo(.top, bravveIcon, 50)
        progressBarStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.heightAnchorInSuperview()
    }
    
    private func setInfoLabelConstraints() {
        let constraint = [
            infoLabel.topAnchor.constraint(equalTo: progressBarStackView.bottomAnchor, constant: 55),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22.5),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22.5),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setHobbiesStackConstraints() {
        let constraint = [
            hobbiesStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 55),
            hobbiesStackView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setContinueButtonConstraints() {
        let constraint = [
            continueButton.topAnchor.constraint(equalTo: hobbiesStackView.bottomAnchor, constant: 108),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: CGFloat(331).generateSizeForScreen),
            continueButton.heightAnchor.constraint(equalToConstant: CGFloat(52).generateSizeForScreen)
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func setSkipButtonConstraints() {
        let constraint = [
            skipButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: CGFloat(34).generateSizeForScreen),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        constraint.forEach { item in
            item.isActive = true
        }
    }
  
   
}
