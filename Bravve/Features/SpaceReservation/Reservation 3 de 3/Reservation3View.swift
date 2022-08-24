
//
//  Reserva3View.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation
import UIKit

final class ReservationsThreeViewController: UIViewController {
    
    //MARK: - preferredStatusBarStyle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
        
        
    }
    
    
    //MARK: - var and let
    private let alertCc = CustomAlert()
    private let alertSource = CustomAlert()
    private let bravveIcon = UIImageView()
    private let viewModel = ReservationsViewModel()
    
    //MARK: FinishButton
    let finishButton = UIButton()
    

       
        //MARK: - NavWallpapper
        private lazy var navWalppapper: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: ImagesBravve.imageReservsNav.rawValue)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleToFill
           return view
        }()
    
    
    //MARK: - backButton
            private lazy var backButton: UIButton = {
               let button = UIButton()
                button.setImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
                button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()
        
        //MARK: - NameSpace
       private lazy var nameSpace: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
            label.text = "Nome do espaço"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.white_white.rawValue)
           return label
        }()
        
    //MARK: - NameLocalPartner
       private lazy var nameLocalPartner: UILabel = {
            let label = UILabel()
           label.textAlignment = .center
            label.text = "Nome do local parceiro"
            label.font = UIFont(name: FontsBravve.regular.rawValue, size: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: ColorsBravve.white_white.rawValue)
           return label
        }()
    
    //MARK: - ProgressBarStackView
    private lazy var progressBarStackView: (stack: UIStackView,
                                            buttons: [UIButton]) = {

        let buttons = createProgressBarButtons([IconsBravve.walletGray.rawValue, IconsBravve.calendarGray.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditBlue.rawValue])
        
        buttons[3].setTitle("  Pagamento", for: .normal)
        
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
        
       
    
    //MARK: - paymentLabel
    private lazy var paymentLabel: UILabel = {
         let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.text = "Pagamento"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
     }()
    
    
    //MARK: - resumeLabel
    private lazy var resumeLabel: UILabel = {
         let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.text = "Resumo"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
     }()
    
    //MARK: - resumeButton
    private lazy var resumeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - lineImage
    private lazy var lineImage: UIImageView = {
       let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    //MARK: - imageBack Resume
    lazy var imageBack: UIImageView = {
        let tableview = UIImageView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        return tableview
    }()
    
    
    //MARK: - CardCreditLabel
        private lazy var cardCreditLabel: UILabel = {
             let label = UILabel()
            label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
             label.text = "Cartão de Crédito"
            label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
             label.translatesAutoresizingMaskIntoConstraints = false
            return label
         }()
    
    
    
    //MARK: - numberCardStackView
    private lazy var numberCardStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [numberCardLabel, numberCardTextfield])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - numberCardLabel
    private lazy var numberCardLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "Número do cartão"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    //MARK: - numberCardTextField
        private lazy var numberCardTextfield: UITextField = {
            let view = UITextField()
            view.becomeFirstResponder()
            view.isHidden = true
            view.tag = 1
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.delegate = self
            view.addTarget(self, action: #selector(numberTfEmpity), for: .editingChanged)
            view.layoutMargins = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: - ccValidateStackView
    private lazy var ccValidateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ccValidateLabel, ccValidateExpirationTextfield,accessoryButtonCcValidate])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - numberCardLabel
    private lazy var ccValidateLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "Validade"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - ccValidateExpirationTextfield
        private lazy var ccValidateExpirationTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.isHidden = true
            view.tag = 3
            view.delegate = self
            view.addTarget(self, action: #selector(ccEmpity), for: .editingChanged)
            view.layoutMargins = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.rightViewMode = .always
            return view
        }()
    

    //MARK: - accessoryButtonCcValidate
        private lazy var accessoryButtonCcValidate: UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let image = UIImage(named: IconsBravve.questionCircleBlue_1.rawValue)
        view.setImage(image, for: .normal)
            view.addTarget(self, action: #selector(tapCc), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    //MARK: - sourceSecutiryStackView
    private lazy var sourceSecurityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [sourceSecurityLabel, sourceSecurityTextfield])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - sourceSecurityLabel
    private lazy var sourceSecurityLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "CVV"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - sourceSecurityTextfield
        private lazy var sourceSecurityTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.isHidden = true
            view.delegate = self
            view.tag = 5
            view.addTarget(self, action: #selector(sourceEmpity), for: .editingChanged)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    
    //MARK: - accessoryButtonSourceSecurity
        private lazy var accessoryButtonSourceSecurity: UIButton = {
        let view = UIButton()
        let image = UIImage(named: IconsBravve.questionCircleBlue_1.rawValue)
        view.setImage(image, for: .normal)
        view.addTarget(self, action: #selector(tapAcessorySource), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    //MARK: - contryStackView
    private lazy var countryStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countryLabel, countryField])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: countryLabel
    private lazy var countryLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "País"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    //MARK: - countryTextfield
        private lazy var countryField: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.isHidden = true
            view.addTarget(self, action: #selector(countryEmpity), for: .editingChanged)
            view.isUserInteractionEnabled = false
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    
    
    //MARK: - accessoryButtonCountryArrow
        private lazy var accessoryButtonCountryArrow: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
            
        }()
    
    
 
    //MARK: - nameHolderStackView
    private lazy var nameHolderStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameHolderLabel, nameHolderTextfield])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - nameHolderLabel
    private lazy var nameHolderLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "Nome impresso no cartão"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - nameHolderTextfield
        private lazy var nameHolderTextfield: UITextField = {
            let view = UITextField()
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.tag = 4
            view.isHidden = true
            view.addTarget(self, action: #selector(nameHolderEmpity), for: .editingChanged)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    

    //MARK: - cpfStackView
    private lazy var cpfStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cpfLabel, cpfTextfield])
        
        let stackTop: CGFloat = 12
        let stackLeft: CGFloat = 16
        let stackRight: CGFloat = 16
        let stackBottom: CGFloat = 16
        stack.layoutMargins = UIEdgeInsets(top: stackTop,
                                           left: stackLeft,
                                           bottom: stackRight,
                                           right: stackBottom)
        stack.spacing = 2
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: cpfLabel
    private lazy var cpfLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "CPF"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    //MARK: cpfTextfield
        private lazy var cpfTextfield: UITextField = {
            let view = UITextField()
            view.tag = 2
            view.delegate = self
            view.layer.cornerRadius = 8
            view.isHidden = true
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.addTarget(self, action: #selector(cpfEmpity), for: .editingChanged)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
   
   
    //MARK: - LoadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        setupView()
        setupConstrains()
        
        let numberStackViewTap = UITapGestureRecognizer(target: self, action: #selector(numberStackViewTapped))
        numberCardStackView.addGestureRecognizer(numberStackViewTap)
        
        let ccStackViewTap = UITapGestureRecognizer(target: self, action: #selector(ccValidatestackViewTapped))
        ccValidateStackView.addGestureRecognizer(ccStackViewTap)
        
        let countryStackViewTap = UITapGestureRecognizer(target: self, action: #selector(countryStackViewTapped))
        accessoryButtonCountryArrow.addGestureRecognizer(countryStackViewTap)
        
        let sourceSecutiryStackViewTap = UITapGestureRecognizer(target: self, action: #selector(sourceSecutirytackViewTapped))
        sourceSecurityStackView.addGestureRecognizer(sourceSecutiryStackViewTap)
        
        let nameHolderStackViewTap = UITapGestureRecognizer(target: self, action: #selector(nameHolderStackViewTapped))
        nameHolderStackView.addGestureRecognizer(nameHolderStackViewTap)
        
        let cpfStackViewTap = UITapGestureRecognizer(target: self, action: #selector(cpfStackViewTapped))
        cpfStackView.addGestureRecognizer(cpfStackViewTap)
        
        
    }
    
    //MARK: - SetupView
    private func setupView() {
        view.addSubviews([navWalppapper,
                          backButton,
                          nameSpace,
                          nameLocalPartner,
                          progressBarStackView.stack,
                          paymentLabel,
                          lineImage,
                          resumeLabel,
                          imageBack,
                          numberCardStackView,
                          cardCreditLabel,
                          ccValidateStackView,
                          sourceSecurityStackView,
                          countryStackView,
                          nameHolderStackView,
                          cpfStackView,
                          accessoryButtonCcValidate,
                          accessoryButtonSourceSecurity,
                          countryImageFlag,
                          accessoryButtonCountryArrow,
                          resumeButton,
                          finishButton
                         ])
        
        
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        
    }
    
    
    
    //MARK: actions and methods
    
    
    //MARK: numberTfEmpity
    @objc private func tapBackButton() {
        self.dismiss(animated: true)
        }

    //MARK: numberTfEmpity
    @objc private func numberTfEmpity()  {
        if numberCardTextfield.text!.count >= 19 {
            numberCardStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        } else {
            numberCardStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - numberStackViewTapped
    @objc func numberStackViewTapped() {
        numberCardLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
           
        numberCardTextfield.isHidden = false
        numberCardTextfield.becomeFirstResponder()
    }
    
    
    //MARK: - ccEmpity
    @objc private func ccEmpity()  {
        if ccValidateExpirationTextfield.text!.count >= 4 {
            ccValidateStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        } else {
            ccValidateStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - ccValidatestackViewTapped
    @objc func ccValidatestackViewTapped() {
        ccValidateLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        
        ccValidateExpirationTextfield.isHidden = false
        ccValidateExpirationTextfield.becomeFirstResponder()
        
    }
    
    @objc func tapCc() {
        alertCc.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue),
                          message: "A data de validade se encontra na mesma área que o número do cartão.",
                          enterAttributed: "Entendi",
                          enterHandler: nil,
                          cancelAttributed: nil,
                          cancelHandler: nil,
                          on: self)
    }
    
    //MARK: - sourceEmpity
    @objc private func sourceEmpity()  {
        if sourceSecurityTextfield.text!.count >= 3 {
            sourceSecurityStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        } else {
            sourceSecurityStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - sourceSecutiryStackViewTapped
    @objc func sourceSecutirytackViewTapped() {
        sourceSecurityLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        
        sourceSecurityTextfield.isHidden = false
        sourceSecurityTextfield.becomeFirstResponder()
        
    }
    
    
    //MARK: - tapAcessorySource
    @objc private func tapAcessorySource() {
        alertSource.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue),
                              message: "CVV é um número de 3 dígitos que se encontra na mesma área que o número do cartão.",
                              enterAttributed: "Entendi",
                              enterHandler: nil,
                              cancelAttributed: nil,
                              cancelHandler: nil,
                              on: self)
    }

    //MARK: - countryEmpity
    @objc private func countryEmpity()  {
        countryStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        
    }
    
    //MARK: countryImageFlag
    private lazy var countryImageFlag: UIImageView = {
       let view = UIImageView(image: UIImage(named: "book"))
        view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: ccValidatestackViewTapped
    @objc func countryStackViewTapped() {
        countryLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
           
        countryField.isHidden = false
        countryField.becomeFirstResponder()
        
    }
    

    //MARK: - nameHolderEmpity
    @objc private func nameHolderEmpity()  {
        if nameHolderTextfield.text!.count >= 6 {
            nameHolderStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        } else {
            nameHolderStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: nameHoldertackViewTapped
    @objc func nameHolderStackViewTapped() {
        nameHolderLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
        
        nameHolderTextfield.isHidden = false
        nameHolderTextfield.becomeFirstResponder()
    }
    
    
    //MARK: - cpfEmpity
    @objc private func cpfEmpity()  {
        if cpfTextfield.text!.count >= 14 {
            cpfStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
            finishButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        } else {
            cpfStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
            finishButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        }
    }
    
    //MARK: cpfStackViewTapped
    @objc func cpfStackViewTapped() {
        cpfLabel.font = UIFont(name: FontsBravve.light.rawValue, size: 11)
           
        cpfTextfield.isHidden = false
        cpfTextfield.becomeFirstResponder()
        
    }
    
    
    //MARK: - finishButtonTapped
    @objc func finishButtonTapped() {
        let reservationcompletedview = ReservationCompletedView()
            reservationcompletedview.modalPresentationStyle = .fullScreen
            present(reservationcompletedview, animated: true)

    }
    
    
    
        //MARK: - SetupConstrains
        private func setupConstrains() {
            
            NSLayoutConstraint.activate([
            
                //MARK: navWallpapper
                navWalppapper.topAnchor.constraint(equalTo: view.topAnchor),
                navWalppapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navWalppapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navWalppapper.heightAnchor.constraint(equalToConstant: CGFloat(153).generateSizeForScreen),
           
                
                
                //MARK: backButton
                backButton.centerYAnchor.constraint(equalTo:navWalppapper.centerYAnchor),
                backButton.leadingAnchor.constraint(equalTo: navWalppapper.leadingAnchor, constant: CGFloat(32).generateSizeForScreen),
                backButton.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
                backButton.widthAnchor.constraint(equalToConstant: CGFloat(8.48).generateSizeForScreen),


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
                imageBack.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 8),
                imageBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
                imageBack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                imageBack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
                //MARK: cardCreditLabel
                cardCreditLabel.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 24),
                cardCreditLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                      
                //MARK: numberCardStackView
                numberCardStackView.topAnchor.constraint(equalTo: cardCreditLabel.bottomAnchor, constant: 15),
                numberCardStackView.centerXAnchor.constraint(equalTo: imageBack.centerXAnchor),
                numberCardStackView.leadingAnchor.constraint(equalTo: imageBack.leadingAnchor),
                numberCardStackView.trailingAnchor.constraint(equalTo: imageBack.trailingAnchor),
                numberCardStackView.heightAnchor.constraint(equalToConstant: 60),
                
                
                //MARK: ccValidateExpirationTextField
                ccValidateStackView.topAnchor.constraint(equalTo: numberCardStackView.bottomAnchor, constant: 15),
                ccValidateStackView.leadingAnchor.constraint(equalTo: imageBack.leadingAnchor),
                ccValidateStackView.heightAnchor.constraint(equalToConstant: 60),
                ccValidateStackView.widthAnchor.constraint(equalToConstant: 159),
                accessoryButtonCcValidate.trailingAnchor.constraint(equalTo: ccValidateStackView.trailingAnchor, constant:  -13),
                accessoryButtonCcValidate.centerYAnchor.constraint(equalTo: ccValidateStackView.centerYAnchor),
              
                //MARK: sourceSecurityTextfield
                sourceSecurityStackView.topAnchor.constraint(equalTo: numberCardStackView.bottomAnchor, constant: 15),
                sourceSecurityStackView.trailingAnchor.constraint(equalTo: imageBack.trailingAnchor),
                sourceSecurityStackView.heightAnchor.constraint(equalToConstant: 60),
                sourceSecurityStackView.widthAnchor.constraint(equalToConstant: 159),
                accessoryButtonSourceSecurity.trailingAnchor.constraint(equalTo: sourceSecurityStackView.trailingAnchor, constant:  -13),
                accessoryButtonSourceSecurity.centerYAnchor.constraint(equalTo: sourceSecurityStackView.centerYAnchor),
                
                //MARK: countryField
                countryStackView.topAnchor.constraint(equalTo: ccValidateStackView.bottomAnchor, constant: 15),
                countryStackView.leadingAnchor.constraint(equalTo: imageBack.leadingAnchor),
                countryStackView.trailingAnchor.constraint(equalTo: imageBack.trailingAnchor),
                countryStackView.heightAnchor.constraint(equalToConstant: 60),
                
                countryImageFlag.trailingAnchor.constraint(equalTo: accessoryButtonCountryArrow.leadingAnchor, constant:  -16),
                countryImageFlag.centerYAnchor.constraint(equalTo: countryStackView.centerYAnchor),
                
                //MARK: acessoryButtonContryArrow
                accessoryButtonCountryArrow.trailingAnchor.constraint(equalTo: countryStackView.trailingAnchor,constant: -12.36),
                accessoryButtonCountryArrow.centerYAnchor.constraint(equalTo: countryStackView.centerYAnchor),
                accessoryButtonCountryArrow.widthAnchor.constraint(equalToConstant: 13.3),
                accessoryButtonCountryArrow.heightAnchor.constraint(equalToConstant: 7.66),
                
                //MARK: resumeButton
                resumeButton.leadingAnchor.constraint(equalTo: resumeLabel.trailingAnchor,constant: 6),
                resumeButton.centerYAnchor.constraint(equalTo: resumeLabel.centerYAnchor),
                
                
            
                //MARK: nameHolderTextfield
                nameHolderStackView.topAnchor.constraint(equalTo: countryStackView.bottomAnchor, constant: 15),
                nameHolderStackView.centerXAnchor.constraint(equalTo: imageBack.centerXAnchor),
                nameHolderStackView.leadingAnchor.constraint(equalTo: imageBack.leadingAnchor),
                nameHolderStackView.trailingAnchor.constraint(equalTo: imageBack.trailingAnchor),
                nameHolderStackView.heightAnchor.constraint(equalToConstant: 60),
                
                //MARK: cpfTextfield
                cpfStackView.topAnchor.constraint(equalTo: nameHolderStackView.bottomAnchor, constant: 15),
                cpfStackView.centerXAnchor.constraint(equalTo: imageBack.centerXAnchor),
                cpfStackView.leadingAnchor.constraint(equalTo: imageBack.leadingAnchor),
                cpfStackView.trailingAnchor.constraint(equalTo: imageBack.trailingAnchor),
                cpfStackView.heightAnchor.constraint(equalToConstant: 60),
                

            ])
    
            //MARK: finishButton
            finishButton.setToBottomButtonKeyboardDefault()
            finishButton.setTitle("Finalizar", for: .normal)
          
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
            textField?.text = textField?.text?.formatMask(mask: "##/##")
        case 4:
            textField?.text = textField?.text?.uppercased()
        case 5:
            textField?.text = textField?.text?.formatMask(mask: "####")
        default:
            break
        }
    }
}



extension UIStackView {
    func setBottomBorderOnlyWithBlue(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = CGColor(red: 26/255, green: 23/255, blue: 80/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.03
        
    }
}

extension UIStackView {
    func setBottomBorderOnlyWithRed(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = CGColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.03
        
    }
}






    


