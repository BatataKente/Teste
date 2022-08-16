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
    let selectAreaButton = UIButton()
    let workRegimeButton = UIButton()
    let continueButton = UIButton ()
    
    lazy var progressBarButtons: [UIButton] = {
        var buttons = [UIButton]()
        buttons = createProgressBarButtons([IconsBravve.photoGray.rawValue,
                                                               IconsBravve.noteBlue.rawValue,
                                                               IconsBravve.hobbiesGray.rawValue,
                                                               IconsBravve.activitiesGray.rawValue])
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
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textAlignment = .center
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let selectAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "Selecionar área"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textAlignment = .left
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    } ()
    
    let selectAreaAPILabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.isHidden = true
        return label
    }()

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
        stackView.distribution = .equalCentering
        stackView.backgroundColor = .white
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
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textAlignment = .left
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    var workRegimeAPILabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    } ()
    
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
        stackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let professionViewModel = ProfessionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.addSubviews([backButton,
                                    infoLabel,
                                    selectAreaStackView,
                                    workRegimeStackView,
                                    logoBravve,
                                    continueButton,
                                    progressBarStackView,
                                    backgroundImageView])
   
        logoBravve.setLogoToDefault()
        backButton.setToBackButtonDefault(ButtonsBravve.backPink, CGFloat(22).generateSizeForScreen) {_ in
            let vc = FotoView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        continueButton.setToBottomButtonKeyboardDefault()
        continueButton.addTarget(self, action: #selector(continueToHobbies), for: .touchUpInside)
        
        backgroundImageView.setWayToDefault(ImagesBravve(rawValue: ImagesBravve.wayPassword.rawValue)!)
        
        professionViewModel.selectAreaMenu(label: selectAreaAPILabel, button: selectAreaButton)
        
        professionViewModel.workRegimeMenu(label: workRegimeAPILabel, button: workRegimeButton)
        
        NSLayoutConstraint.activate([
            
            progressBarStackView.topAnchor.constraint(equalTo: logoBravve.bottomAnchor, constant: CGFloat(50).generateSizeForScreen),
            progressBarStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBarStackView.heightAnchor.constraint(equalToConstant: CGFloat(27).generateSizeForScreen),
            
            infoLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: CGFloat(238.5).generateSizeForScreen),
            infoLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: CGFloat(22).generateSizeForScreen),
            infoLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: CGFloat(-22).generateSizeForScreen),
            
            selectAreaStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: CGFloat(15).generateSizeForScreen),
            selectAreaStackView.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            selectAreaStackView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            selectAreaStackView.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen),
            selectAreaTextStackView.widthAnchor.constraint(equalTo: selectAreaStackView.widthAnchor, multiplier: 0.9),
            selectAreaButton.widthAnchor.constraint(equalTo: selectAreaStackView.widthAnchor, multiplier: 0.1),
            
            workRegimeStackView.topAnchor.constraint(equalTo: selectAreaStackView.bottomAnchor, constant: CGFloat(15).generateSizeForScreen),
            workRegimeStackView.leadingAnchor.constraint(equalTo: selectAreaStackView.leadingAnchor),
            workRegimeStackView.trailingAnchor.constraint(equalTo: selectAreaStackView.trailingAnchor),
            workRegimeStackView.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen),
            workRegimeTextStackView.widthAnchor.constraint(equalTo: workRegimeStackView.widthAnchor, multiplier: 0.9),
            workRegimeButton.widthAnchor.constraint(equalTo: workRegimeStackView.widthAnchor, multiplier: 0.1),
        ])
        
        let selectAreaTap = UITapGestureRecognizer(target: self, action: #selector(selectAreaTapped))
        selectAreaStackView.addGestureRecognizer(selectAreaTap)
        selectAreaButton.addGestureRecognizer(selectAreaTap)
        
        let workRegimeTap = UITapGestureRecognizer(target: self, action: #selector(workRegimeTapped))
        workRegimeStackView.addGestureRecognizer(workRegimeTap)
        workRegimeButton.addGestureRecognizer(workRegimeTap)
        
    }
    
    @objc func selectAreaTapped() {
        
        selectAreaLabel.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
        selectAreaAPILabel.isHidden = false
                                      selectAreaAPILabel.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
    }
    
    @objc func workRegimeTapped() {
        
        workRegimeLabel.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
        workRegimeAPILabel.isHidden = false
        workRegimeAPILabel.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
    }
    
    @objc func continueToHobbies() {
        let hobbiesView = HobbiesView ()
        hobbiesView.modalPresentationStyle = .fullScreen
        present(hobbiesView, animated: true, completion: nil)
    }
}


