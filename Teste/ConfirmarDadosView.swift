//
//  ConfirmarDadosView.swift
//  Teste
//
//  Created by user218997 on 29/07/22.
//

import Foundation
import UIKit

class ConfirmarDadosView: UIViewController {
    
    
    private let backgroundImage1 = UIImageView()
    
    private let backgroundImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImagesBravve.wayConfirm.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private let buttonBack = UIButton()
    
    private let imageLogo = UIImageView()
    
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {
        
        let buttons = createProgressBarButtons([
            IconsBravve.userGray.rawValue,
            IconsBravve.cellGray.rawValue,
            IconsBravve.emailGray.rawValue,
            IconsBravve.padlockGray.rawValue,
            IconsBravve.pencilBlue.rawValue
        ])
        let stackView = UIStackView(arrangedSubviews: buttons)
        buttons[4].setTitle(" Confirmação", for: .normal)
        
        return (stack: stackView,
                buttons: buttons)
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Bravo! Que tal revisar suas informações, aqui você pode alterá-las!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "Ana Maria Silva"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "11 99686 2647"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "teste@bravve.com.br"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var editButton1: UIButton = {
        let button = myButton()
        return button
    }()
    private lazy var editButton2: UIButton = {
        let button = myButton()
        return button
    }()
    private lazy var editButton3: UIButton = {
        let button = myButton()
        return button
    }()
    
    private lazy var stackViewName: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelName, editButton1])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewCell: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelCell, editButton2])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewEmail: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelEmail, editButton3])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewName, stackViewCell, stackViewEmail])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonContinue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([backgroundImage2, buttonBack, imageLogo, progressBarStackView.stack, label, backgroundImage1, stackViewLabels, buttonContinue])
        
        defaults()
        addConstraints()
        addTargets()
        
    }
    
    func myButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.edit_blue.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func defaults() {
        
        buttonBack.setToBackButtonDefault(.backPink)
        imageLogo.setLogoToDefault()
        buttonContinue.setToBottomButtonKeyboardDefault("Continuar", backgroundColor: .buttonPink)
        backgroundImage1.setWayToDefault(.wayCell)
        
    }
    
    private func addConstraints() {
        
        label.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(35).generateSizeForScreen)
        label.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(35).generateSizeForScreen)
        label.constraintOutsideTo(.top, progressBarStackView.stack, CGFloat(40).generateSizeForScreen)
        
        stackViewName.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewCell.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewEmail.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        editButton1.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButton2.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButton3.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        stackViewLabels.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        stackViewLabels.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        stackViewLabels.constraintOutsideTo(.top, label, CGFloat(40).generateSizeForScreen)
        
        progressBarStackView.stack.constraintOutsideTo(.top, imageLogo, CGFloat(50).generateSizeForScreen)
        progressBarStackView.stack.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        progressBarStackView.stack.heightAnchorInSuperview()
        
        backgroundImage2.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        backgroundImage2.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        backgroundImage2.heightAnchorInSuperview(120)
        backgroundImage2.widthAnchorInSuperview(280)
    }
    
    private func addTargets() {
        
        buttonBack.addTarget(self, action: #selector(actionButtonBack), for: .touchUpInside)
        
        progressBarStackView.buttons[0].addTarget(self, action: #selector(actionButtonPersonalData), for: .touchUpInside)
        
        progressBarStackView.buttons[1].addTarget(self, action: #selector(actionButtonCell), for: .touchUpInside)
        
        progressBarStackView.buttons[2].addTarget(self, action: #selector(actionButtonEmail), for: .touchUpInside)
        
        progressBarStackView.buttons[3].addTarget(self, action: #selector(actionButtonPassword), for: .touchUpInside)
        
        buttonContinue.addTarget(self, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        editButton1.addTarget(self, action: #selector(actionEditButton1), for: .touchUpInside)
        editButton2.addTarget(self, action: #selector(actionEditButton2), for: .touchUpInside)
        editButton3.addTarget(self, action: #selector(actionEditButton3), for: .touchUpInside)
        
    }
    
    
    @objc func actionButtonBack() {
        print("voltar")
    }
    
    @objc func actionButtonPersonalData() {
        print("dados pessoais")
    }
    
    @objc func actionButtonCell() {
        print("celular")
    }
    
    @objc func actionButtonEmail() {
        print("email")
    }
    
    @objc func actionButtonPassword() {
        print("senha")
    }
    
    @objc func actionButtonContinue() {
        print("continuar")
    }
    
    @objc func actionEditButton1() {
        print("tela dados pessoais")
    }
    
    @objc func actionEditButton2() {
        print("tela celular")
    }
    
    @objc func actionEditButton3() {
        print("tela email")
    }
}



