
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//

import UIKit

class CheckOutScreen: UIViewController{
 
    //MARK: - Labels
    
    let customBar = UIView()
    private let myTableView = UITableView()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    lazy var lineView1:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView2:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView3:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView4:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var lineView5:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "BOXOFFICE"
        lb.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        lb.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Numa esquina\ncharmosa, um hotel"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var reserveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ImagesBravve.imageReservs_3.rawValue)

        return image
    }()
    lazy var reserveImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ImagesBravve.imageReservs_4.rawValue)

        return image
    }()
    lazy var infoLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Home by Kamy"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UM Coffe Co."
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var detailLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes da sua reserva"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.calendarGray.rawValue)

        return image
    }()
    lazy var dayLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "09/04/22"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var checkInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-in"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var checkOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-Out"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var diaryLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Diária"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var dayDiaryCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "09:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var dayDiaryCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "20:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newDayLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "10/04/22"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-in"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-Out"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var hourLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Hora(3)"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var hourCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "09:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var hourCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "12:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newHourLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Hora"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newHourCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "18:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var newHourCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "19:00"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()

    lazy var payFormLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Forma de pagamento"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var imagePay: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.walletBlue.rawValue)

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
    
    lazy var arrowIconImage1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ButtonsBravve.arrowDown.rawValue)

        return image
    }()
    
    lazy var arrowIconImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: ButtonsBravve.arrowDown.rawValue)

        return image
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
    
    lazy var buttonMainDoor: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta principal", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonMaindoorTap), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonMaindoorTap(){
        
    }
    lazy var buttonOpenSpace: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta do espaço", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        button.addTarget(self, action: #selector(buttonOpenSpaceTap), for: .touchUpInside)
        return button
    }()
    
    
    @objc func buttonOpenSpaceTap(){
        
    }
    lazy var checkOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check-out", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        button.layer.borderColor = UIColor(named: ColorsBravve.label.rawValue)?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue), for: .normal)
       
        button.addTarget(self, action: #selector(buttonCheckOut), for: .touchUpInside)
        
        return button
    }()

    @objc func buttonCheckOut(){
        checkOutButton.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.separatorStyle = .none
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        setupViews()
        setupDefaults()
        setupContraints()
        
       
    }

    func setupViews(){
        view.addSubview(buttonMainDoor)
        view.addSubview(buttonOpenSpace)
        view.addSubview(myTableView)
        tabBar.selectedItem = tabBar.items?[1]
        myTableView.addSubviews([titleLabel,descriptLabel,reserveImage,reserveImage2,infoLocalLabel,nameLocalLabel,detailLocalLabel,imageDetail,dayLabel,checkInLabel,checkOutLabel,diaryLabel,dayDiaryCheckInLabel,dayDiaryCheckOutLabel,lineView1,newDayLabel,newCheckInLabel,newCheckOutLabel,hourLabel,hourCheckInLabel,hourCheckOutLabel,newHourLabel,newHourCheckInLabel,newHourCheckOutLabel,lineView2,imagePay,payFormLabel,creditCard,creditCardTextField,totalLabel,lineView3,localDetail,numberPeopleImage,numberPeopleLabel,localizationIconImage,localizationLabel,clockIconImage,clockLabel,showMoreButton1,arrowIconImage1,lineView4,responsablePeople,responsableNameLabel,descriptionResponsableLabel,showMoreButton2,lineView5,contactsLabel,cellIconImage,emailIconImage,contactNumberLabel,contactEmailLabel,checkOutButton,arrowIconImage2])
        view.addSubview(customBar)
        view.addSubview(tabBar)
        
    

    }
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Check out"){
            _ in
            self.dismiss(animated: true)
            
        }
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            buttonMainDoor.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            buttonMainDoor.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            buttonMainDoor.widthAnchor.constraint(equalToConstant: 188),
            buttonMainDoor.heightAnchor.constraint(equalToConstant: 52),
            
            buttonOpenSpace.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            buttonOpenSpace.leadingAnchor.constraint(equalTo: buttonMainDoor.trailingAnchor),
            buttonOpenSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonOpenSpace.widthAnchor.constraint(equalToConstant: 188),
            buttonOpenSpace.heightAnchor.constraint(equalToConstant: 52),
            
            
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
            
            newDayLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 15.5),
            newDayLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            hourLabel.topAnchor.constraint(equalTo: newDayLabel.bottomAnchor,constant: 11.5),
            hourLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            newHourLabel.topAnchor.constraint(equalTo: hourLabel.bottomAnchor,constant: 11),
            newHourLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            checkInLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkInLabel.leadingAnchor.constraint(equalTo: detailLocalLabel.trailingAnchor,constant: 1),
            
            dayDiaryCheckInLabel.topAnchor.constraint(equalTo: checkInLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckInLabel.trailingAnchor.constraint(equalTo: checkInLabel.trailingAnchor),
            
            newCheckInLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 15.5),
            newCheckInLabel.trailingAnchor.constraint(equalTo: checkInLabel.trailingAnchor),
            
            hourCheckInLabel.topAnchor.constraint(equalTo: newCheckInLabel.bottomAnchor,constant: 12.5),
            hourCheckInLabel.trailingAnchor.constraint(equalTo: newCheckInLabel.trailingAnchor),
            
            newHourCheckInLabel.topAnchor.constraint(equalTo: hourCheckInLabel.bottomAnchor,constant: 12.5),
            newHourCheckInLabel.trailingAnchor.constraint(equalTo: hourCheckInLabel.trailingAnchor),
            
            checkOutLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkOutLabel.leadingAnchor.constraint(equalTo: checkInLabel.trailingAnchor,constant: 22),
            
            dayDiaryCheckOutLabel.topAnchor.constraint(equalTo: checkOutLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckOutLabel.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            
            newCheckOutLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 15.5),
            newCheckOutLabel.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            
            hourCheckOutLabel.topAnchor.constraint(equalTo: newCheckOutLabel.bottomAnchor,constant: 12.5),
            hourCheckOutLabel.trailingAnchor.constraint(equalTo: newCheckOutLabel.trailingAnchor),
            
            newHourCheckOutLabel.topAnchor.constraint(equalTo: hourCheckInLabel.bottomAnchor,constant: 12.5),
            newHourCheckOutLabel.trailingAnchor.constraint(equalTo: hourCheckOutLabel.trailingAnchor),
            
            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            creditCardTextField.trailingAnchor.constraint(equalTo: newCheckOutLabel.trailingAnchor),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            localDetail.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: 15),
            localDetail.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            numberPeopleImage.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 21.43),
            numberPeopleImage.topAnchor.constraint(equalTo: localDetail.bottomAnchor,constant: 12),
            
            localizationIconImage.topAnchor.constraint(equalTo: numberPeopleImage.bottomAnchor,constant: 20),
            localizationIconImage.centerXAnchor.constraint(equalTo: numberPeopleImage.centerXAnchor),
            
            clockIconImage.topAnchor.constraint(equalTo: localizationIconImage.bottomAnchor,constant: 20),
            clockIconImage.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            arrowIconImage1.centerYAnchor.constraint(equalTo: showMoreButton1.centerYAnchor),
            arrowIconImage1.leadingAnchor.constraint(equalTo: showMoreButton1.trailingAnchor,constant: 5),
            
            arrowIconImage2.centerYAnchor.constraint(equalTo: showMoreButton2.centerYAnchor),
            arrowIconImage2.leadingAnchor.constraint(equalTo: showMoreButton2.trailingAnchor,constant: 5),
            
            numberPeopleLabel.centerYAnchor.constraint(equalTo: numberPeopleImage.centerYAnchor),
            numberPeopleLabel.leadingAnchor.constraint(equalTo: numberPeopleImage.trailingAnchor,constant: 12.43),
            
            localizationLabel.centerYAnchor.constraint(equalTo: localizationIconImage.centerYAnchor),
            localizationLabel.leadingAnchor.constraint(equalTo: numberPeopleLabel.leadingAnchor),
            localizationLabel.widthAnchor.constraint(equalToConstant: 248),
            
            clockLabel.leadingAnchor.constraint(equalTo: numberPeopleLabel.leadingAnchor),
            clockLabel.centerYAnchor.constraint(equalTo: clockIconImage.centerYAnchor),
            
            showMoreButton1.topAnchor.constraint(equalTo: clockIconImage.bottomAnchor,constant: 12),
            showMoreButton1.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            responsablePeople.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: 15),
            responsablePeople.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            responsableNameLabel.topAnchor.constraint(equalTo: responsablePeople.bottomAnchor,constant: 8),
            responsableNameLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            descriptionResponsableLabel.topAnchor.constraint(equalTo: responsableNameLabel.bottomAnchor,constant: 8),
            descriptionResponsableLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            descriptionResponsableLabel.widthAnchor.constraint(equalToConstant: 277),
            
            showMoreButton2.topAnchor.constraint(equalTo: descriptionResponsableLabel.bottomAnchor,constant: 8),
            showMoreButton2.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            contactsLabel.topAnchor.constraint(equalTo: lineView5.bottomAnchor,constant: 15),
            contactsLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            
            cellIconImage.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor,constant: 13),
            cellIconImage.centerXAnchor.constraint(equalTo: clockIconImage.centerXAnchor),
            
            emailIconImage.topAnchor.constraint(equalTo: cellIconImage.bottomAnchor,constant: 19.25),
            emailIconImage.centerXAnchor.constraint(equalTo: cellIconImage.centerXAnchor),
            
            contactNumberLabel.centerYAnchor.constraint(equalTo: cellIconImage.centerYAnchor),
            contactNumberLabel.leadingAnchor.constraint(equalTo: cellIconImage.trailingAnchor,constant: 13),
            
            contactEmailLabel.centerYAnchor.constraint(equalTo: emailIconImage.centerYAnchor),
            contactEmailLabel.leadingAnchor.constraint(equalTo: emailIconImage.trailingAnchor,constant: 13),
            
            checkOutButton.topAnchor.constraint(equalTo: contactEmailLabel.bottomAnchor,constant: 18),
            checkOutButton.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            checkOutButton.trailingAnchor.constraint(equalTo: lineView5.trailingAnchor),
            checkOutButton.heightAnchor.constraint(equalToConstant: 52),
            
            lineView1.topAnchor.constraint(equalTo: diaryLabel.bottomAnchor,constant: 15),
            lineView1.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView1.trailingAnchor.constraint(equalTo: checkOutLabel.trailingAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView2.topAnchor.constraint(equalTo: newHourLabel.bottomAnchor,constant: 17),
            lineView2.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView2.trailingAnchor.constraint(equalTo: newHourCheckOutLabel.trailingAnchor),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView3.topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lineView3.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView3.trailingAnchor.constraint(equalTo: newHourCheckOutLabel.trailingAnchor),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView4.topAnchor.constraint(equalTo: showMoreButton1.bottomAnchor,constant: 15),
            lineView4.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView4.trailingAnchor.constraint(equalTo: newHourCheckOutLabel.trailingAnchor),
            lineView4.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView5.topAnchor.constraint(equalTo: showMoreButton2.bottomAnchor,constant: 15),
            lineView5.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            lineView5.trailingAnchor.constraint(equalTo: newHourCheckOutLabel.trailingAnchor),
            lineView5.heightAnchor.constraint(equalToConstant: 0.5),
            
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: buttonMainDoor.topAnchor),

            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
         
            
        ])
    }
    


   
}
extension CheckOutScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        1500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
}


