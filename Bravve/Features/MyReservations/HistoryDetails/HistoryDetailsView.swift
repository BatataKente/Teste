//
//  HistoryDetailsView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 25/08/22.
//

import UIKit

class HistoryDetailsView: UIViewController {
    
    let customBar = UIView()
    
    private let customAlertCancel: CustomAlert = CustomAlert()
    private let customAlertOk: CustomAlert = CustomAlert()
    private var space: SpaceDetail = SpaceDetail()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
//    lazy var checkIN: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Check-in", for: .normal)
//        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
//        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
//        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
//        button.layer.borderWidth = 1
//        button.addTarget(self, action: #selector(buttonMaindoorTap), for: .touchUpInside)
//        return button
//    }()
    
//    lazy var buttonOpenSpace: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Abrir porta do espaço", for: .normal)
//        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
//        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
//        button.addTarget(self, action: #selector(buttonOpenSpaceTap), for: .touchUpInside)
//        return button
//    }()
    
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
    
    private lazy var reserveCollection: UICollectionView = {
        
        let itemsize = 300
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        layoutCollection.itemSize = CGSize(width: itemsize, height: itemsize)
        layoutCollection.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        collection.register(BookingDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        guard let pictures = space.pictures else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        return pageControl
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
    
    lazy var buttonArrowIconImage1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        
        return button
    }()
    
    lazy var buttonArrowIconImage2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        
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
    
//    lazy var cancelButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Cancelar Reserva", for: .normal)
//        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
//        button.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
//        button.layer.borderColor = UIColor(named: ColorsBravve.label.rawValue)?.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 12
//        button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue), for: .normal)
//
//        button.addTarget(self, action: #selector(cancelBooking), for: .touchUpInside)
//
//        return button
//    }()
    
    private let viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        
        setupViews()
        setupDefaults()
        setupContraints()
    }
    
    @objc func buttonMaindoorTap(){
        print("main door")
    }
    
    @objc func buttonOpenSpaceTap(){
        print("space door")
    }
    
    func setupViews(){
//        view.addSubview(checkIN)
//        view.addSubview(buttonOpenSpace)
        tabBar.selectedItem = tabBar.items?[1]
        view.addSubview(customBar)
        view.addSubview(tabBar)
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, pageControl, infoLocalLabel,
                          nameLocalLabel, detailLocalLabel, imageDetail, dayLabel, checkInLabel,
                          checkOutLabel, diaryLabel, dayDiaryCheckInLabel, dayDiaryCheckOutLabel,
                          lineView1, lineView2, imagePay, payFormLabel, creditCard, creditCardTextField,
                          totalLabel, lineView3, localDetail, numberPeopleImage, numberPeopleLabel,
                          localizationIconImage, localizationLabel, clockIconImage, clockLabel,
                          showMoreButton1, buttonArrowIconImage1, lineView4, responsablePeople,
                          responsableNameLabel, descriptionResponsableLabel, showMoreButton2,
                          lineView5,contactsLabel, cellIconImage, emailIconImage, contactNumberLabel,
                          contactEmailLabel, buttonArrowIconImage2
                         ])
        
    }
    
    @objc func showMorebutton(){
        
    }
    
    @objc func showMorebutton2(){
        
    }
    
