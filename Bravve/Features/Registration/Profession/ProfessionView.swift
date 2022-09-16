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
    
    let continueButton:UIButton = {
        let continueButton = UIButton()
        continueButton.addTarget(self, action: #selector(continueToHobbies), for: .touchUpInside)
        return continueButton
    }()
    
    
    let selectAreaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        button.setImage(UIImage(named: "arrowDown"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let workRegimeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowDown"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var progressBarButtons: [UIButton] = {
        var buttons = [UIButton]()
        buttons = createProgressBarButtons([IconsBravve.photoGray.rawValue,
                                            IconsBravve.noteBlue.rawValue,
                                            IconsBravve.hobbiesGray.rawValue,
                                            IconsBravve.activitiesGray.rawValue])
        
        let handler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return buttons
    } ()
    
    lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressBarButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Queremos te conhecer um pouco mais para que possamos te indicar coisas legais! Qual é a sua profissão?"
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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        professionViewModel.selectAreaMenu(label: self.selectAreaAPILabel, scrollView: scrollView)
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var selectAreaTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [selectAreaLabel, selectAreaAPILabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    } ()
    
    lazy var selectAreaStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [selectAreaTextStackView])
        stackView.layer.cornerRadius = 8
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.backgroundColor = UIColor(named: ColorsBravve.textFieldBackground.rawValue)
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
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
    
    private lazy var scrollViewWork: UIScrollView = {
        let scrollView = UIScrollView()
        
        professionViewModel.workRegimeMenu(label: workRegimeAPILabel, scrollView: scrollView)
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var workRegimeTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workRegimeLabel, workRegimeAPILabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    } ()
    
    lazy var workRegimeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workRegimeTextStackView])
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
    
    let sessionManager = APIService()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        view.addSubviews([backButton,
                          infoLabel,
                          selectAreaStackView,
                          selectAreaButton,
                          workRegimeStackView,
                          workRegimeButton,
                          logoBravve,
                          continueButton,
                          progressBarStackView,
                          backgroundImageView,
                          scrollView,
                          scrollViewWork
                         ])
        
        logoBravve.setLogoToDefault()
        backButton.setToBackButtonDefault(ButtonsBravve.backPink, CGFloat(22).generateSizeForScreen) {_ in
            if let photoView = self.presentingViewController,
               let tokenView = photoView.presentingViewController,
               let confirmDataView = tokenView.presentingViewController,
               let passwordView = confirmDataView.presentingViewController,
               let emailView = passwordView.presentingViewController,
               let phoneView = emailView.presentingViewController,
               let nomeView = phoneView.presentingViewController,
               let loginView = nomeView.presentingViewController{
                
                tokenView.view.isHidden = true
                confirmDataView.view.isHidden = true
                passwordView.view.isHidden = true
                emailView.view.isHidden = true
                phoneView.view.isHidden = true
                nomeView.view.isHidden = true
                loginView.dismiss(animated: false)
            }
        }
        continueButton.setToBottomButtonKeyboardDefault(backgroundColor: ColorsBravve.buttonPink)
        
        backgroundImageView.setWayToDefault(ImagesBravve(rawValue: ImagesBravve.wayPassword.rawValue)!)
        
        setupConstrains()
        
        selectAreaButton.addAction(UIAction(handler: { action in
            self.scrollView.showLikeAWindow(size: CGSize(width: self.selectAreaStackView.frame.size.width, height: 144), origin: CGPoint(x: self.selectAreaStackView.frame.maxX, y: self.selectAreaStackView.frame.maxY), .downLeft)
        }), for: .touchUpInside)
        workRegimeButton.addAction(UIAction(handler: { action in
            self.scrollViewWork.showLikeAWindow(size: CGSize(width: self.workRegimeStackView.frame.size.width, height: 144), origin: CGPoint(x: self.workRegimeStackView.frame.maxX, y: self.workRegimeStackView.frame.maxY), .downLeft)
        }), for: .touchUpInside)
    }
    
    func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            
            progressBarStackView.topAnchor.constraint(equalTo: logoBravve.bottomAnchor, constant: 50),
            progressBarStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBarStackView.heightAnchor.constraint(equalToConstant: 27),
            
            infoLabel.topAnchor.constraint(equalTo: progressBarStackView.bottomAnchor,constant: 60),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
            selectAreaStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15),
            selectAreaStackView.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            selectAreaStackView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            selectAreaStackView.heightAnchor.constraint(equalToConstant: 60),
            
            selectAreaTextStackView.widthAnchor.constraint(equalTo: selectAreaStackView.widthAnchor, multiplier: 0.9),
            
            selectAreaButton.topAnchor.constraint(equalTo: selectAreaStackView.topAnchor, constant: 25),
            selectAreaButton.trailingAnchor.constraint(equalTo: selectAreaStackView.trailingAnchor, constant: -24.34),
            selectAreaButton.widthAnchor.constraint(equalToConstant: 14.53),
            selectAreaButton.heightAnchor.constraint(equalToConstant: 7.66),
            
            workRegimeStackView.topAnchor.constraint(equalTo: selectAreaStackView.bottomAnchor, constant: 15),
            workRegimeStackView.leadingAnchor.constraint(equalTo: selectAreaStackView.leadingAnchor),
            workRegimeStackView.trailingAnchor.constraint(equalTo: selectAreaStackView.trailingAnchor),
            workRegimeStackView.heightAnchor.constraint(equalToConstant: 60),
            
            workRegimeTextStackView.widthAnchor.constraint(equalTo: workRegimeStackView.widthAnchor, multiplier: 0.9),
            
            workRegimeButton.topAnchor.constraint(equalTo: workRegimeStackView.topAnchor, constant: 25),
            workRegimeButton.trailingAnchor.constraint(equalTo: workRegimeStackView.trailingAnchor, constant: -24.34),
            workRegimeButton.widthAnchor.constraint(equalToConstant: 14.53),
            workRegimeButton.heightAnchor.constraint(equalToConstant: 7.66),
            
            
        ])
        
        selectAreaButton.imageView?.heightAnchorInSuperview(7.66)
        selectAreaButton.imageView?.constraintOutsideTo(.width, selectAreaButton, multiplier: 2)
        
        workRegimeButton.imageView?.heightAnchorInSuperview(7.66)
        workRegimeButton.imageView?.constraintOutsideTo(.width, workRegimeButton, multiplier: 2)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scrollView.frame.size = .zero
        scrollViewWork.frame.size = .zero
    }
    
    @objc func continueToHobbies() {
        let hobbiesView = HobbiesView()
        hobbiesView.modalPresentationStyle = .fullScreen
        present(hobbiesView, animated: true, completion: nil)
    }
}

extension ProfessionView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
