//
//  Reservations3-3ViewController.swift
//  Teste
//
//  Created by user220831 on 8/8/22.
//

import Foundation
import UIKit



final class ReservationsThreeViewController: UIViewController {
    
    private var viewModel = ReservationsThreeViewModel()

    private let bravveIcon = UIImageView()
    
    //MARK: LoadView
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        setupConstrains()

        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        numberCardStackView.addGestureRecognizer(stackViewTap)
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
                             numberCardStackView,
                             cardCreditLabel,
                             ccValidateExpirationTextfield,
                             sourceSecurityTextfield,
                             countryField,
                             nameHolderTextfield,
                             cpfTextfield,
                             accessoryButtonCcValidate,
                             accessoryButtonSourceSecurity,
                             countryImageFlag,
                             accessoryButtonCountryArrow,
                             resumeButton,
                             finishButton
                            
                             
                             
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
    private lazy var resumeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "arrowDown"), for: .normal)
        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    
    
    //MARK: numberCardStackView
    
    private lazy var numberCardStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [numberCardLabel, numberCardTextfield])
        let stackMargins: CGFloat = 20
        stack.layoutMargins = UIEdgeInsets(top: stackMargins,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.layer.borderWidth = 0.3
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: numberCardLabel
    private lazy var numberCardLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Ubuntu-Regular", size: 15)
        label.text = "Número do cartão"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
        
    //MARK: numberCardTextField
        private lazy var numberCardTextfield: UITextField = {
            let view = UITextField()
            view.isHidden = true
            view.tag = 1
            view.layer.cornerRadius = 8
            view.backgroundColor = .white
            view.delegate = self
//            view.attributedPlaceholder = NSAttributedString(string: "    Número do cartão", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.layoutMargins = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            
            return view
            
            
        }()
    
    @objc func stackViewTapped() {
            numberCardLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
           

        numberCardTextfield.isHidden = false
        
    }
    
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
        private lazy var countryField: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.addTarget(self, action: #selector(tapAccessoryCc), for: .touchUpInside)
            view.isUserInteractionEnabled = false
            view.attributedPlaceholder = NSAttributedString(string: "    País", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
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
        view.setImage(UIImage(named: "arrowDown"), for: .normal)
        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.addTarget(self, action: #selector(tapAccessoryCc), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
            
        }()
    
    //MARK: TapAcessoryCc
    @objc private func tapAccessoryCc() {
        
        accessoryButtonCountryArrow.isSelected.toggle()
        
        
        
    }
    
                

    
        
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
            view.tag = 2
            view.delegate = self
            view.layer.cornerRadius = 8
            view.layer.borderWidth = 0.3
            view.backgroundColor = .white
            view.attributedPlaceholder = NSAttributedString(string: "    CPF", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "labelTextField") as Any])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: FinishButton
    lazy var finishButton = UIButton()
    
        //MARK: SetupConstrains
        private func setupConstrains() {
            
            NSLayoutConstraint.activate([
            
                //MARK: navWallpapper
                navWalppapper.topAnchor.constraint(equalTo: view.topAnchor),
                navWalppapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navWalppapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navWalppapper.heightAnchor.constraint(equalToConstant: CGFloat(153).generateSizeForScreen),
           
                //MARK: nameSpace
                nameSpace.bottomAnchor.constraint(equalTo: nameLocalPartner.topAnchor, constant: -4),
                nameSpace.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(125).generateSizeForScreen),
                nameSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-125).generateSizeForScreen),
                
                //MARK: nameLocalPartner
                nameLocalPartner.bottomAnchor.constraint(equalTo: navWalppapper.bottomAnchor, constant: -18),
                nameLocalPartner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(103.5).generateSizeForScreen),
                nameLocalPartner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-103.5).generateSizeForScreen),
                
                //MARK: progressBarStackView
                progressBarStackView.stack.topAnchor.constraint(equalTo: navWalppapper.bottomAnchor),
                progressBarStackView.stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                progressBarStackView.stack.heightAnchor.constraint(equalToConstant: CGFloat(67).generateSizeForScreen),
                
                //MARK: paymentLabel
                paymentLabel.topAnchor.constraint(equalTo: progressBarStackView.stack.bottomAnchor, constant: 3),
                paymentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                
                //MARK: lineImage
                lineImage.bottomAnchor.constraint(equalTo: cardCreditLabel.topAnchor, constant: -16),
                lineImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                lineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                lineImage.heightAnchor.constraint(equalToConstant: 1),
                
                //MARK: resumeLabel
                resumeLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 16),
                resumeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                
                //MARK: tableViewCc
                tableviewCc.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 8),
                tableviewCc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                tableviewCc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                tableviewCc.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
                //MARK: cardCreditLabel
                cardCreditLabel.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 24),
                cardCreditLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                      
                //MARK: numberCardStackView
                numberCardStackView.topAnchor.constraint(equalTo: cardCreditLabel.bottomAnchor, constant: 15),
                numberCardStackView.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                numberCardStackView.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                numberCardStackView.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                numberCardStackView.heightAnchor.constraint(equalToConstant: 60),
                
                
                
       //       numberCardTextfield.heightAnchor.constraint(equalTo: numberCardStackView.heightAnchor, multiplier: 1),
                
                
