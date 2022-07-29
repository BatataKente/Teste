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
        stackView.layer.borderColor = CGColor(red: 208.0/255.0, green: 213.0/255.0, blue: 221.0/225.0, alpha: 1.00)
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
        stackView.layer.borderColor = CGColor(red: 208.0/255.0, green: 213.0/255.0, blue: 221.0/225.0, alpha: 1.00)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        backgroundImageView.setWayToDefault("way2")
        logoBravve.setLogoToDefault()
        backButton.setToBackButtonDefault()
    }
}
