//
//  ConfirmarDadosView.swift
//  Teste
//
//  Created by user218997 on 29/07/22.
//

import Foundation
import UIKit

class ConfirmDataView: UIViewController {
    
    override var prefersStatusBarHidden: Bool {

            return true

        }
    
    private let backgroundImage1 = UIImageView()
    
    private let backgroundImage2 = UIImageView()
//    private let backgroundImage2: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: ImagesBravve.wayConfirm_1.rawValue)
//        return image
//    }()
    
    
    private let buttonBack = UIButton()
    
    private let imageLogo = UIImageView()
    
    private lazy var buttons: [UIButton] = {
        let buttons =  createProgressBarButtons([
            IconsBravve.userGray.rawValue,
            IconsBravve.cellGray.rawValue,
            IconsBravve.emailGray.rawValue,
            IconsBravve.padlockGray.rawValue,
            IconsBravve.pencilBlue.rawValue
        ])
        buttons[4].setTitle(" Confirmação", for: .normal)
        return buttons
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Bravo! Que tal revisar suas informações, aqui você pode alterá-las!"
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        return label
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "Ana Maria Silva"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "11 99686 2647"
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        // label.text = "teste@bravve.com.br"
        label.adjustsFontSizeToFitWidth = true
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
        return stackView
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewName, stackViewCell, stackViewEmail])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let buttonContinue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
         
        view.addSubviews([ buttonBack, imageLogo, label, backgroundImage1, backgroundImage2, stackViewLabels, buttonContinue])
        
        view.createRegisterCustomBar(.backPink, progressBarButtons: buttons) { _ in
            let vc = PasswordView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        defaults()
        addConstraints()
        addTargets()
        
    }
    
    func myButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.edit_blue.rawValue), for: .normal)
        return button
    }
    
    private func defaults() {
        
        buttonContinue.setToBottomButtonKeyboardDefault("Continuar", backgroundColor: .buttonPink)
        backgroundImage1.setWayToDefault(.wayConfirm_2)
        backgroundImage2.setWayToDefault(.wayConfirm_1)
        
    }
    
    private func addConstraints() {
        
        label.constraintInsideTo(.left, view.safeAreaLayoutGuide, CGFloat(22).generateSizeForScreen)
        label.constraintInsideTo(.right, view.safeAreaLayoutGuide, CGFloat(-22).generateSizeForScreen)
        label.constraintInsideTo(.top, view, CGFloat(240).generateSizeForScreen)
        
        stackViewName.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewCell.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        stackViewEmail.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        editButton1.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButton2.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        editButton3.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        stackViewLabels.constraintInsideTo(.leading, label)
        stackViewLabels.constraintInsideTo(.trailing, label)
        stackViewLabels.constraintOutsideTo(.top, label, CGFloat(60).generateSizeForScreen)
    
    }
    
    private func addTargets() {
        
        buttonContinue.addTarget(self, action: #selector(actionButtonContinue), for: .touchUpInside)
        
        editButton1.addTarget(self, action: #selector(actionEditButton1), for: .touchUpInside)
        editButton2.addTarget(self, action: #selector(actionEditButton2), for: .touchUpInside)
        editButton3.addTarget(self, action: #selector(actionEditButton3), for: .touchUpInside)
        
    }
    
    
    @objc func actionButtonContinue() {
        print("continuar")
    }
    
    @objc func actionEditButton1() {
        print("tela dados pessoais")
        let vc = NomeView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func actionEditButton2() {
        print("tela celular")
    
    }
    
    @objc func actionEditButton3() {
        print("tela email")
    }
}
