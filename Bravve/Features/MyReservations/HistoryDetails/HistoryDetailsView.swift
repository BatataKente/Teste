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
    
    lazy var clockIconImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clockReserv.rawValue)
        image.isHidden = true
        return image
    }()
    
    lazy var clockIconImage3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clockReserv.rawValue)
        image.isHidden = true
        return image
    }()
    
    lazy var clockIconImage4: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clockReserv.rawValue)
        image.isHidden = true
        return image
    }()
    
    lazy var clockIconImage5: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: IconsBravve.clockReserv.rawValue)
        image.isHidden = true
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
    
    
    lazy var localDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhes do local"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var numberPeopleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Até 6 pessoas"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var localizationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Av. São Joâo, Cj. Boulevard, n°900, São Paulo. SP 06020-010, BR"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var clockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Segunda:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var clockLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Terça:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    lazy var clockLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Quarta:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    lazy var clockLabel4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Quinta:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    lazy var clockLabel5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(12).generateSizeForScreen), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Sexta:", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: " 08:00h - 17:00", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    
    lazy var responsablePeople: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Responsável"
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    lazy var responsableNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.textField.rawValue)]
        
        let atritutedString1 = NSMutableAttributedString(string: "Ana Maria\n", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: "Community Manager", attributes: attrs2 as [NSAttributedString.Key : Any])
        
        atritutedString1.append(atritutedString2)
        atritutedString2.append(atritutedString1)
        label.attributedText = atritutedString1
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionResponsableLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Estarei disponível para esclarecer suas dúvidas e ajudar no que for possível através de mensagem via Whatsapp."
        label.numberOfLines = 0
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.lineBreakMode = .byWordWrapping
        return label
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
    
    lazy var showMoreButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver Mais", for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue),
                        for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        button.titleLabel?.attributedText = NSMutableAttributedString(string: "Ver Mais", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.setTitleColor(UIColor(named: ColorsBravve.pink_cyan.rawValue), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        return button
    }()
    
    lazy var showLessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver Menos", for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowUp.rawValue),
                        for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        button.titleLabel?.attributedText = NSMutableAttributedString(string: "Ver Menos", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.setTitleColor(UIColor(named: ColorsBravve.pink_cyan.rawValue), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        button.isHidden = true
        return button
    }()
    
    lazy var showMoreButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver Mais", for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowDownPink.rawValue),
                        for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        button.titleLabel?.attributedText = NSMutableAttributedString(string: "Ver Mais", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.setTitleColor(UIColor(named: ColorsBravve.pink_cyan.rawValue), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        return button
    }()
    
    lazy var showLessButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver Menos", for: .normal)
        button.setImage(UIImage(named: ButtonsBravve.arrowUp.rawValue),
                        for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
        button.titleLabel?.attributedText = NSMutableAttributedString(string: "Ver Menos", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        button.setTitleColor(UIColor(named: ColorsBravve.pink_cyan.rawValue), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.imageView?.constraintInsideTo(.height, button.titleLabel,
                                             multiplier: 0.5)
        button.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        button.isHidden = true
        return button
    }()
    
    private let readMoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Garanto que tem tudo para seu conforto e melhor rendimento em seu trabalho. Sou casada, tenho 3 filhos e 1 cachorro, moro em São Paulo por opção. Apaixonada pelo mundo corporativo, resolvi compartilhar um pouco do meu espaço com vocês."
        label.isHidden = true
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
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    var lineConstraint: NSLayoutConstraint?
    var lineConstraint2: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        reserveCollection.delegate = self
        reserveCollection.dataSource = self
        
        setupViews()
        setupDefaults()
        setupContraints()
        showMoreButton1.addTarget(nil, action: #selector(showMoreAction), for: .touchUpInside)
        showLessButton.addTarget(nil, action: #selector(showLessAction), for: .touchUpInside)
        
        showMoreButton2.addTarget(nil, action: #selector(showMoreAction2), for: .touchUpInside)
        showLessButton2.addTarget(nil, action: #selector(showLessAction2), for: .touchUpInside)
        lineConstraint?.constant = 0
        lineConstraint2?.constant = 0
        
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
        viewInScroll.addSubviews([titleLabel, descriptLabel, reserveCollection, infoLocalLabel,
                                  nameLocalLabel, detailLocalLabel, imageDetail, dayLabel, checkInLabel,
                                  checkOutLabel, diaryLabel, dayDiaryCheckInLabel, dayDiaryCheckOutLabel,
                                  lineView1, lineView2, imagePay, payFormLabel, creditCard, creditCardTextField,
                                  totalLabel, lineView3, localDetail, numberPeopleImage, numberPeopleLabel,
                                  localizationIconImage, localizationLabel, clockIconImage,clockIconImage2,clockIconImage3,
                                  clockIconImage4, clockIconImage5,clockLabel,clockLabel2,clockLabel3, clockLabel4, clockLabel5,
                                  showMoreButton1, showLessButton, lineView4, responsablePeople,
                                  responsableNameLabel, descriptionResponsableLabel, readMoreLabel,showMoreButton2, showLessButton2,
                                  lineView5,contactsLabel, cellIconImage, emailIconImage, contactNumberLabel,
                                  contactEmailLabel, pageControl, checkInRealizedLabel, checkOutRealizedLabel,
                                  hourCheckIn, hourCheckOut, lineView6
                                 ])
    }
    
    
    @objc func showMoreAction(){
        self.showMoreButton1.isHidden = true
        self.showLessButton.isHidden = false
        self.clockLabel2.isHidden = false
        self.clockLabel3.isHidden = false
        self.clockLabel4.isHidden = false
        self.clockLabel5.isHidden = false
        self.clockIconImage2.isHidden = false
        self.clockIconImage3.isHidden = false
        self.clockIconImage4.isHidden = false
        self.clockIconImage5.isHidden = false
        self.lineConstraint?.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            
        })
        lineConstraint = lineView3.topAnchor.constraint(equalTo: showLessButton.bottomAnchor, constant: 12)
        lineConstraint?.isActive = true
    }
    
    @objc func showLessAction(){
        self.showMoreButton1.isHidden = false
        self.showLessButton.isHidden = true
        self.clockLabel2.isHidden = true
        self.clockLabel3.isHidden = true
        self.clockLabel4.isHidden = true
        self.clockLabel5.isHidden = true
        self.clockIconImage2.isHidden = true
        self.clockIconImage3.isHidden = true
        self.clockIconImage4.isHidden = true
        self.clockIconImage5.isHidden = true
        self.lineConstraint?.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            
        })
        lineConstraint = lineView3.topAnchor.constraint(equalTo: showLessButton.bottomAnchor, constant: -90)
        lineConstraint?.isActive = true
    }
    
    @objc func showMoreAction2(){
        self.showMoreButton2.isHidden = true
        self.showLessButton2.isHidden = false
        self.readMoreLabel.isHidden = false
        lineConstraint2?.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        lineConstraint2 = lineView4.topAnchor.constraint(equalTo: showLessButton2.bottomAnchor, constant: 12)
        lineConstraint2?.isActive = true
    }
    
    @objc func showLessAction2(){
        self.showMoreButton2.isHidden = false
        self.showLessButton2.isHidden = true
        self.readMoreLabel.isHidden = true
        self.lineConstraint2?.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            
        })
        lineConstraint2 = lineView4.topAnchor.constraint(equalTo: showLessButton2.bottomAnchor, constant: -90)
        lineConstraint2?.isActive = true
    }
    
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
            
            localDetail.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 15),
            localDetail.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            numberPeopleImage.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 21.43),
            numberPeopleImage.topAnchor.constraint(equalTo: localDetail.bottomAnchor,constant: 12),
            
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
            
            localizationIconImage.topAnchor.constraint(equalTo: numberPeopleImage.bottomAnchor,constant: 20),
            localizationIconImage.centerXAnchor.constraint(equalTo: numberPeopleImage.centerXAnchor),
            
            clockIconImage.topAnchor.constraint(equalTo: localizationIconImage.bottomAnchor,constant: 20),
            clockIconImage.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            clockIconImage2.topAnchor.constraint(equalTo: clockIconImage.bottomAnchor,constant: 16),
            clockIconImage2.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            clockIconImage3.topAnchor.constraint(equalTo: clockIconImage2.bottomAnchor,constant: 16),
            clockIconImage3.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            clockIconImage4.topAnchor.constraint(equalTo: clockIconImage3.bottomAnchor,constant: 16),
            clockIconImage4.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            clockIconImage5.topAnchor.constraint(equalTo: clockIconImage4.bottomAnchor,constant: 16),
            clockIconImage5.centerXAnchor.constraint(equalTo: localizationIconImage.centerXAnchor),
            
            numberPeopleLabel.centerYAnchor.constraint(equalTo: numberPeopleImage.centerYAnchor),
            numberPeopleLabel.leadingAnchor.constraint(equalTo: numberPeopleImage.trailingAnchor,constant: 12.43),
            
            localizationLabel.centerYAnchor.constraint(equalTo: localizationIconImage.centerYAnchor),
            localizationLabel.leadingAnchor.constraint(equalTo: numberPeopleLabel.leadingAnchor),
            localizationLabel.widthAnchor.constraint(equalToConstant: 248),
            
            clockLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 50),
            clockLabel.centerYAnchor.constraint(equalTo: clockIconImage.centerYAnchor),
            clockLabel.topAnchor.constraint(equalTo: localizationLabel.bottomAnchor, constant: 11),
            
            clockLabel2.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 14.5),
            clockLabel2.leadingAnchor.constraint(equalTo: clockLabel.leadingAnchor),
            clockLabel2.trailingAnchor.constraint(equalTo: clockLabel.trailingAnchor),
            
            clockLabel3.topAnchor.constraint(equalTo: clockLabel2.bottomAnchor, constant: 14.5),
            clockLabel3.leadingAnchor.constraint(equalTo: clockLabel.leadingAnchor),
            clockLabel3.trailingAnchor.constraint(equalTo: clockLabel.trailingAnchor),
            
            clockLabel4.topAnchor.constraint(equalTo: clockLabel3.bottomAnchor, constant: 14.5),
            clockLabel4.leadingAnchor.constraint(equalTo: clockLabel.leadingAnchor),
            clockLabel4.trailingAnchor.constraint(equalTo: clockLabel.trailingAnchor),
            
            clockLabel5.topAnchor.constraint(equalTo: clockLabel4.bottomAnchor, constant: 14.5),
            clockLabel5.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor, constant: 50),
            clockLabel5.trailingAnchor.constraint(equalTo: clockLabel.trailingAnchor),
            
            showMoreButton1.topAnchor.constraint(equalTo: localizationLabel.bottomAnchor,constant: 37),
            showMoreButton1.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            showLessButton.topAnchor.constraint(equalTo: clockLabel5.bottomAnchor,constant: 17),
            showLessButton.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            responsablePeople.topAnchor.constraint(equalTo: lineView3.bottomAnchor,constant: 15),
            responsablePeople.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            responsableNameLabel.topAnchor.constraint(equalTo: responsablePeople.bottomAnchor,constant: 8),
            responsableNameLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            descriptionResponsableLabel.topAnchor.constraint(equalTo: responsableNameLabel.bottomAnchor,constant: 8),
            descriptionResponsableLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            descriptionResponsableLabel.widthAnchor.constraint(equalToConstant: 277),
            
            readMoreLabel.topAnchor.constraint(equalTo: descriptionResponsableLabel.bottomAnchor, constant: 2),
            readMoreLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            readMoreLabel.widthAnchor.constraint(equalToConstant: 277),
            
            showMoreButton2.topAnchor.constraint(equalTo: descriptionResponsableLabel.bottomAnchor,constant: 8),
            showMoreButton2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
            showLessButton2.topAnchor.constraint(equalTo: readMoreLabel.bottomAnchor,constant: 8),
            showLessButton2.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor,constant: 20),
            
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
            
            pageControl.centerXAnchor.constraint(equalTo: reserveCollection.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: reserveCollection.bottomAnchor, constant: 10),
            pageControl.leadingAnchor.constraint(equalTo: reserveCollection.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: reserveCollection.trailingAnchor),
            
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




