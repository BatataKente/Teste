
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//

import UIKit

class BookingDetailsView: UIViewController{
 
    //MARK: - Labels
    
    let customBar = UIView()
    private let myTableView = UITableView()
    private let customAlert: CustomAlert = CustomAlert()
    private let alertCustom: CustomAlert = CustomAlert()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    lazy var lineView1:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView2:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView3:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView4:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView5:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "BOXOFFICE"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.textAlignment = .center
        return label
    }()
    lazy var descriptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.31
        label.attributedText = NSMutableAttributedString(string: "Numa esquina charmosa, um hotel", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var reserveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ImagesBravve.imageReservs_3.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()
    lazy var reserveImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ImagesBravve.imageReservs_4.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()
    lazy var infoLocalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home by Kamy"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var nameLocalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UM Coffe Co."
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    lazy var detailLocalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhes da sua reserva"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        return label
    }()
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.calendar.rawValue)

        return image
    }()
    lazy var dayLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "09/04/22"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var checkInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-in"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var checkOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-Out"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var diaryLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Diária"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var dayDiaryCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "09:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var dayDiaryCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "20:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var payFormLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Forma de pagamento"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var imagePay: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.receipt.rawValue)

        return image
    }()
    
    lazy var numberPeopleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.users.rawValue)

        return image
    }()
    
    lazy var localizationIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.map.rawValue)

        return image
    }()
    
    lazy var clockIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clockReserv.rawValue)

        return image
    }()
    
    lazy var buttonArrowIconImage1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue), for: .normal)

        return button
    }()
    
    lazy var buttonArrowIconImage2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue), for: .normal)

        return button
    }()
    
    lazy var cellIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cellphone")

        return image
    }()
    
    lazy var emailIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.email.rawValue)

        return image
    }()
    
    lazy var creditCard: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cartão de crédito"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var totalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 13), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " R$ 560,87", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        lb.attributedText = atritutedString1
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var creditCardTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "    **** **** **** 4679"
        tf.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        tf.backgroundColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)
        tf.isUserInteractionEnabled = false
        return tf
    }()
    
    lazy var localDetail: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes do local"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var numberPeopleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Até 6 pessoas"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    
    lazy var localizationLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Av. São Joâo, Cj. Boulevard, n°900, São Paulo. SP 06020-010, BR"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var clockLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Segunda:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        lb.attributedText = atritutedString1
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var responsablePeople: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Responsavél"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var responsableNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Ana Maria\n", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: "Community Manager", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        lb.attributedText = atritutedString1
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var descriptionResponsableLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através de mensagem via whatsapp"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.light.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var contactsLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Contatos"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var contactNumberLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "(11) 99999-9999"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var contactEmailLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "giovanna@empresaexe.com.br"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var showMoreButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let yourAttributes: [NSAttributedString.Key: Any] = [
                      .font: UIFont.systemFont(ofSize: 12),
                      .foregroundColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) as Any,
                      .underlineStyle: NSUnderlineStyle.single.rawValue
                  ]
                     let attributeString = NSMutableAttributedString(
                        string: "Ver Mais",
                    attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    @objc func showMorebutton(){
        
    }
    
    lazy var showMoreButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let yourAttributes: [NSAttributedString.Key: Any] = [
                      .font: UIFont.systemFont(ofSize: 12),
                      .foregroundColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) as Any,
                      .underlineStyle: NSUnderlineStyle.single.rawValue
                  ]
                     let attributeString = NSMutableAttributedString(
                        string: "Ver Mais",
                    attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    @objc func showMorebutton2(){
        
    }
    
    lazy var buttonCheckIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check-in", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonTapCheckIn), for: .touchUpInside)
        return button
    }()
    lazy var buttonCancelReserv: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar reserva", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonTapCancelReserv), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.bounces = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.separatorStyle = .none
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        setupViews()
        setupDefaults()
        setupContraints()
        
       
    }
    
    @objc func buttonTapCancelReserv(){
        customAlert.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Certeza que deseja cancelar essa reserva? Entraremos em contato para confirmar o cancelamento!", enterAttributed: "Voltar", cancelAttributed: "Cancelar reserva", cancelHandler: UIAction(handler: { _ in
            let vc = MyBookingView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }), on: self)
    }
    
    @objc func buttonTapCheckIn() {
        alertCustom.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Para realizar o Check-in, é necessário permissão de uso da câmera do celular.", enterAttributed: "Permitir", enterHandler: UIAction(handler: { _ in
            let vc = CheckInQrCodeViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }), cancelAttributed: "Negar", cancelHandler: UIAction(handler: { _ in
            self.alertCustom.dismissAlert()
        }), on: self)
    }
   
    func setupViews(){
        view.addSubview(buttonCheckIn)
        view.addSubview(myTableView)
        view.addSubview(customBar)
        view.addSubview(tabBar)
        tabBar.selectedItem = tabBar.items?[1]
        myTableView.addSubviews([titleLabel,descriptLabel,reserveImage,reserveImage2,infoLocalLabel,nameLocalLabel,detailLocalLabel,imageDetail,dayLabel,checkInLabel,checkOutLabel,diaryLabel,dayDiaryCheckInLabel,dayDiaryCheckOutLabel,lineView1,lineView2,imagePay,payFormLabel,creditCard,creditCardTextField,totalLabel,lineView3,localDetail,numberPeopleImage,numberPeopleLabel,localizationIconImage,localizationLabel,clockIconImage,clockLabel,showMoreButton1,buttonArrowIconImage1,lineView4,responsablePeople,responsableNameLabel,descriptionResponsableLabel,showMoreButton2,lineView5,contactsLabel,cellIconImage,emailIconImage,contactNumberLabel,contactEmailLabel,buttonArrowIconImage2,buttonCancelReserv])
        
    

    }
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            self.dismiss(animated: true)
            
        }
        
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            buttonCheckIn.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            buttonCheckIn.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            buttonCheckIn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonCheckIn.heightAnchor.constraint(equalToConstant: 52),

            buttonCancelReserv.topAnchor.constraint(equalTo: contactEmailLabel.bottomAnchor,constant: 18),
            buttonCancelReserv.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 22),
            buttonCancelReserv.heightAnchor.constraint(equalToConstant: 51),
            buttonCancelReserv.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: myTableView.bottomAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 24),
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            
            reserveImage.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            reserveImage.widthAnchor.constraint(equalToConstant: 300),
            reserveImage.heightAnchor.constraint(equalToConstant: 300),
            
            
            reserveImage2.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage2.leadingAnchor.constraint(equalTo: reserveImage.trailingAnchor,constant: 9),
            reserveImage2.widthAnchor.constraint(equalToConstant: 300),
            reserveImage2.heightAnchor.constraint(equalToConstant: 300),
            
            infoLocalLabel.topAnchor.constraint(equalTo: reserveImage.bottomAnchor,constant: 52.5),
            infoLocalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 7),
            nameLocalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 32),
            detailLocalLabel.leadingAnchor.constraint(equalTo: imageDetail.trailingAnchor,constant: 9),
            
            
            dayLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            dayLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            diaryLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor,constant: 11.5),
            diaryLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
  
            checkInLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkInLabel.leadingAnchor.constraint(equalTo: detailLocalLabel.trailingAnchor,constant: 1),
            
            dayDiaryCheckInLabel.topAnchor.constraint(equalTo: checkInLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckInLabel.trailingAnchor.constraint(equalTo: checkInLabel.trailingAnchor),
            
            checkOutLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkOutLabel.leadingAnchor.constraint(equalTo: checkInLabel.trailingAnchor,constant: 22),
            
            dayDiaryCheckOutLabel.topAnchor.constraint(equalTo: checkOutLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckOutLabel.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),

            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            creditCardTextField.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            localDetail.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 15),
            localDetail.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            numberPeopleImage.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 21.43),
            numberPeopleImage.topAnchor.constraint(equalTo: localDetail.bottomAnchor,constant: 12),
            
            localizationIconImage.topAnchor.constraint(equalTo: numberPeopleImage.bottomAnchor,constant: 20),
            localizationIconImage.centerXAnchor.constraint(equalTo: numberPeopleImage.centerXAnchor),
            
            clockIconImage.topAnchor.constraint(equalTo: localizationIconImage.bottomAnchor,constant: 20),
            clockIconImage.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            buttonArrowIconImage1.centerYAnchor.constraint(equalTo: showMoreButton1.centerYAnchor),
            buttonArrowIconImage1.leadingAnchor.constraint(equalTo: showMoreButton1.trailingAnchor,constant: 5),
            
            buttonArrowIconImage2.centerYAnchor.constraint(equalTo: showMoreButton2.centerYAnchor),
            buttonArrowIconImage2.leadingAnchor.constraint(equalTo: showMoreButton2.trailingAnchor,constant: 5),
            
            numberPeopleLabel.centerYAnchor.constraint(equalTo: numberPeopleImage.centerYAnchor),
            numberPeopleLabel.leadingAnchor.constraint(equalTo: numberPeopleImage.trailingAnchor,constant: 12.43),
            
            localizationLabel.centerYAnchor.constraint(equalTo: localizationIconImage.centerYAnchor),
            localizationLabel.leadingAnchor.constraint(equalTo: numberPeopleLabel.leadingAnchor),
            localizationLabel.widthAnchor.constraint(equalToConstant: 248),
            
            clockLabel.leadingAnchor.constraint(equalTo: numberPeopleLabel.leadingAnchor),
            clockLabel.centerYAnchor.constraint(equalTo: clockIconImage.centerYAnchor),
            
            showMoreButton1.topAnchor.constraint(equalTo: clockIconImage.bottomAnchor,constant: 12),
            showMoreButton1.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            responsablePeople.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: 15),
            responsablePeople.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            responsableNameLabel.topAnchor.constraint(equalTo: responsablePeople.bottomAnchor,constant: 8),
            responsableNameLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            descriptionResponsableLabel.topAnchor.constraint(equalTo: responsableNameLabel.bottomAnchor,constant: 8),
            descriptionResponsableLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            descriptionResponsableLabel.widthAnchor.constraint(equalToConstant: 277),
            
            showMoreButton2.topAnchor.constraint(equalTo: descriptionResponsableLabel.bottomAnchor,constant: 8),
            showMoreButton2.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            contactsLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: 15),
            contactsLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            cellIconImage.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor,constant: 13),
            cellIconImage.centerXAnchor.constraint(equalTo: clockIconImage.centerXAnchor),
            
            emailIconImage.topAnchor.constraint(equalTo: cellIconImage.bottomAnchor,constant: 19.25),
            emailIconImage.centerXAnchor.constraint(equalTo: cellIconImage.centerXAnchor),
            
            contactNumberLabel.centerYAnchor.constraint(equalTo: cellIconImage.centerYAnchor),
            contactNumberLabel.leadingAnchor.constraint(equalTo: cellIconImage.trailingAnchor,constant: 13),
            
            contactEmailLabel.centerYAnchor.constraint(equalTo: emailIconImage.centerYAnchor),
            contactEmailLabel.leadingAnchor.constraint(equalTo: emailIconImage.trailingAnchor,constant: 13),
            
            
            lineView1.topAnchor.constraint(equalTo: diaryLabel.bottomAnchor,constant: 17),
            lineView1.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView1.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView2.topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lineView2.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView2.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
        
            lineView3.topAnchor.constraint(equalTo: showMoreButton1.bottomAnchor,constant: 16),
            lineView3.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView3.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView4.topAnchor.constraint(equalTo: showMoreButton2.bottomAnchor,constant: 16),
            lineView4.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView4.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            lineView4.heightAnchor.constraint(equalToConstant: 0.5),
            
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: buttonCheckIn.topAnchor),

            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
         
            
        ])
    }
    


   
}
extension BookingDetailsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        1400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
}



