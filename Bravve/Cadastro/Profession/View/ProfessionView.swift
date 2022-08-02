//
//  ProfissaoView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ProfessionView: UIViewController {
    
    let backButton = UIButton()
    let logoBravve = UIImageView()
    let backgroundImageView = UIImageView()
    
    lazy var progressBarButtons: [UIButton] = {
        var buttons = [UIButton]()
        buttons = createProgressBarButtons(["photoGray","noteBlue", "hobbiesGray", "activiesGray"])
        return buttons
    } ()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressBarButtons)
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Queremos te conhecer um pouco mais pra que possamos te indicar coisas legais! Qual é a sua profissão?"
        label.font = UIFont(name: "Ubuntu-Light", size: 16)
        label.textAlignment = .center
        label.textColor = UIColor(named: "labelTextField")
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let selectAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "Selecionar área"
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.textAlignment = .left
        label.textColor = UIColor(named: "labelTextField")
        return label
    } ()
    
    let selectAreaAPILabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "label")
        label.isHidden = true
        return label
    }()
    
    let selectAreaButton = UIButton(type: .custom)
    
    lazy var selectAreaTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [selectAreaLabel, selectAreaAPILabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    } ()
    
    lazy var selectAreaStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [selectAreaTextStackView, selectAreaButton])
        stackView.layer.cornerRadius = 8
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(named: "textFieldBackgroud")
        stackView.distribution = .equalCentering
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let workRegimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Regime de trabalho"
        label.font = UIFont(name: "Ubuntu-Light", size: 15)
        label.textAlignment = .left
        label.textColor = UIColor(named: "labelTextField")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    var workRegimeAPILabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = UIColor(named: "label")
        return label
    } ()
    
    let workRegimeButton = UIButton()
    
    lazy var workRegimeTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workRegimeLabel, workRegimeAPILabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    } ()
    
    lazy var workRegimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workRegimeTextStackView, workRegimeButton])
        stackView.layer.cornerRadius = 8
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(named: "textFieldBackgroud")
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16.5)
        button.titleLabel?.tintColor = .white
        button.backgroundColor = UIColor(named: "PinkBravve")
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let professionViewModel = ProfessionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubviews([backButton,
                                    infoLabel,
                                    selectAreaStackView,
                                    workRegimeStackView,
                                    logoBravve,
                                    continueButton,
                                    progressBarStackView,
                                    backgroundImageView])
        
        backgroundImageView.setWayToDefault(.wayCell)
        logoBravve.setLogoToDefault()
        backButton.setToBackButtonDefault()
        
        selectAreaButton.setMenuForButton(professionViewModel.selectAreaMenu({ (action: UIAction) in
            self.selectAreaAPILabel.text = action.title
        }))
        workRegimeButton.setMenuForButton(professionViewModel.workRegimeMenu({(action: UIAction) in
            self.workRegimeAPILabel.text = action.title
        }))
        
        NSLayoutConstraint.activate([
            
            progressBarStackView.topAnchor.constraint(equalTo: logoBravve.bottomAnchor, constant: 50),
            progressBarStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBarStackView.heightAnchor.constraint(equalToConstant: 27),
            
            infoLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 238.5),
            infoLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 22),
            infoLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -22),
            
            selectAreaStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15),
            selectAreaStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 22),
            selectAreaStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -22),
            selectAreaStackView.heightAnchor.constraint(equalToConstant: 60),
            
            selectAreaTextStackView.widthAnchor.constraint(equalTo: selectAreaStackView.widthAnchor, multiplier: 0.8),

            selectAreaButton.bottomAnchor.constraint(equalTo: selectAreaStackView.bottomAnchor, constant: 24.34),
            selectAreaButton.trailingAnchor.constraint(equalTo: selectAreaStackView.trailingAnchor, constant: -18.36),
            
            workRegimeStackView.topAnchor.constraint(equalTo: selectAreaStackView.bottomAnchor, constant: 15),
            workRegimeStackView.leadingAnchor.constraint(equalTo: selectAreaStackView.leadingAnchor),
            workRegimeStackView.trailingAnchor.constraint(equalTo: selectAreaStackView.trailingAnchor),
            workRegimeStackView.heightAnchor.constraint(equalToConstant: 60),
            
            workRegimeTextStackView.widthAnchor.constraint(equalTo: workRegimeStackView.widthAnchor, multiplier: 0.8),

            workRegimeButton.bottomAnchor.constraint(equalTo: workRegimeStackView.bottomAnchor, constant: 24.34),
            workRegimeButton.trailingAnchor.constraint(equalTo: workRegimeStackView.trailingAnchor, constant: -18.36),
            
            continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -125),
            continueButton.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        let selectAreaTap = UITapGestureRecognizer(target: self, action: #selector(selectAreaTapped))
        selectAreaStackView.addGestureRecognizer(selectAreaTap)
        selectAreaButton.addGestureRecognizer(selectAreaTap)
        
        let workRegimeTap = UITapGestureRecognizer(target: self, action: #selector(workRegimeTapped))
        workRegimeStackView.addGestureRecognizer(workRegimeTap)
        workRegimeButton.addGestureRecognizer(workRegimeTap)
    }
    
    @objc func selectAreaTapped() {
        
        selectAreaLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        selectAreaAPILabel.isHidden = false
        selectAreaAPILabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
    }
    
    @objc func workRegimeTapped() {
        
        workRegimeLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        workRegimeAPILabel.isHidden = false
        workRegimeAPILabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
    }
}
