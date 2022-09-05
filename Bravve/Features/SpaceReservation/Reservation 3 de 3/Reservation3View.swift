//
//  Reserva3View.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

final class ReservationsThreeViewController: UIViewController, UIScrollViewDelegate {
    
    private var alltxtFieldsReservation: [UITextField] = []
    private var currentTextFieldPositon: Int = 0
    
    
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
    private let finishButton = UIButton()
    
    //MARK: alertLabels
    
    //MARK: - tip1
    let tip1: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = "Formato de número inválido"
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    //MARK: - tip2
    let tip2: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    //MARK: - tip3
    let tip3: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    //MARK: - tip4
    let tip4: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    //MARK: - tip5
    let tip5: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    
    //MARK: - tip6
    let tip6: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(11).generateSizeForScreen)
        label.text = ""
        label.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
        return label
    }()
    
    //MARK: - Buttons
    private lazy var  buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.walletGray.rawValue, IconsBravve.calendarGray.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditBlue.rawValue])
        
        buttons[3].setTitle("Pagamento", for: .normal)
        
        let tripleDismissHandler = {(action: UIAction) in
            if let reservation2 = self.presentingViewController,
               let singleBooking = reservation2.presentingViewController,
               let workPassBooking = singleBooking.presentingViewController{
                
                reservation2.view.isHidden = true
                singleBooking.view.isHidden = true
                workPassBooking.dismiss(animated: false)
            }
        }
        
        let doubleDismissHandler = {(action: UIAction) in
            
            if let singleBooking = self.presentingViewController,
               let workPassBooking = singleBooking.presentingViewController {
                
                singleBooking.view.isHidden = true
                workPassBooking.dismiss(animated: false)
            }
        }
        
        let dismissHandler = {(action: UIAction) in
            
            self.dismiss(animated: false)
        }
        
        buttons[0].addAction(UIAction(handler: tripleDismissHandler), for: .touchUpInside)
        buttons[1].addAction(UIAction(handler: doubleDismissHandler), for: .touchUpInside)
        buttons[2].addAction(UIAction(handler: dismissHandler), for: .touchUpInside)
        
        return buttons
    }()
    
    //MARK: - resumeLabel
    private lazy var resumeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.text = "Resumo"
        label.font = UIFont(name: FontsBravve.bold.rawValue,
                            size: CGFloat(15).generateSizeForScreen)
        return label
        
    }()
    
    //MARK: - resumeButton
    private lazy var resumeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        return view
    }()
    
    //MARK: - lineImage
    private lazy var lineImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        return view
    }()
    
    //MARK: - imageBack Resume
    lazy var imageBack: UIImageView = {
        let tableview = UIImageView()
        tableview.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        return tableview
    }()
    
    //MARK: - numberCardStackView
    private lazy var numberCardStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [numberCardLabel, numberCardTextfield])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: - numberCardLabel
    private lazy var numberCardLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(15).generateSizeForScreen)
        label.text = "Número do cartão"
        return label
    }()
    
    //MARK: - numberCardTextField
    private lazy var numberCardTextfield: UITextField = {
        let view = UITextField()
        view.becomeFirstResponder()
        view.isHidden = true
        view.tag = 1
        view.keyboardType = .namePhonePad
        view.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.delegate = self
        view.addTarget(self, action: #selector(numberTfEmpity), for: .editingChanged)
        view.addTarget(self, action: #selector(withdrawNumberCardBoder), for: .editingDidEnd)
        view.layoutMargins = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return view
    }()
    
    
    
    //MARK: - ccValidateStackView
    private lazy var ccValidateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ccValidateLabel, ccValidateExpirationTextfield,accessoryButtonCcValidate])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: - numberCardLabel
    private lazy var ccValidateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(15).generateSizeForScreen)
        label.text = "Validade"
        return label
    }()
    
    //MARK: - ccValidateExpirationTextfield
    private lazy var ccValidateExpirationTextfield: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.isHidden = true
        view.tag = 3
        view.keyboardType = .namePhonePad
        view.delegate = self
        view.addTarget(self, action: #selector(ccEmpity), for: .editingChanged)
        view.addTarget(self, action: #selector(withdrawCcBoder), for: .editingDidEnd)
        view.layoutMargins = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        view.rightViewMode = .always
        return view
    }()
    
    //MARK: - accessoryButtonCcValidate
    private lazy var accessoryButtonCcValidate: UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let image = UIImage(named: IconsBravve.questionCircleBlue_1.rawValue)
        view.setImage(image, for: .normal)
        view.addTarget(self, action: #selector(tapCc), for: .touchUpInside)
        return view
    }()
    
    //MARK: - sourceSecutiryStackView
    private lazy var sourceSecurityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [sourceSecurityLabel, sourceSecurityTextfield])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: - sourceSecurityLabel
    private lazy var sourceSecurityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "CVV"
        return label
    }()
    
    //MARK: - sourceSecurityTextfield
    private lazy var sourceSecurityTextfield: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.isHidden = true
        view.delegate = self
        view.tag = 5
        view.keyboardType = .namePhonePad
        view.addTarget(self, action: #selector(sourceEmpity), for: .editingChanged)
        view.addTarget(self, action: #selector(withdrawSourceBoder), for: .editingDidEnd)
        return view
    }()
    
    
    
    //MARK: - accessoryButtonSourceSecurity
    private lazy var accessoryButtonSourceSecurity: UIButton = {
        
        let view = UIButton()
        let image = UIImage(named: IconsBravve.questionCircleBlue_1.rawValue)
        view.setImage(image, for: .normal)
        view.addTarget(self, action: #selector(tapAcessorySource), for: .touchUpInside)
        return view
    }()
    
    //MARK: - contryStackView
    private lazy var countryStackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [countryLabel2, countryLabel])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: countryLabel
    private lazy var countryLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textAlignment = .left
        label.text = "País"
        return label
    }()
    
    //MARK: countryLabel2
    private lazy var countryLabel2: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textAlignment = .left
        label.text = "País"
        label.isHidden = true
        return label
    }()
    
    //MARK: countryDropDown
    private lazy var countryDropDown: UIScrollView = {
        
        let drop = UIScrollView()
        
        var buttons = [UIButton]()
        let countrys = ["Brasil", "Áustria", "México"]
        
        for country in countrys {
            
            let button = UIButton()
            button.setTitle(country, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.black_black.rawValue),
                                 for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                             size: CGFloat(14).generateSizeForScreen)
            
            let handler = {(action: UIAction) in
                
                self.countryLabel.text = button.currentTitle
                self.countryLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
                self.countryDropDown.frame.size = .zero
                
                if button.currentTitle == "Brasil"{
                    self.countryImageFlag.image = UIImage(named: IconsBravve.flag.rawValue)
                }else{
                    self.countryImageFlag.image = UIImage(named: IconsBravve.map.rawValue)
                    
                }
            }
            button.addTarget(self, action: #selector(hiddenLabel), for: .touchUpInside)
            button.titleLabel?.textAlignment = .left
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            buttons.append(button)
            
            
            
        }
        drop.turnIntoAList(buttons)
        drop.delegate = self
        
        return drop
    }()
    
    
    //MARK: - hiddenLabel
    @objc func hiddenLabel() {
        countryLabel2.isHidden = false
        countryStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        
    }
    
    @objc func withdrawCountryBorder() {
        self.countryStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
        
    }
    
    
    //MARK: - accessoryButtonCountryArrow
    private lazy var accessoryButtonCountryArrow: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        view.addTarget(self, action: #selector(tapCountryDown), for: .touchUpInside)
        return view
    }()
    
    
    @objc func tapCountryDown() {
        
        countryDropDown.showLikeAWindow(size: CGSize(width: countryStackView.frame.size.width,
                                                     height: CGFloat(180).generateSizeForScreen),
                                        origin: CGPoint(x: countryStackView.frame.maxX,
                                                        y: countryStackView.frame.maxY),
                                        .downLeft)
        
    }
    
    
    //MARK: - nameHolderStackView
    private lazy var nameHolderStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameHolderLabel, nameHolderTextfield])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    
    //MARK: - nameHolderLabel
    private lazy var nameHolderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "Nome impresso no cartão"
        return label
    }()
    
    //MARK: - nameHolderTextfield
    private lazy var nameHolderTextfield: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.tag = 4
        view.keyboardType = .namePhonePad
        view.delegate = self
        view.isHidden = true
        view.addTarget(self, action: #selector(nameHolderEmpity), for: .editingChanged)
        view.addTarget(self, action: #selector(withdrawNameHolderBoder), for: .editingDidEnd)
        return view
    }()
    
    //MARK: - cpfStackView
    private lazy var cpfStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cpfLabel, cpfTextfield])
        
        let stackTopMargin = CGFloat(12).generateSizeForScreen
        let stackMargins = CGFloat(16).generateSizeForScreen
        
        stack.layoutMargins = UIEdgeInsets(top: stackTopMargin,
                                           left: stackMargins,
                                           bottom: stackMargins,
                                           right: stackMargins)
        stack.spacing = CGFloat(2).generateSizeForScreen
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: cpfLabel
    private lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.text = "CPF"
        return label
    }()
    
    //MARK: cpfTextfield
    private lazy var cpfTextfield: UITextField = {
        let view = UITextField()
        view.tag = 2
        view.delegate = self
        view.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        view.isHidden = true
        view.keyboardType = .namePhonePad
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.addTarget(self, action: #selector(cpfEmpity), for: .editingChanged)
        view.addTarget(self, action: #selector(withdrawCpfBoder), for: .editingDidEnd)
        return view
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    private lazy var scrollView: UIScrollView = {
        
        let paymentLabel = UILabel()
        paymentLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        paymentLabel.text = "Pagamento"
        paymentLabel.textAlignment = .left
        paymentLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                   size: CGFloat(15).generateSizeForScreen)
        
        let cardCreditLabel = UILabel()
        cardCreditLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        cardCreditLabel.text = "Cartão de Crédito"
        cardCreditLabel.textAlignment = .left
        cardCreditLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                      size: CGFloat(15).generateSizeForScreen)
        
        let viewToScroll = UIView()
        
        viewToScroll.addSubviews([paymentLabel, resumeLabel, resumeButton, lineImage, cardCreditLabel, numberCardStackView, ccValidateStackView, sourceSecurityStackView, countryStackView, nameHolderStackView, cpfStackView, accessoryButtonSourceSecurity, accessoryButtonCcValidate, accessoryButtonCountryArrow, countryImageFlag, countryDropDown])
        
        let spacing = CGFloat(15).generateSizeForScreen
        
        paymentLabel.constraintInsideTo(.top, viewToScroll)
        paymentLabel.constraintInsideTo(.leading, viewToScroll,
                                        CGFloat(20).generateSizeForScreen)
        paymentLabel.constraintInsideTo(.trailing, viewToScroll,
                                        CGFloat(20).generateSizeForScreen)
        
        resumeLabel.constraintOutsideTo(.top, paymentLabel, spacing)
        resumeLabel.constraintInsideTo(.leading, paymentLabel)
        
        resumeButton.constraintOutsideTo(.leading, resumeLabel,
                                         CGFloat(5).generateSizeForScreen)
        resumeButton.constraintInsideTo(.centerY, resumeLabel)
        
        lineImage.constraintOutsideTo(.top, resumeLabel,
                                      CGFloat(5).generateSizeForScreen)
        lineImage.constraintInsideTo(.leading, paymentLabel)
        lineImage.constraintInsideTo(.trailing, paymentLabel)
        lineImage.heightAnchorInSuperview(CGFloat(1).generateSizeForScreen)
        
        cardCreditLabel.constraintOutsideTo(.top, lineImage, spacing)
        cardCreditLabel.constraintInsideTo(.leading, paymentLabel)
        cardCreditLabel.constraintInsideTo(.trailing, paymentLabel)
        
        numberCardStackView.constraintOutsideTo(.top, cardCreditLabel, spacing)
        numberCardStackView.constraintInsideTo(.leading, paymentLabel)
        numberCardStackView.constraintInsideTo(.trailing, paymentLabel)
        numberCardStackView.heightAnchorInSuperview(CGFloat(60).generateSizeForScreen)
        
        ccValidateStackView.constraintOutsideTo(.top, numberCardStackView, spacing)
        ccValidateStackView.constraintInsideTo(.leading, paymentLabel)
        ccValidateStackView.constraintInsideTo(.bottom, sourceSecurityStackView)
        ccValidateStackView.constraintInsideTo(.width, numberCardStackView, multiplier: 0.475)
        ccValidateStackView.constraintInsideTo(.height, numberCardStackView)
        
        accessoryButtonCcValidate.constraintInsideTo(.trailing, ccValidateStackView,
                                                     CGFloat(15).generateSizeForScreen)
        accessoryButtonCcValidate.constraintInsideTo(.centerY, ccValidateStackView)
        
        sourceSecurityStackView.constraintInsideTo(.top, ccValidateStackView)
        sourceSecurityStackView.constraintInsideTo(.trailing, paymentLabel)
        sourceSecurityStackView.constraintInsideTo(.width, ccValidateStackView)
        sourceSecurityStackView.constraintInsideTo(.height, numberCardStackView)
        
        accessoryButtonSourceSecurity.constraintInsideTo(.trailing, sourceSecurityStackView,
                                                         CGFloat(15).generateSizeForScreen)
        accessoryButtonSourceSecurity.constraintInsideTo(.centerY, sourceSecurityStackView)
        
        countryStackView.constraintOutsideTo(.top, sourceSecurityStackView, spacing)
        countryStackView.constraintInsideTo(.leading, paymentLabel)
        countryStackView.constraintInsideTo(.trailing, paymentLabel)
        countryStackView.constraintInsideTo(.height, numberCardStackView)
        
        accessoryButtonCountryArrow.constraintInsideTo(.trailing, countryStackView,
                                                       CGFloat(15).generateSizeForScreen)
        accessoryButtonCountryArrow.constraintInsideTo(.centerY, countryStackView)
        
        countryImageFlag.constraintOutsideTo(.trailing, accessoryButtonCountryArrow, spacing)
        countryImageFlag.constraintInsideTo(.centerY, countryStackView)
        
        nameHolderStackView.constraintOutsideTo(.top, countryStackView, spacing)
        nameHolderStackView.constraintInsideTo(.leading, paymentLabel)
        nameHolderStackView.constraintInsideTo(.trailing, paymentLabel)
        nameHolderStackView.constraintInsideTo(.height, numberCardStackView)
        
        cpfStackView.constraintOutsideTo(.top, nameHolderStackView, spacing)
        cpfStackView.constraintInsideTo(.leading, paymentLabel)
        cpfStackView.constraintInsideTo(.trailing, paymentLabel)
        cpfStackView.constraintInsideTo(.bottom, viewToScroll,
                                        CGFloat(50).generateSizeForScreen)
        cpfStackView.constraintInsideTo(.height, numberCardStackView)
        
        let scrollView = UIScrollView()
        
        scrollView.addSubview(viewToScroll)
        
        viewToScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        return scrollView
    }()
    
    //MARK: - LoadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        setupView()
        setupConstrains()
        
        view.createReservationCustomBar(progressBarButtons: buttons) {_ in
            
            self.dismiss(animated: true)
        }
        
        let numberStackViewTap = UITapGestureRecognizer(target: self, action: #selector(numberStackViewTapped))
        numberCardStackView.addGestureRecognizer(numberStackViewTap)
        
        let ccStackViewTap = UITapGestureRecognizer(target: self, action: #selector(ccValidatestackViewTapped))
        ccValidateStackView.addGestureRecognizer(ccStackViewTap)
        
        let sourceSecutiryStackViewTap = UITapGestureRecognizer(target: self, action: #selector(sourceSecutirytackViewTapped))
        sourceSecurityStackView.addGestureRecognizer(sourceSecutiryStackViewTap)
        
        let nameHolderStackViewTap = UITapGestureRecognizer(target: self, action: #selector(nameHolderStackViewTapped))
        nameHolderStackView.addGestureRecognizer(nameHolderStackViewTap)
        
        let cpfStackViewTap = UITapGestureRecognizer(target: self, action: #selector(cpfStackViewTapped))
        cpfStackView.addGestureRecognizer(cpfStackViewTap)
        
        
    }
    
    //MARK: - SetupView
    private func setupView() {
        
        view.addSubviews([scrollView, finishButton, tip1])
        
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        
        let nextResponder = view.viewWithTag(1)
        nextResponder?.becomeFirstResponder()
        
        
    }
    
    //MARK: - SetupConstrains
    private func setupConstrains() {
        
        scrollView.constraintInsideTo(.top, view, CGFloat(223).generateSizeForScreen)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, finishButton)
        
        //MARK: finishButton
        finishButton.setToBottomButtonKeyboardDefault()
        finishButton.setTitle("Finalizar", for: .normal)
    }
    
    //MARK: actions and methods
    
    //MARK: numberTfEmpity
    @objc private func tapBackButton() {
        
        self.dismiss(animated: true)
    }
    
    //MARK: numberTfEmpity
    @objc private func numberTfEmpity()  {
        if numberCardTextfield.text!.count >= 19 {
            numberCardLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
            numberCardStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
            tip1.isHidden = true
        } else {
            numberCardLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            tip1.isHidden = false
            numberCardStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - numberStackViewTapped
    @objc func numberStackViewTapped() {
        
        numberCardLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                      size: CGFloat(11).generateSizeForScreen)
        numberCardTextfield.isHidden = false
        numberCardTextfield.becomeFirstResponder()
    }
    
    @objc func withdrawNumberCardBoder() {
        numberCardStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
    }
    
    //MARK: - ccEmpity
    @objc private func ccEmpity()  {
        
        if ccValidateExpirationTextfield.text!.count >= 3 {
            ccValidateLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
            ccValidateStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        } else {
            ccValidateLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            ccValidateStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
            
        }
    }
    
    //MARK: - ccValidatestackViewTapped
    @objc func ccValidatestackViewTapped() {
        
        ccValidateLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                      size: CGFloat(11).generateSizeForScreen)
        ccValidateExpirationTextfield.isHidden = false
        ccValidateExpirationTextfield.becomeFirstResponder()
    }
    
    @objc func withdrawCcBoder() {
        
        ccValidateStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
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
            sourceSecurityLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
            sourceSecurityStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
        }
        else {
            sourceSecurityLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            sourceSecurityStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: - sourceSecutiryStackViewTapped
    @objc func sourceSecutirytackViewTapped() {
        
        sourceSecurityLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                          size: CGFloat(11).generateSizeForScreen)
        
        sourceSecurityTextfield.isHidden = false
        sourceSecurityTextfield.becomeFirstResponder()
    }
    
    @objc func withdrawSourceBoder() {
        
        sourceSecurityStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
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
    
    //MARK: countryImageFlag
    private lazy var countryImageFlag: UIImageView = {
        
        let view = UIImageView(image: UIImage(named: ""))
        view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 15, height: 15))
        return view
    }()
    
    
    //MARK: ccValidatestackViewTapped
    @objc func countryStackViewTapped() {
        
        countryLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                   size: CGFloat(11).generateSizeForScreen)
    }
    
    //MARK: - nameHolderEmpity
    @objc private func nameHolderEmpity()  {
        
        countryStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
        if nameHolderTextfield.text!.count >= 6 {
            nameHolderLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
            nameHolderStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
            
        }
        else {
            nameHolderLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            nameHolderStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
        }
    }
    
    //MARK: nameHoldertackViewTapped
    @objc func nameHolderStackViewTapped() {
        
        nameHolderLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                      size: CGFloat(11).generateSizeForScreen)
        
        nameHolderTextfield.isHidden = false
        nameHolderTextfield.becomeFirstResponder()
    }
    
    
    @objc func withdrawNameHolderBoder() {
        
        nameHolderStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
    }
    
    
    //MARK: - cpfEmpity
    @objc private func cpfEmpity()  {
        
        if cpfTextfield.text!.count >= 14 {
            cpfLabel.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
            cpfStackView.setBottomBorderOnlyWithBlue(color: UIColor.blue.cgColor)
            finishButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        }
        else {
            cpfLabel.textColor = UIColor(named: ColorsBravve.redAlertLabel.rawValue)
            cpfStackView.setBottomBorderOnlyWithRed(color: UIColor.red.cgColor)
            finishButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        }
    }
    
    //MARK: cpfStackViewTapped
    @objc func cpfStackViewTapped() {
        
        cpfLabel.font = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        
        cpfTextfield.isHidden = false
        cpfTextfield.becomeFirstResponder()
    }
    
    @objc func withdrawCpfBoder() {
        
        cpfStackView.setBottomBorderOnlyWithDefault(color: UIColor.black.cgColor)
    }
    
    
    //MARK: - finishButtonTapped
    @objc func finishButtonTapped() {
        
        let reservationcompletedview = ReservationCompletedView()
        reservationcompletedview.modalPresentationStyle = .fullScreen
        present(reservationcompletedview, animated: true)
    }
    
    //MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    //MARK: - textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == numberCardTextfield {
            ccValidateExpirationTextfield.becomeFirstResponder()
            ccValidateExpirationTextfield.isHidden = false
        }else {
            ccValidateExpirationTextfield.resignFirstResponder()
        }
        if textField == ccValidateExpirationTextfield {
            sourceSecurityTextfield.becomeFirstResponder()
            sourceSecurityTextfield.isHidden = false
        }else {
            sourceSecurityTextfield.resignFirstResponder()
        }
        if textField == sourceSecurityTextfield {
            nameHolderTextfield.becomeFirstResponder()
            nameHolderTextfield.isHidden = false
        }else {
            nameHolderTextfield.resignFirstResponder()
        }
        if textField == nameHolderTextfield {
            cpfTextfield.becomeFirstResponder()
            cpfTextfield.isHidden = false
        }else {
            cpfTextfield.resignFirstResponder()
        }
        return true
        
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
    func setBottomBorderOnlyWithDefault(color: CGColor) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = CGColor(red: 26/255, green: 23/255, blue: 80/255, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
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

extension ReservationsThreeViewController : UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        //        if let _ = touch.view?.superview?.superclass?.isSubclass(of: UIButton.self) {
        //
        //            return false
        //        }
        
        if touch.view!.superview!.superclass! .isSubclass(of: UIButton.self) {
            
            return false
        }
        return true
    }
}
