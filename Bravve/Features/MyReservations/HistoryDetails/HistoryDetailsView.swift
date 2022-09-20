//
//  HistoryDetailsView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 25/08/22.
//

import UIKit

class HistoryDetailsView: UIViewController {
    
    private let customBar = UIView()
    
    private let customAlertCancel: CustomAlert = CustomAlert()
    private let customAlertOk: CustomAlert = CustomAlert()
    private let historyDetailsViewModel = HistoryDetailsViewModel()
    
    private var currentReservation: Reservations? {
        var reservation: Reservations?
        reservation = historyDetailsViewModel.getReservation(currentReservation: &reservation)
        return reservation
    }
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var lineView1:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var lineView2:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var lineView3:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var lineView4:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var lineView5:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = currentReservation?.space_category?.name ?? " "
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.backgroundColor = label.getTitleLabelBackgroundColor(currentReservation?.space_category?.name ?? " ")
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.31
        label.attributedText = NSMutableAttributedString(string: currentReservation?.slogan ?? " ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.textAlignment = .left
        return label
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
        collection.register(HistoryDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        guard let pictures = currentReservation?.picture else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        pageControl.addTarget(self, action: #selector(pageControlTarget), for: .touchUpInside)
        
        return pageControl
    }()
    
    private lazy var infoLocalLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.local_name ?? " "
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        return label
    }()
    
    private lazy var nameLocalLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.description ?? " "
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var detailLocalLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhes da sua reserva"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        return label
    }()
    