//                numberCardTextfield.topAnchor.constraint(equalTo: cardCreditLabel.bottomAnchor, constant: 15),
//                numberCardTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
//                numberCardTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
//                numberCardTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
//                numberCardTextfield.heightAnchor.constraint(equalToConstant: 60),
                
                //MARK: ccValidateExpirationTextField
                ccValidateExpirationTextfield.topAnchor.constraint(equalTo: numberCardStackView.bottomAnchor, constant: 15),
                ccValidateExpirationTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                ccValidateExpirationTextfield.widthAnchor.constraint(equalToConstant: 159),
                ccValidateExpirationTextfield.heightAnchor.constraint(equalToConstant: 60),
                accessoryButtonCcValidate.trailingAnchor.constraint(equalTo: ccValidateExpirationTextfield.trailingAnchor, constant:  -13),
                accessoryButtonCcValidate.centerYAnchor.constraint(equalTo: ccValidateExpirationTextfield.centerYAnchor),
              
                //MARK: sourceSecurityTextfield
                sourceSecurityTextfield.topAnchor.constraint(equalTo: numberCardStackView.bottomAnchor, constant: 15),
                sourceSecurityTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                sourceSecurityTextfield.widthAnchor.constraint(equalToConstant: 159),
                sourceSecurityTextfield.heightAnchor.constraint(equalToConstant: 60),
                accessoryButtonSourceSecurity.trailingAnchor.constraint(equalTo: sourceSecurityTextfield.trailingAnchor, constant:  -13),
                accessoryButtonSourceSecurity.centerYAnchor.constraint(equalTo: sourceSecurityTextfield.centerYAnchor),
                
                //MARK: countryField
                countryField.topAnchor.constraint(equalTo: ccValidateExpirationTextfield.bottomAnchor, constant: 15),
                countryField.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                countryField.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                countryField.heightAnchor.constraint(equalToConstant: 60),
                
                countryImageFlag.trailingAnchor.constraint(equalTo: accessoryButtonCountryArrow.leadingAnchor, constant:  -16),
                countryImageFlag.centerYAnchor.constraint(equalTo: countryField.centerYAnchor),
                
                //MARK: acessoryButtonContryArrow
                accessoryButtonCountryArrow.trailingAnchor.constraint(equalTo: countryField.trailingAnchor,constant: -12.36),
                accessoryButtonCountryArrow.centerYAnchor.constraint(equalTo: countryField.centerYAnchor),
                accessoryButtonCountryArrow.widthAnchor.constraint(equalToConstant: 13.3),
                accessoryButtonCountryArrow.heightAnchor.constraint(equalToConstant: 7.66),
                
                //MARK: resumeButton
                resumeButton.leadingAnchor.constraint(equalTo: resumeLabel.trailingAnchor,constant: 6),
                resumeButton.centerYAnchor.constraint(equalTo: resumeLabel.centerYAnchor),
                
                
            
                //MARK: nameHolderTextfield
                nameHolderTextfield.topAnchor.constraint(equalTo: countryField.bottomAnchor, constant: 15),
                nameHolderTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                nameHolderTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                nameHolderTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                nameHolderTextfield.heightAnchor.constraint(equalToConstant: 60),
                
                //MARK: cpfTextfield
                cpfTextfield.topAnchor.constraint(equalTo: nameHolderTextfield.bottomAnchor, constant: 15),
                cpfTextfield.centerXAnchor.constraint(equalTo: tableviewCc.centerXAnchor),
                cpfTextfield.leadingAnchor.constraint(equalTo: tableviewCc.leadingAnchor),
                cpfTextfield.trailingAnchor.constraint(equalTo: tableviewCc.trailingAnchor),
                cpfTextfield.heightAnchor.constraint(equalToConstant: 60),
                

            ])
    
            //MARK: finishButton
            finishButton.setToBottomButtonKeyboardDefault()
          
        }
    
    }

extension ReservationsThreeViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }
    
    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        switch textField?.tag{
        case 1:
            textField?.text = textField?.text?.formatMask(mask: "####.####.####.####")
        case 2:
            textField?.text = textField?.text?.formatMask(mask: "###.###.###-##")
        case 3:
            textField?.text = textField?.text?.formatMask(mask: "###.###.###-##")
        default:
            break
        }
    }
}

extension String {
    
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        
        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    func clearFormatMask() -> String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}





    

