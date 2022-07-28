//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class FotoView: UIViewController {
    
    private let bravveIcon = UIImageView()
    
    private let backButton = UIButton()
    
    private let registerButton = UIButton()
    
    private let jumpButton = UIButton()
    
    private let firstWay = UIImageView(),
        secondWay = UIImageView()
    
    private lazy var progressBarStackView: UIStackView = {
        
        let buttons = createProgressBarButtons(["photoBlue",
                                                "noteGray",
                                                "hobbiesGray",
                                                "activiesGray"])
        let stackView = UIStackView(arrangedSubviews: buttons)
        
        stackView.spacing = 7
        
        return stackView
    }()
    
    private let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.setToDefault(text: "Quer adicionar uma foto ao seu perfil, agora? Esse passo é opcional!")
        
        return infoLabel
    }()
    
    private let tutorialLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.setToDefault(text: "Recomendado: 512x512\nMáximo: 2MB")
        
        return infoLabel
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.image = UIImage(named: "MrMadruga")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.setImage(UIImage(named: "photoPink"), for: .normal)
        
        return editButton
    }()
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        
        super.viewDidLoad()
    }
    
    private func setupView() {
        
        view.addSubviews([firstWay, secondWay, bravveIcon, backButton, progressBarStackView, infoLabel, registerButton, jumpButton, imageView, editButton, tutorialLabel])
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupDefaults() {
        
        firstWay.setWayToDefault("way4")
        secondWay.setWayToDefault("way1")
        bravveIcon.setLogoToDefault()
        backButton.setToBackButtonDefault("backButtonPink")
        registerButton.setToButtonDefault(jumpButton, 20)
        jumpButton.setToJumpButtonDefault(50)
    }
    
    private func setupConstraints() {
        
        progressBarStackView.constraintOutsideTo(.top, bravveIcon, 50)
        progressBarStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        
        infoLabel.constraintOutsideTo(.top, progressBarStackView, 50)
        infoLabel.constraintInsideTo(.leading, view.safeAreaLayoutGuide, 40)
        infoLabel.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, 40)
        
        imageView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        imageView.constraintInsideTo(.centerY, view.safeAreaLayoutGuide, 30)
        imageView.sizeAnchorInSuperview(view.frame.size.height/5)
        imageView.layer.cornerRadius = view.frame.size.height/10
        
        tutorialLabel.constraintOutsideTo(.top, imageView, 25)
        tutorialLabel.constraintOutsideTo(.centerX, view)
        
        editButton.sizeAnchorInSuperview()
        editButton.constraintInsideTo(.centerX, imageView, view.frame.size.height/15)
        editButton.constraintInsideTo(.centerY, imageView, view.frame.size.height/15)
    }
}