    private lazy var imageDetail: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.calendar.rawValue)
        return image
    }()
    
    private lazy var dayLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = historyDetailsViewModel.getDateString(date: currentReservation?.start_dt)
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var checkInLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-in"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var checkOutLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-Out"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var diaryLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.space_contract_name ?? " "
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var dayDiaryCheckInLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = historyDetailsViewModel.getHourString(date: currentReservation?.start_dt)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var dayDiaryCheckOutLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = historyDetailsViewModel.getHourString(date: currentReservation?.end_dt)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var payFormLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forma de pagamento"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        return label
    }()
    
    private lazy var imagePay: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.receipt.rawValue)
        return image
    }()
    
    private lazy var cellIconImage: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cellphone")
        return image
    }()
    
    private lazy var emailIconImage: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.email.rawValue)
        return image
    }()
    
    private lazy var totalLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " R$ \(currentReservation?.payment_amount?.replacingOccurrences(of: ".", with: ",") ?? " ")", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var creditCard: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.payment_type_name
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var creditCardTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
//      DADO DE PAGAMENTO AINDA MOCADO, PENDENTE DE FAZER REQUISICAO DADO AINDA NAO VEM
        textField.text = "    **** **** **** 4679"
        textField.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        textField.backgroundColor = UIColor(named: ColorsBravve.backgroundCard.rawValue)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = false
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private lazy var contactsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contatos"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private lazy var contactNumberLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.space_contact?.phone ?? " "
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var contactEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = currentReservation?.space_contact?.email ?? " "
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    private let viewInScroll: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.delegate = self
        
        return scroll
    }()
    
    private lazy var checkInRealizedLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-in realizado às"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var checkOutRealizedLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-Out realizado às"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var hourCheckIn: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = historyDetailsViewModel.getHourString(date: currentReservation?.checkin_ts)
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var hourCheckOut: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = historyDetailsViewModel.getHourString(date: currentReservation?.checkout_ts)
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var lineView6:UIView = {
        
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        var items = [UIStackView]()
        
        var businessHours = UserReservations.spaceHistoryDetail?.space_business_hours ?? []
        
        historyDetailsViewModel.sortBusinessHours(businessHours: &businessHours)
        
        let days = historyDetailsViewModel.createBusinessHoursArray(businessHours: businessHours)
        
        items.append(historyDetailsViewModel.createStackView("Ate \(currentReservation?.seats_qty ?? 0) pessoas", UIImage(named: IconsBravve.users.rawValue), textColor: textColor))
        items.append(historyDetailsViewModel.createStackView("\(currentReservation?.space_address?.street ?? " "), \(currentReservation?.space_address?.neighborhood ?? " "), no \(currentReservation?.space_address?.street_number ?? 0), \(currentReservation?.space_address?.city_name ?? " "). \(currentReservation?.space_address?.state_name ?? " ") \(currentReservation?.space_address?.postal_code ?? " "), BR", UIImage(named: IconsBravve.map.rawValue), textColor: textColor))
        
        let stackView = UIStackView()
        
        if !days.isEmpty {
            
            items.append(historyDetailsViewModel.createStackView(attributedText: days[0], UIImage(named: IconsBravve.clockReserv.rawValue), textColor: textColor))
            
            for i in 1...days.count-1 {
                
                items.append(historyDetailsViewModel.createStackView(attributedText: days[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                             isHidden: true,
                                             textColor: textColor))
            }
            
            let buttons = historyDetailsViewModel.createSeeButtonsStackView(3...items.count-1, items: items)
            
            stackView.addArrangedSubviews([title] + items + [buttons])
        }
        else {
            
            stackView.addArrangedSubviews([title] + items)
        }
        
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var responsableStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Responsável"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        
        let responsableLabel = UILabel()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "\(currentReservation?.space_contact?.name ?? " ")\n", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: "Community Manager", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        responsableLabel.attributedText = atritutedString1
        responsableLabel.numberOfLines = 0
        
        
        let informations = UILabel()
        informations.text = "Estarei disponível para esclarecer suas dúvidas e\najudar no que for possível através de mensagem via\nWhatsapp."
        informations.numberOfLines = 0
        informations.font = UIFont(name: FontsBravve.light.rawValue, size: 12)
        informations.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        let button = historyDetailsViewModel.createSeeButton(smallText: informations.text ?? "", fullText: "Estarei disponível para esclarecer suas dúvidas e\najudar no que for possível através de mensagem via\nWhatsapp. Garanto que tem tudo para seu conforto\ne melhor rendimento em seu trabalho. Sou casada,\ntenho 3 filhos e 1 cachorro, moro em São Paulo por\nopção. Apaixonada pelo mundo corporativo, resolvi\ncompartilhar um pouco do meu espaço com vocês.", actionLabel: informations)
        
        let stackView = UIStackView(arrangedSubviews: [title, responsableLabel, informations, button] )
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInScroll.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        
        setupViews()
        setupDefaults()
        setupContraints()
        
    }
    
    func setupViews(){
        tabBar.selectedItem = tabBar.items?[1]
        view.addSubview(customBar)
        view.addSubview(tabBar)
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, infoLocalLabel,
                                  nameLocalLabel, detailLocalLabel, imageDetail, dayLabel, checkInLabel,
                                  checkOutLabel, diaryLabel, dayDiaryCheckInLabel, dayDiaryCheckOutLabel,
                                  lineView1, lineView2, imagePay, payFormLabel, creditCard, creditCardTextField,
                                  totalLabel, lineView3, localDetailsStackView, lineView4,
                                  lineView5 ,responsableStackView, contactsLabel, cellIconImage, emailIconImage, contactNumberLabel,
                                  contactEmailLabel, pageControl, checkInRealizedLabel, checkOutRealizedLabel,
                                  hourCheckIn, hourCheckOut, lineView6
                                 ])
    }
    
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            if Flags.shared.flagReservation == 4 {
                let vc = HomeClosedView()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                self.dismiss(animated: true)
            }
        }
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            
            viewInScroll.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewInScroll.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: CGFloat(76).generateSizeForScreen),
            titleLabel.heightAnchor.constraint(equalToConstant: CGFloat(23).generateSizeForScreen),
            
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            descriptLabel.heightAnchor.constraint(equalToConstant: CGFloat(72).generateSizeForScreen),
            descriptLabel.widthAnchor.constraint(equalToConstant: CGFloat(215).generateSizeForScreen),
            
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
            payFormLabel.topAnchor.constraint(equalTo: lineView6.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            imagePay.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView6.bottomAnchor,constant: 21),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor),
            creditCardTextField.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            creditCardTextField.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            checkInRealizedLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor,constant: 59.5),
            checkInRealizedLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            
            hourCheckIn.topAnchor.constraint(equalTo: checkInRealizedLabel.bottomAnchor,constant: 12),
            hourCheckIn.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 113),
            
            checkOutRealizedLabel.topAnchor.constraint(equalTo: checkOutLabel.bottomAnchor,constant: 60.5),
            checkOutRealizedLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 215),
            
            hourCheckOut.topAnchor.constraint(equalTo: checkOutRealizedLabel.bottomAnchor,constant: 12),
            hourCheckOut.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor,constant: -24),
            
            lineView6.topAnchor.constraint(equalTo: diaryLabel.bottomAnchor,constant: 92),
            lineView6.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView6.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView6.heightAnchor.constraint(equalToConstant: 0.5),
            
            contactsLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor,constant: 15),
            contactsLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            cellIconImage.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor,constant: 13),
            cellIconImage.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 25),
            
            emailIconImage.topAnchor.constraint(equalTo: cellIconImage.bottomAnchor,constant: 19.25),
            emailIconImage.centerXAnchor.constraint(equalTo: cellIconImage.centerXAnchor),
            
            contactNumberLabel.centerYAnchor.constraint(equalTo: cellIconImage.centerYAnchor),
            contactNumberLabel.leadingAnchor.constraint(equalTo: cellIconImage.trailingAnchor,constant: 13),
            
            contactEmailLabel.centerYAnchor.constraint(equalTo: emailIconImage.centerYAnchor),
            contactEmailLabel.leadingAnchor.constraint(equalTo: emailIconImage.trailingAnchor,constant: 13),
            contactEmailLabel.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -30),
            
            lineView1.topAnchor.constraint(equalTo: diaryLabel.bottomAnchor,constant: 17),
            lineView1.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView1.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView2.topAnchor.constraint(equalTo: totalLabel.bottomAnchor,constant: 17),
            lineView2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView2.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView3.topAnchor.constraint(equalTo: localDetailsStackView.bottomAnchor,constant: 16),
            lineView3.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView3.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            
            lineView4.topAnchor.constraint(equalTo: responsableStackView.bottomAnchor,constant: CGFloat(16).generateSizeForScreen),
            lineView4.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            lineView4.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            lineView4.heightAnchor.constraint(equalToConstant: 0.5),
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            localDetailsStackView.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 15),
            localDetailsStackView.leadingAnchor.constraint(equalTo: lineView2.leadingAnchor),
            localDetailsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-76).generateSizeForScreen),
            
            responsableStackView.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 15),
            responsableStackView.leadingAnchor.constraint(equalTo: lineView3.leadingAnchor),
            responsableStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-78).generateSizeForScreen)
            
            
        ])
    }
    
    @objc func pageControlTarget(_ sender: UIPageControl) {
        
        DispatchQueue.main.async {
            
            self.reserveCollection.scrollToItem(at: IndexPath(row: sender.currentPage,
                                                              section: 0),
                                                at: .centeredHorizontally, animated: true)
        }
    }
}

extension HistoryDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pictures = currentReservation?.picture else { return 0 }
        
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HistoryDetailsCollectionViewCell
        
                guard let pictures = currentReservation?.picture else { return UICollectionViewCell() }
        
                guard let picture = pictures[indexPath.row].url else { return UICollectionViewCell() }
        
                cell?.imageView.sd_setImage(with: URL(string: picture))
        
        return cell ?? UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        var roundedIndex = 0.0
        
        if index < 0.2 {
            
            roundedIndex = round(index)
        }
        else {
            
            roundedIndex = ceil(index)
        }
        
        self.pageControl.currentPage = Int(roundedIndex)
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.y != 0 {
                    
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}