//    @objc func cancelBooking(){
//        cancelButton.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
//        customAlertOk.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Certeza que deseja cancelar essa reserva? Entraremos em contato para confirmar o cancelamento!", enterAttributed: "Voltar", enterHandler: UIAction(handler: { _ in
//            self.customAlertOk.dismissAlert()
////            self.customAlertCancel.showAlert(image: UIImage(named: IconsBravve.checkBlue.rawValue), message: "Check-out realizado com sucesso.\nObrigado pela presença!", enterAttributed: "Ok", enterHandler: UIAction(handler: { _ in
////                print("ok")
////            }), on: self)
//        }), cancelAttributed: "Cancelar Reserva", cancelHandler: UIAction(handler: { _ in
//            self.customAlertOk.dismissAlert()
//        }), on: self)
//
//    }
    
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            self.dismiss(animated: true)
            
        }
    }
    
    func setupContraints(){
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, tabBar)

        viewInScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 24),
            
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            reserveCollection.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveCollection.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            reserveCollection.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            reserveCollection.heightAnchor.constraint(equalToConstant: 300),
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
            infoLocalLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor,constant: 52.5),
            infoLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 7),
            nameLocalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 32),
            detailLocalLabel.leadingAnchor.constraint(equalTo: imageDetail.trailingAnchor,constant: 9),
            
            
            dayLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            dayLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            diaryLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor,constant: 11.5),
            diaryLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            checkInLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkInLabel.leadingAnchor.constraint(equalTo: diaryLabel.trailingAnchor,constant: 1),
            
            dayDiaryCheckInLabel.topAnchor.constraint(equalTo: checkInLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckInLabel.trailingAnchor.constraint(equalTo: checkInLabel.trailingAnchor),
            
            checkOutLabel.topAnchor.constraint(equalTo: detailLocalLabel.bottomAnchor,constant: 27),
            checkOutLabel.leadingAnchor.constraint(equalTo: checkInLabel.trailingAnchor,constant: 22),
            checkOutLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            
            dayDiaryCheckOutLabel.topAnchor.constraint(equalTo: checkOutLabel.bottomAnchor,constant: 12.5),
            dayDiaryCheckOutLabel.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            
            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView1.bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            creditCardTextField.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            localDetail.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 15),
            localDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            numberPeopleImage.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 21.43),
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
            showMoreButton1.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            responsablePeople.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: 15),
            responsablePeople.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            responsableNameLabel.topAnchor.constraint(equalTo: responsablePeople.bottomAnchor,constant: 8),
            responsableNameLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            descriptionResponsableLabel.topAnchor.constraint(equalTo: responsableNameLabel.bottomAnchor,constant: 8),
            descriptionResponsableLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            descriptionResponsableLabel.widthAnchor.constraint(equalToConstant: 277),
            
            showMoreButton2.topAnchor.constraint(equalTo: descriptionResponsableLabel.bottomAnchor,constant: 8),
            showMoreButton2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            contactsLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: 15),
            contactsLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            cellIconImage.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor,constant: 13),
            cellIconImage.centerXAnchor.constraint(equalTo: clockIconImage.centerXAnchor),
            
            emailIconImage.topAnchor.constraint(equalTo: cellIconImage.bottomAnchor,constant: 19.25),
            emailIconImage.centerXAnchor.constraint(equalTo: cellIconImage.centerXAnchor),
            
            contactNumberLabel.centerYAnchor.constraint(equalTo: cellIconImage.centerYAnchor),
            contactNumberLabel.leadingAnchor.constraint(equalTo: cellIconImage.trailingAnchor,constant: 13),
            
            contactEmailLabel.centerYAnchor.constraint(equalTo: emailIconImage.centerYAnchor),
            contactEmailLabel.leadingAnchor.constraint(equalTo: emailIconImage.trailingAnchor,constant: 13),
            contactEmailLabel.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -30),
            
//            cancelButton.topAnchor.constraint(equalTo: emailIconImage.bottomAnchor,constant: 21.5),
//            cancelButton.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
//            cancelButton.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
//            cancelButton.heightAnchor.constraint(equalToConstant: 52),
//            cancelButton.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -40),
            
            lineView1.topAnchor.constraint(equalTo: diaryLabel.bottomAnchor,constant: 17),
            lineView1.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView1.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView2.topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lineView2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView2.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView3.topAnchor.constraint(equalTo: showMoreButton1.bottomAnchor,constant: 16),
            lineView3.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView3.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView4.topAnchor.constraint(equalTo: showMoreButton2.bottomAnchor,constant: CGFloat(16).generateSizeForScreen),
            lineView4.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView4.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView4.heightAnchor.constraint(equalToConstant: 0.5),
            
//            checkIN.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
//            checkIN.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            checkIN.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            checkIN.heightAnchor.constraint(equalToConstant: 52),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension HistoryDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let pictures = space.pictures else { return 0 }
//
//        return pictures.count
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? BookingDetailsCollectionViewCell
        
//        guard let pictures = space.pictures else { return UICollectionViewCell() }
//
//        guard let picture = pictures[indexPath.row].url else { return UICollectionViewCell() }
//
//        cell?.imageView.sd_setImage(with: URL(string: picture))
        
        return cell ?? UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        var roundedIndex = 0.0
        if index < 0.2 {
            roundedIndex = round(index)
        } else {
            roundedIndex = ceil(index)
        }
        
        self.pageControl.currentPage = Int(roundedIndex)
    }
    
}




