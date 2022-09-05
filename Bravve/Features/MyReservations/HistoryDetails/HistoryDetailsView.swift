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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.31
        label.attributedText = NSMutableAttributedString(string: "Numa esquina charmosa, um hotel", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home by Kamy"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "09/04/22"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var checkInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-in"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    lazy var checkOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-Out"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var diaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Diária"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var dayDiaryCheckInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "09:00"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var dayDiaryCheckOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20:00"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var payFormLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forma de pagamento"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        return label
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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cartão de crédito"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Total:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " R$ 560,87", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var creditCardTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "    **** **** **** 4679"
        textField.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        textField.backgroundColor = UIColor(named: ColorsBravve.backgroundCard.rawValue)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = false
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    
    lazy var contactsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contatos"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var contactNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(11) 99999-9999"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    lazy var contactEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "giovanna@empresaexe.com.br"
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
        
        return scroll
    }()
    
    lazy var checkInRealizedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-in realizado ás"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var checkOutRealizedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check-Out realizado ás"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var hourCheckIn: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "09:04"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var hourCheckOut: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20:00"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.textAlignment = .left
        return label
    }()
    lazy var lineView6:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: 15)
        title.textColor = UIColor(named: ColorsBravve.label.rawValue)
        
        var items = [UIStackView]()
        var days = ["Segunda: 08:00h - 17:00h", "Terça: 08:00h - 17:00h", "Quarta: 08:00h - 17:00h", "Quinta: 08:00h - 17:00h", "Sexta: 08:00h - 17:00h"]
        
        items.append(createStackView("Ate 6 pessoas", UIImage(named: IconsBravve.users.rawValue), textColor: textColor))
        items.append(createStackView("Av. Sao Joao, CJ. Boulevard, no 900, Sao Paulo. SP 06020-010, BR", UIImage(named: IconsBravve.map.rawValue), textColor: textColor))
        items.append(createStackView(days[0], UIImage(named: IconsBravve.clockReserv.rawValue), textColor: textColor))
        
        for i in 1...days.count-1 {
            
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
        
        let atritutedString1 = NSMutableAttributedString(string: "Ana Maria\n", attributes: attrs1 as [NSAttributedString.Key : Any])
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
    
    @objc func buttonMaindoorTap(){
        print("main door")
    }
    
    @objc func buttonOpenSpaceTap(){
        print("space door")
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
    
    
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço"){
            _ in
            if flagReservation == 4 {
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
        scrollView.constraintOutsideTo(.bottom, tabBar)
        
        viewInScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewInScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        NSLayoutConstraint.activate([
            
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
}

extension HistoryDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        guard let pictures = space.pictures else { return 0 }
        //
        //        return pictures.count
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HistoryDetailsCollectionViewCell
        
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




