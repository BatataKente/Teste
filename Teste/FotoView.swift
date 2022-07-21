//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class FotoView: UIViewController {
    
    let bravveIcon = UIImageView()
    
    let backButton = UIButton()
    
    let registerButton = UIButton()
    
    let jumpButton = UIButton()
    
    let progressBarStackView: UIStackView = {
        
        let stackView = UIStackView()
        let buttons = stackView.createProgressBarButtons(["camera.circle.fill",
                                                          "laptopcomputer",
                                                          "pencil.slash",
                                                          "captions.bubble"])
        buttons[0].setTitle(" Foto", for: .normal)
        
        stackView.backgroundColor = .white
        stackView.spacing = 7
        
        return stackView
    }()
    
    let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.setToDefault(text: "Quer adicionar uma foto ao seu perfil, agora? Esse passo é opcional!")
        
        return infoLabel
    }()
    
    let tutorialLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.setToDefault(text: "Recomendado: 512x512\nMáximo: 2MB")
        
        return infoLabel
    }()
    
    let imageView = UIImageView()
    
    let editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.setImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        
        return editButton
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        lastSetup()
    }
    
    override func viewDidLoad() {
        
        view.addSubviews([bravveIcon, backButton, progressBarStackView, infoLabel, registerButton, jumpButton, imageView, editButton, tutorialLabel])
        
        setupDefaults()
        
        setupConstraints()
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
    }
    
    func setupDefaults() {
        
        bravveIcon.setLogoToDefault()
        backButton.setToBackButtonDefault()
        registerButton.setToButtonDefault(jumpButton)
        jumpButton.setToJumpButtonDefault()
    }
    
    func setupConstraints() {
        
        progressBarStackView.constraintOutsideTo(.top, bravveIcon, 50)
        progressBarStackView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        
        infoLabel.constraintOutsideTo(.top, progressBarStackView, 50)
        infoLabel.constraintInsideTo(.leading, view.safeAreaLayoutGuide, 40)
        infoLabel.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, 40)
        
        imageView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        imageView.constraintInsideTo(.centerY, view.safeAreaLayoutGuide, 30)
        imageView.sizeAnchorInSuperview(view.frame.size.height/5)
        
        tutorialLabel.constraintOutsideTo(.top, imageView, 25)
        tutorialLabel.constraintOutsideTo(.centerX, view)
        
        editButton.sizeAnchorInSuperview()
    }
    
    func lastSetup() {
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.image = UIImage(named: "MrMadruga")
        imageView.clipsToBounds = true
        
        editButton.constraintInsideTo(.centerX, imageView, imageView.frame.size.width/3)
        editButton.constraintInsideTo(.centerY, imageView, imageView.frame.size.height/3)
    }
}
