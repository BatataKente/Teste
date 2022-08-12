//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class FotoView: UIViewController {
    
    private let registerButton = UIButton()
    
    private let firstWay = UIImageView(),
        secondWay = UIImageView()
    
    private lazy var progressBarButtons: [UIButton] = {
        
        let progressBarButtons = createProgressBarButtonsWithoutActions([IconsBravve.photoBlue.rawValue,
                                                              IconsBravve.noteGray.rawValue,
                                                              IconsBravve.hobbiesGray.rawValue,
                                                              IconsBravve.activitiesGray.rawValue])
        return progressBarButtons
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
        imageView.image = UIImage(named: ImagesBravve.photo.rawValue)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.setImage(UIImage(named: IconsBravve.photoBlue.rawValue),
                            for: .normal)
        
        return editButton
    }()
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        
        super.viewDidLoad()
    }
    
    private func setupView() {
        
        view.addSubviews([firstWay, secondWay, infoLabel, registerButton, imageView, editButton, tutorialLabel])
        
        view.createRegisterCustomBar(progressBarButtons: progressBarButtons) {_ in
            
            self.dismiss(animated: true)
        }
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupDefaults() {
        
        firstWay.setWayToDefault(.wayPhoto)
        secondWay.setWayToDefault(.wayConfirm_2 )
        
        registerButton.setToBottomButtonKeyboardDefault()
    }
    
    private func setupConstraints() {
        
        infoLabel.constraintOutsideTo(.top, view,
                                      CGFloat(250).generateSizeForScreen)
        infoLabel.constraintInsideTo(.leading, view.safeAreaLayoutGuide,
                                     CGFloat(40).generateSizeForScreen)
        infoLabel.constraintInsideTo(.trailing, view.safeAreaLayoutGuide,
                                     CGFloat(40).generateSizeForScreen)
        
        imageView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        imageView.constraintInsideTo(.centerY, view.safeAreaLayoutGuide,
                                     CGFloat(30).generateSizeForScreen)
        imageView.sizeAnchorInSuperview(view.frame.size.height/5)
        imageView.layer.cornerRadius = view.frame.size.height/10
        
        tutorialLabel.constraintOutsideTo(.top, imageView, 25)
        tutorialLabel.constraintOutsideTo(.centerX, view)
        
        editButton.sizeAnchorInSuperview(CGFloat(32).generateSizeForScreen)
        editButton.constraintInsideTo(.centerX, imageView, view.frame.size.height/15)
        editButton.constraintInsideTo(.centerY, imageView, view.frame.size.height/15)
    }
}
