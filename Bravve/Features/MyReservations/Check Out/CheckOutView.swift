
//
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//
//
import UIKit

class CheckOutView: UIViewController {
    
    let customBar = UIView()
    
    private let customAlertCancel: CustomAlert = CustomAlert()
    private let customAlertOk: CustomAlert = CustomAlert()
    private let customAlertFail = CustomAlert()
    private var currentReservation: Reservations? {
        var reservation: Reservations?
        reservation = checkOutViewModel.getReservation(currentReservation: &reservation)
        return reservation
    }
    private let checkOutViewModel = CheckOutViewModel()
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
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
    
    lazy var lineView6:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = currentReservation?.space_category?.name?.uppercased() ?? " "
        lb.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        lb.backgroundColor = lb.getTitleLabelBackgroundColor(currentReservation?.space_category?.name?.uppercased() ?? " ")
        lb.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = currentReservation?.slogan ?? " "
        lb.numberOfLines = 2
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
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
        collection.register(CheckOutCustomCell.self, forCellWithReuseIdentifier: "Cell")
        
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        guard let pictures = currentReservation?.picture else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        return pageControl
    }()
    
    lazy var infoLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = currentReservation?.local_name ?? " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = currentReservation?.description ?? " "
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
        lb.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        lb.textAlignment = .left
        return lb
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
        lb.text = checkOutViewModel.getDateString(date: currentReservation?.start_dt)
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
        lb.text = currentReservation?.space_contract_name ?? " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var dayDiaryCheckInLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = checkOutViewModel.getHourString(date: currentReservation?.start_dt)
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var dayDiaryCheckOutLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        lb.text = checkOutViewModel.getHourString(date: currentReservation?.end_dt)
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    lazy var checkInRealizedLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-in realizado às"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var checkOutRealizedLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Check-Out realizado às"
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var hourCheckIn: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = checkOutViewModel.getHourString(date: currentReservation?.checkin_ts)
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var hourCheckOut: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "---"
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
    
    
    lazy var cellIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.cellphone.rawValue)
        
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
        let atritutedString2 = NSMutableAttributedString(string: " R$ \(currentReservation?.payment_amount?.replacingOccurrences(of: ".", with: ",") ?? " ")", attributes: attrs2 as [NSAttributedString.Key : Any])
        
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
        tf.backgroundColor = UIColor(named: ColorsBravve.backgroundCard.rawValue)
        tf.isUserInteractionEnabled = false
        return tf
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
        lb.text = currentReservation?.space_contact?.phone ?? " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var contactEmailLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = currentReservation?.space_contact?.email ?? " "
        lb.numberOfLines = 0
        lb.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        lb.textColor = UIColor(named: ColorsBravve.label.rawValue)
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var checkOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check-out", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        button.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        button.addTarget(self, action: #selector(buttonCheckOut), for: .touchUpInside)
        
        return button
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
        
        return scroll
    }()
    
    lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        var items = [UIStackView]()
        
        var businessHours = UserReservations.spaceDetail?.space_business_hours ?? []
        
        checkOutViewModel.sortBusinessHours(businessHours: &businessHours)
        
        var days = checkOutViewModel.createBusinessHoursArray(businessHours: businessHours)
        
        items.append(createStackView("Ate \(currentReservation?.seats_qty ?? 0) pessoas", UIImage(named: IconsBravve.users.rawValue), textColor: textColor))
        items.append(createStackView("\(currentReservation?.space_address?.street ?? ""), \(currentReservation?.space_address?.neighborhood ?? ""), no \(currentReservation?.space_address?.street_number ?? 0), \(currentReservation?.space_address?.city_name ?? ""). \(currentReservation?.space_address?.state_name ?? "") \(currentReservation?.space_address?.postal_code ?? ""), BR", UIImage(named: IconsBravve.map.rawValue), textColor: textColor))
        items.append(createStackView(days[0], UIImage(named: IconsBravve.clockReserv.rawValue), textColor: textColor))
        
        for i in 0...days.count-1 {
            
            items.append(createStackView(days[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                         isHidden: true,
                                         textColor: textColor))
        }
        
        let buttons = createSeeButtonsStackView(3...items.count-1, items: items)
        
        let stackView = UIStackView(arrangedSubviews: [title] + items + [buttons])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var responsableStackView: UIStackView = {
        
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
        
        let button = createSeeButton(smallText: informations.text ?? "", fullText: "Estarei disponível para esclarecer suas dúvidas e\najudar no que for possível através de mensagem via\nWhatsapp. Garanto que tem tudo para seu conforto\ne melhor rendimento em seu trabalho. Sou casada,\ntenho 3 filhos e 1 cachorro, moro em São Paulo por\nopção. Apaixonada pelo mundo corporativo, resolvi\ncompartilhar um pouco do meu espaço com vocês.", actionLabel: informations)
        
        let stackView = UIStackView(arrangedSubviews: [title, responsableLabel, informations, button] )
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        viewInScroll.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        checkOutViewModel.delegate = self
        
        setupViews()
        setupDefaults()
        setupContraints()
        changeButtonColor()
    }
    
    @objc func buttonMaindoorTap(){
        checkOutViewModel.openDoor()
    }
    
    @objc func buttonOpenSpaceTap(){
        checkOutViewModel.openDoor()
    }
    
    func setupViews(){
        view.addSubview(buttonMainDoor)
        view.addSubview(buttonOpenSpace)
        tabBar.selectedItem = tabBar.items?[1]
        view.addSubview(customBar)
        view.addSubview(tabBar)
        view.addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, infoLocalLabel,
                                  nameLocalLabel, detailLocalLabel, imageDetail, dayLabel, checkInLabel,
                                  checkOutLabel, diaryLabel, dayDiaryCheckInLabel, dayDiaryCheckOutLabel,
                                  lineView1, lineView2,checkInRealizedLabel,checkOutRealizedLabel,hourCheckIn,hourCheckOut,lineView6,imagePay, payFormLabel, creditCard, creditCardTextField,
                                  totalLabel, lineView3, localDetailsStackView, lineView4, responsableStackView,
                                  lineView5,contactsLabel, cellIconImage, emailIconImage, contactNumberLabel,
                                  contactEmailLabel, checkOutButton,pageControl
                                 ])
        
    }
    
    private func createStackView(_ text: String,
                                 _ image: UIImage? = nil,
                                 isHidden: Bool = false,
                                 textColor: UIColor? = .white) -> UIStackView {
        
        let stackView = UIStackView()
        
        if let image = image {
            
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.image = image
            
            stackView.addArrangedSubview(imageView)
            
            imageView.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        }
        
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue,
                            size: CGFloat(12).generateSizeForScreen)
        label.textColor = textColor
        
        stackView.spacing = CGFloat(10).generateSizeForScreen
        stackView.isHidden = isHidden
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }
    
    private func createSeeButtonsStackView(_ range: ClosedRange<Int>,
                                           items: [UIStackView],
                                           titleColor: ColorsBravve = .buttonPink,
                                           downButtonImages: ButtonsBravve = .arrowDownPink,
                                           upButtonImages: ButtonsBravve = .arrowUpPink) -> UIStackView {
        let moreButton = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: ColorsBravve.buttonPink.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais ",
            attributes: yourAttributes)
        moreButton.setAttributedTitle(attributeString, for: .normal)
        moreButton.setImage(UIImage(named: downButtonImages.rawValue),
                            for: .normal)
        moreButton.imageView?.contentMode = .scaleAspectFit
        moreButton.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        moreButton.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)
        
        moreButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        moreButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        moreButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        moreButton.imageView?.constraintInsideTo(.height, moreButton.titleLabel,
                                                 multiplier: 0.5)
        moreButton.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)
        
        let lessButton = UIButton()
        attributeString = NSMutableAttributedString(
            string: "Ver Menos ",
            attributes: yourAttributes)
        lessButton.setAttributedTitle(attributeString, for: .normal)
        lessButton.setImage(UIImage(named: upButtonImages.rawValue),
                            for: .normal)
        lessButton.imageView?.contentMode = .scaleAspectFit
        lessButton.isHidden = true
        lessButton.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        lessButton.titleLabel?.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)
        
        lessButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        lessButton.imageView?.constraintInsideTo(.height, lessButton.titleLabel,
                                                 multiplier: 0.5)
        lessButton.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)
        
        let seeMoreHandler = {(action: UIAction) in
            
            for i in range {
                
                items[i].isHidden = false
            }
            moreButton.isHidden = true
            lessButton.isHidden = false
        }
        
        let seeLessHandler = {(action: UIAction) in
            
            for i in range {
                
                items[i].isHidden = true
            }
            moreButton.isHidden = false
            lessButton.isHidden = true
        }
        
        moreButton.addAction(UIAction(handler: seeMoreHandler), for: .touchUpInside)
        lessButton.addAction(UIAction(handler: seeLessHandler), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [moreButton, lessButton])
        
        return stackView
    }
    
    private func createSeeButton(smallText: String, fullText: String, actionLabel: UILabel) -> UIButton {
        let button = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(named: ColorsBravve.buttonPink.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Ver Mais ",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        attributeString = NSMutableAttributedString(
            string: "Ver Menos ",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .selected)
        
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue),
                        for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowUpPink.rawValue),
                        for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.light.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(9).generateSizeForScreen)
        let handler = {(action: UIAction) in
            button.isSelected = !button.isSelected
            if button.isSelected {
                actionLabel.text = fullText
            } else {
                actionLabel.text = smallText
            }
        }
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        return button
    }
    
    
    func changeButtonColor (){
        
        if checkOutButton.isSelected == true {
            
            checkOutButton.layer.borderColor = UIColor(named: ColorsBravve.buttonPink.rawValue)?.cgColor
            checkOutButton.layer.borderWidth = 1
            checkOutButton.layer.cornerRadius = 12
            checkOutButton.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
        }else {
            
            checkOutButton.layer.borderColor = UIColor(named: ColorsBravve.label.rawValue)?.cgColor
            checkOutButton.layer.borderWidth = 1
            checkOutButton.layer.cornerRadius = 12
            checkOutButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue), for: .normal)
            
            
        }
        
        
    }
    
    @objc func buttonCheckOut(){
        checkOutButton.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
        checkOutButton.layer.borderColor = UIColor(named: ColorsBravve.buttonPink.rawValue)?.cgColor
        
        
        customAlertOk.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Após realizar o check-out você não poderá mais abrir a porta do espaço.", enterAttributed: "Confirmar Check-out", enterHandler: UIAction(handler: { _ in
            
            self.checkOutViewModel.makeCheckOut()
            
        }), cancelAttributed: "Cancelar Check-out", cancelHandler: UIAction(handler: { _ in
            self.customAlertOk.dismissAlert()
            self.checkOutButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue), for: .normal)
            self.checkOutButton.layer.borderColor = UIColor(named: ColorsBravve.label.rawValue)?.cgColor
        }), on: self)
        
    }
    
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Check out"){
            _ in
            if Flags.shared.flagReservation == 3 {
                let vc = HomeClosedView()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                self.dismiss(animated: true)
            }
            
        }
    }
    
    func setupContraints(){
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, buttonMainDoor)
        
        viewInScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 23),
            titleLabel.widthAnchor.constraint(equalToConstant: 76),
            
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            reserveCollection.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveCollection.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            reserveCollection.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            reserveCollection.heightAnchor.constraint(equalToConstant: 300),
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            //            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            //            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
            infoLocalLabel.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor,constant: 52.5),
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
            
            payFormLabel.leadingAnchor.constraint(equalTo: imagePay.trailingAnchor,constant: 9),
            payFormLabel.topAnchor.constraint(equalTo: lineView6.bottomAnchor,constant: 20.5),
            
            imageDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
            
            //            imagePay.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 25),
            imagePay.topAnchor.constraint(equalTo: lineView6.bottomAnchor,constant: 18),
            imagePay.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor,constant: -336),
            
            creditCard.topAnchor.constraint(equalTo: imagePay.bottomAnchor,constant: 26),
            creditCard.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            creditCardTextField.topAnchor.constraint(equalTo: creditCard.bottomAnchor,constant: 5),
            creditCardTextField.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            creditCardTextField.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 67),
            
            totalLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor,constant: 14),
            totalLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
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
            
            checkOutButton.topAnchor.constraint(equalTo: emailIconImage.bottomAnchor,constant: 21.5),
            checkOutButton.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: CGFloat(20).generateSizeForScreen),
            checkOutButton.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            checkOutButton.heightAnchor.constraint(equalToConstant: 52),
            checkOutButton.bottomAnchor.constraint(equalTo: viewInScroll.bottomAnchor, constant: -40),
            
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
            
            buttonMainDoor.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            buttonMainDoor.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            buttonMainDoor.widthAnchor.constraint(equalToConstant: 188),
            buttonMainDoor.heightAnchor.constraint(equalToConstant: 52),
            
            buttonOpenSpace.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            buttonOpenSpace.leadingAnchor.constraint(equalTo: buttonMainDoor.trailingAnchor),
            buttonOpenSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonOpenSpace.widthAnchor.constraint(equalToConstant: 188),
            buttonOpenSpace.heightAnchor.constraint(equalToConstant: 52),
            
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
}

extension CheckOutView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pictures = currentReservation?.picture else { return 0 }
        
        return pictures.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CheckOutCustomCell
        
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
        } else {
            roundedIndex = ceil(index)
        }
        
        self.pageControl.currentPage = Int(roundedIndex)
    }
    
}

extension CheckOutView: CheckOutViewModelProtocol {
    
    func showSuccessAlert() {
        self.customAlertOk.dismissAlert()
        self.customAlertCancel.showAlert(image: UIImage(named: IconsBravve.checkBlue.rawValue), message: "Check-out realizado com sucesso.\nObrigado pela presença!", enterAttributed: "Ok", enterHandler: UIAction(handler: { _ in
            let vc = HistoryDetailsView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            Flags.shared.flagReservation = 4
        }), on: self)
    }
    
    func showFailAlert(message: String) {
        customAlertFail.showAlert(message: message, enterAttributed: "Tentar Novamente", on: self)
    }
    
    
}

