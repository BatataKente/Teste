//
//  Reservations3-3ViewController.swift
//  Teste
//
//  Created by user220831 on 8/8/22.
//

import Foundation
import UIKit

final class ReservationsThreeViewController: UIViewController {
    

    private let bravveIcon = UIImageView()
    
    //MARK: LoadView
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        setupConstrains()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
        
        
    }
    
       //MARK: SetupView
       private func setupView() {
           view.addSubviews([navWalppapper,
                             nameSpace,
                             nameLocalPartner,
                             progressBarStackView.stack,
                             paymentLabel,
                             lineImage,
                             resumeLabel,
                             tableviewCc,
                             numberCardTextfield,
                             cardCreditLabel,
                             ccValidateExpirationTextfield,
                             sourceSecurityTextfield,
                             countryButton,
                             nameHolderTextfield,
                             cpfTextfield,
                             accessoryButtonCcValidate,
                             accessoryButtonSourceSecurity,
                             countryImageFlag,
                             accessoryButtonCountryArrow,
                             finishButton,
                             
                            ])
       }
       
        //MARK: NavWallpapper
        private lazy var navWalppapper: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "imageReservsNav")
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleToFill
           return view
        }()
        
        //MARK: NameSpace
       private lazy var nameSpace: UILabel = {
            let label = UILabel()
            label.text = "Nome do espaço"
            label.font = UIFont(name: "Ubuntu-Bold", size: 16)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.textColor = UIColor(named: "Brigth-white")
            label.textColor = .white
           return label
        }()
        
    //MARK: NameLocalPartner
       private lazy var nameLocalPartner: UILabel = {
            let label = UILabel()
            label.text = "Nome do local parceiro"
            label.font = UIFont(name: "Ubuntu-Regular", size: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.textColor = UIColor(named: "Brigth-white")
            label.textColor = .white
           return label
        }()
    
    //MARK: ProgressBarStackView
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {

        let buttons = createProgressBarButtons([IconsBravve.walletGray.rawValue, IconsBravve.calendarGray.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditBlue.rawValue])
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.semanticContentAttribute = .unspecified
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return (stack: stackView,
                buttons: buttons)
        
        
    }()
        
       
        //MARK: cardButton
        private lazy var cardButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(named: "userGray"), for: .normal)
            view.translatesAutoresizingMaskIntoConstraints = false
         return view
        }()
        
    //MARK: schedulingButton
        private lazy var schedulingButton: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "creditBlue")
            view.translatesAutoresizingMaskIntoConstraints = false
            
         return view
        }()
        
    //MARK: revisionButton
        private lazy var revisionButton: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "creditBlue")
            view.translatesAutoresizingMaskIntoConstraints = false
            
         return view
        }()
        
    //MARK: paymentButton
        private lazy var paymentButton: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "creditBlue")
            view.translatesAutoresizingMaskIntoConstraints = false
            
         return view
        }()
    
    //MARK: paymentLabel
    private lazy var paymentLabel: UILabel = {
         let label = UILabel()
        label.textColor = .black
         label.text = "Pagamento"
         label.font = UIFont(name: "Ubuntu-Regular", size: 15)
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()
    
    
    //MARK: resumeLabel
    private lazy var resumeLabel: UILabel = {
         let label = UILabel()
        label.textColor = .black
         label.text = "Resumo"
         label.font = UIFont(name: "Ubuntu-Bold", size: 15)
         label.translatesAutoresizingMaskIntoConstraints = false

        return label
        
     }()
    
    //MARK: lineImage
    private lazy var lineImage: UIButton = {
       let view = UIButton()
        view.backgroundColor = UIColor(named: "grayAlertLabel")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    
    
    //MARK: TableView Resume
    lazy var tableviewCc: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        return tableview
        
    }()
    
    
    //MARK: CardCreditLabel
        private lazy var cardCreditLabel: UILabel = {
             let label = UILabel()
            label.textColor = .black
             label.text = "Cartão de Crédito"
             label.font = UIFont(name: "Ubuntu-Bold", size: 15)
             label.translatesAutoresizingMaskIntoConstraints = false
            return label
         }()
        
    //MARK: numberCardTextField
        private lazy var numberCardTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    Número do cartão", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
    //MARK: ccValidateExpirationTextfield
        private lazy var ccValidateExpirationTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    Validade", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            view.rightViewMode = .always
            return view
            
        }()
    
    //MARK: accessoryButtonCcValidate
        private lazy var accessoryButtonCcValidate: UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let image = UIImage(systemName: "questionmark.circle.fill")
        view.tintColor = UIColor(named: "blueNav")
        view.setImage(image, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
            
        }()
    
    

    //MARK: sourceSecurityTextfield
        private lazy var sourceSecurityTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    CVV", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: accessoryButtonCcValidate
        private lazy var accessoryButtonSourceSecurity: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "questionmark.circle.fill")
        view.tintColor = UIColor(named: "blueNav")
        view.setImage(image, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
            
        }()
        
    //MARK: countryTextfield
        private lazy var countryButton: UIButton = {
            let view = UIButton()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.addTarget(self, action: #selector(tapAccessoryCc), for: .touchUpInside)
       //     view.attributedPlaceholder = NSAttributedString(string: "    País", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: countryImageFlag
    private lazy var countryImageFlag: UIImageView = {
       let view = UIImageView(image: UIImage(named: "book"))
        view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    //MARK: accessoryButtonCcValidate
        private lazy var accessoryButtonCountryArrow: UIButton = {
        let view = UIButton()
            view.setTitle("SELECIONAR", for: .normal)
            view.tintColor = .black
        view.setImage(UIImage(named: "arrowDown"), for: .normal)
        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.addTarget(self, action: #selector(tapAccessoryCc), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
            
        }()
    
    @objc private func tapAccessoryCc() {
        
        accessoryButtonCountryArrow.isSelected.toggle()
        
        let optionClosure = {(action : UIAction) in
            print(action.title)}
        accessoryButtonCountryArrow.menu = UIMenu(children : [
            UIAction(title: "SELECIONE", state: .on, handler: optionClosure),
            UIAction(title: "R$ 12,00", state: .on, handler: optionClosure),
            UIAction(title: "R$ 15,00", state: .on, handler: optionClosure),
            UIAction(title: "R$ 20,00", state: .on, handler: optionClosure),
            UIAction(title: "R$ 25,00", state: .on, handler: optionClosure),
            UIAction(title: "R$ 35,00",handler: optionClosure)])
        accessoryButtonCountryArrow.showsMenuAsPrimaryAction = true
        accessoryButtonCountryArrow.changesSelectionAsPrimaryAction = true
        
    }
    
    
//        accessoryButtonCountryArrow.showsMenuAsPrimaryAction = true
//        accessoryButtonCountryArrow.changesSelectionAsPrimaryAction = true
//                let optionClosure = {(action : UIAction) in
//                    print(action.title)}
//                accessoryButtonCountryArrow.menu = UIMenu(children : [
//                    UIAction(title: "Brasil", state: .on, handler: optionClosure),
//                    UIAction(title: "Áustria", state: .on, handler: optionClosure),
//                    UIAction(title: "México", state: .on, handler: optionClosure),
//                    ])
                

    
        
    //MARK: nameHolderTextfield
        private lazy var nameHolderTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    Nome Impresso no cartão", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
    //MARK: cpfTextfield
        private lazy var cpfTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    CPF", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: finishButton
        private lazy var finishButton: UIButton = {
            let view = UIButton()
            view.setTitle("Finalizar", for: .normal)
            view.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
            view.setTitleColor(UIColor.systemBackground, for: .normal)
            view.titleLabel?.textAlignment = .center
            view.backgroundColor = UIColor(named: "buttonGray")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
       
        //MARK: SetupConstrains
        private func setupConstrains() {
            
            NSLayoutConstraint.activate([
            
                navWalppapper.topAnchor.constraint(equalTo: view.topAnchor),
                navWalppapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navWalppapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navWalppapper.heightAnchor.constraint(equalToConstant: CGFloat(153).generateSizeForScreen),
           
                
                nameSpace.bottomAnchor.constraint(equalTo: nameLocalPartner.topAnchor, constant: -4),
                nameSpace.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(125).generateSizeForScreen),
                nameSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-125).generateSizeForScreen),
                
                nameLocalPartner.bottomAnchor.constraint(equalTo: navWalppapper.bottomAnchor, constant: -18),
                nameLocalPartner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(103.5).generateSizeForScreen),
                nameLocalPartner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-103.5).generateSizeForScreen),
                
                
                progressBarStackView.stack.topAnchor.constraint(equalTo: navWalppapper.bottomAnchor),
                progressBarStackView.stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                progressBarStackView.stack.heightAnchor.constraint(equalToConstant: CGFloat(67).generateSizeForScreen),
                
                paymentLabel.topAnchor.constraint(equalTo: progressBarStackView.stack.bottomAnchor, constant: 3),
                paymentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                
                lineImage.bottomAnchor.constraint(equalTo: cardCreditLabel.topAnchor, constant: -16),
                lineImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                lineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),

                lineImage.heightAnchor.constraint(equalToConstant: 1),
                
                resumeLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 16),
                resumeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                
                tableviewCc.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 8),
                tableviewCc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                tableviewCc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                tableviewCc.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
                cardCreditLabel.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 24),
                cardCreditLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                      
                numberCardTextfield.topAnchor.constraint(equalTo: cardCreditLabel.bottomAnchor, constant: 15),
                numberCardTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                numberCardTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                numberCardTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                numberCardTextfield.heightAnchor.constraint(equalToConstant: 60),
                
                ccValidateExpirationTextfield.topAnchor.constraint(equalTo: numberCardTextfield.bottomAnchor, constant: 15),
                ccValidateExpirationTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                ccValidateExpirationTextfield.widthAnchor.constraint(equalToConstant: 159),
                ccValidateExpirationTextfield.heightAnchor.constraint(equalToConstant: 60),
                accessoryButtonCcValidate.trailingAnchor.constraint(equalTo: ccValidateExpirationTextfield.trailingAnchor, constant:  -13),
                accessoryButtonCcValidate.centerYAnchor.constraint(equalTo: ccValidateExpirationTextfield.centerYAnchor),
              

                sourceSecurityTextfield.topAnchor.constraint(equalTo: numberCardTextfield.bottomAnchor, constant: 15),
                sourceSecurityTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                sourceSecurityTextfield.widthAnchor.constraint(equalToConstant: 159),
                sourceSecurityTextfield.heightAnchor.constraint(equalToConstant: 60),
                accessoryButtonSourceSecurity.trailingAnchor.constraint(equalTo: sourceSecurityTextfield.trailingAnchor, constant:  -13),
                accessoryButtonSourceSecurity.centerYAnchor.constraint(equalTo: sourceSecurityTextfield.centerYAnchor),
                
                countryButton.topAnchor.constraint(equalTo: ccValidateExpirationTextfield.bottomAnchor, constant: 15),
                countryButton.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                countryButton.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                countryButton.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                countryButton.heightAnchor.constraint(equalToConstant: 60),
                countryImageFlag.trailingAnchor.constraint(equalTo: accessoryButtonCountryArrow.leadingAnchor, constant:  -16),
                countryImageFlag.centerYAnchor.constraint(equalTo: countryButton.centerYAnchor),
                
                
                
                accessoryButtonCountryArrow.trailingAnchor.constraint(equalTo: countryButton.trailingAnchor, constant:  -13),
                accessoryButtonCountryArrow.centerYAnchor.constraint(equalTo: countryButton.centerYAnchor),
            
                
                nameHolderTextfield.topAnchor.constraint(equalTo: countryButton.bottomAnchor, constant: 15),
                nameHolderTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                nameHolderTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                nameHolderTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                nameHolderTextfield.heightAnchor.constraint(equalToConstant: 60),
                
                cpfTextfield.topAnchor.constraint(equalTo: nameHolderTextfield.bottomAnchor, constant: 15),
                cpfTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                cpfTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                cpfTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                cpfTextfield.heightAnchor.constraint(equalToConstant: 60),
                
                finishButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                finishButton.heightAnchor.constraint(equalToConstant: 51),
                

            ])
    
        }
    
    }



    

