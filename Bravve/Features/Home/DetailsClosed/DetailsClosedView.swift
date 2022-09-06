//
//  DetailsCloseView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 11/08/22.
//

import UIKit
import SDWebImage

class DetailsClosedView: UIViewController {
    
    let sessionManager = SessionManager()
    private let space: SpaceDetail
    private let spaceId: Int
    
    private let customBar = UIView()
    
    private lazy var tabBar = TabBarClosed.init(self, itemImagesNames: [ButtonsBravve.locationGray.rawValue,
                                                                        ButtonsBravve.calendarButtonGray.rawValue,
                                                                        ButtonsBravve.userLoginGray.rawValue
                                                                       ])
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        
        guard let pictures = space.pictures else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        return pageControl
    }()
    
    private lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        
        guard var business_hours = space.space_business_hours else { return UIStackView() }
        business_hours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else { return false }
            guard let rhsWeekDay = rhs.week_day else { return false }
            return lhsWeekDay < rhsWeekDay
        }
        
        var texts:[String] {
            var textArray: [String] = []
            
            for business_hour in business_hours {
                
                if business_hour.flag_closed_day != nil {
                    if !business_hour.flag_closed_day! {
                        textArray.append("\(business_hour.day_name ?? ""): \(business_hour.start_time ?? "")h - \(business_hour.end_time ?? "")h")
                    }
                }
            }
            
            return textArray
        }
        
        var itens = [UIStackView]()
        
        itens.append(createStackView("Até \(space.seats_qty ?? 0) pessoas",
                                     UIImage(named: IconsBravve.users.rawValue),
                                     textColor: textColor))
        itens.append(createStackView("\(space.partner_site_address?.address?.street ?? ""), \(space.partner_site_address?.address?.neighborhood ?? ""), nº\(space.partner_site_address?.address?.street_number ?? 0), \(space.partner_site_address?.address?.city_name ?? ""). \(space.partner_site_address?.address?.state_name ?? "") \(space.partner_site_address?.address?.postal_code ?? ""), BR",
                                     UIImage(named: IconsBravve.map.rawValue),
                                     textColor: textColor))
        itens.append(createStackView(texts[0], UIImage(named: IconsBravve.clockReserv.rawValue),
                                     textColor: textColor))
        for i in 1...texts.count-1 {
            
            itens.append(createStackView(texts[i], UIImage(named: IconsBravve.clockReserv.rawValue),
                                         isHidden: true,
                                         textColor: textColor))
        }
        
        let buttons = createSeeButtonsStackView(3...itens.count-1,
                                                itens: itens,
                                                downButtonImages: .arrowDown,
                                                upButtonImages: .arrowUp)
        
        let localDetailsStackView = UIStackView(arrangedSubviews: [title] +
                                                itens +
                                                [buttons])
        localDetailsStackView.axis = .vertical
        localDetailsStackView.alignment = .leading
        localDetailsStackView.spacing = CGFloat(10).generateSizeForScreen
        
        return localDetailsStackView
    }()
    
    private lazy var structureStackView: UIStackView = {
        
        let margins = CGFloat(30).generateSizeForScreen
        
        let textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        
        let title = UILabel()
        title.text = "Estrutura"
        title.font = UIFont(name: FontsBravve.medium.rawValue,
                            size: 15)
        title.textColor = textColor
        
        var texts:[String] {
            
            var facilitiesArray: [String] = []
            
            guard let facilities = space.space_facilities else { return [] }
            for facility in facilities {
                guard let facilityName = facility.name else { return [] }
                facilitiesArray.append(facilityName)
            }
            
            return facilitiesArray
        }
        
        var itens = [UIStackView]()
        
        let structureStackView = UIStackView()
        
        if texts.count < 7 {
            for text in texts {
                itens.append(createStackView(text, textColor: textColor))
            }
            structureStackView.addArrangedSubviews([title] + itens)
        } else {
            for i in 0...5 {
                
                itens.append(createStackView(texts[i],
                                             textColor: textColor))
            }
            
            for i in 6...texts.count - 1 {
                
                itens.append(createStackView(texts[i],
                                             isHidden: true,
                                             textColor: textColor))
            }
            
            let buttons = createSeeButtonsStackView(6...itens.count-1,
                                                    itens: itens,
                                                    titleColor: .capsuleButtonSelected,
                                                    downButtonImages: .arrowDown,
                                                    upButtonImages: .arrowUp)
            structureStackView.addArrangedSubviews([title] + itens + [buttons])
        }
        
        structureStackView.axis = .vertical
        structureStackView.spacing = CGFloat(10).generateSizeForScreen
        structureStackView.backgroundColor = UIColor(named: ColorsBravve.cardStructure.rawValue)
        structureStackView.alignment = .leading
        structureStackView.layer.cornerRadius = CGFloat(25).generateSizeForScreen
        structureStackView.isLayoutMarginsRelativeArrangement = true
        structureStackView.layoutMargins = UIEdgeInsets(top: margins,
                                                        left: margins,
                                                        bottom: margins,
                                                        right: margins)
        
        return structureStackView
    }()
    
    private lazy var localFacilitiesStackView: UIStackView = {
        
        let margins = CGFloat(30).generateSizeForScreen
        
        let title = UILabel()
        title.text = "Facilities do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue,
                            size: 15)
        title.textColor = .white
        
        var texts:[String] {
            
            var facilitiesArray: [String] = []
            
            guard let facilities = space.space_facilities else { return [] }
            for facility in facilities {
                guard let facilityName = facility.name else { return [] }
                facilitiesArray.append(facilityName)
            }
            
            return facilitiesArray
        }
        
        var itens = [UIStackView]()
        
        let localFacilitiesStackView = UIStackView()
        
        if texts.count < 7 {
            for text in texts {
                itens.append(createStackView(text))
            }
            localFacilitiesStackView.addArrangedSubviews([title] + itens)
        } else {
            for i in 0...5 {
                
                itens.append(createStackView(texts[i]))
            }
            
            for i in 6...texts.count - 1 {
                
                itens.append(createStackView(texts[i],
                                             isHidden: true))
            }
            
            let buttons = createSeeButtonsStackView(6...itens.count-1,
                                                    itens: itens,
                                                    titleColor: .capsuleButtonSelected,
                                                    downButtonImages: .arrowDown,
                                                    upButtonImages: .arrowUp)
            localFacilitiesStackView.addArrangedSubviews([title] + itens + [buttons])
        }
        
        localFacilitiesStackView.axis = .vertical
        localFacilitiesStackView.spacing = CGFloat(10).generateSizeForScreen
        localFacilitiesStackView.backgroundColor = UIColor(named: ColorsBravve.cardFacilities.rawValue)
        localFacilitiesStackView.alignment = .leading
        localFacilitiesStackView.layer.cornerRadius = CGFloat(25).generateSizeForScreen
        localFacilitiesStackView.isLayoutMarginsRelativeArrangement = true
        localFacilitiesStackView.layoutMargins = UIEdgeInsets(top: margins,
                                                              left: margins,
                                                              bottom: margins,
                                                              right: margins)
        
        return localFacilitiesStackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let itemSize = 300
        let textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        let black_White = UIColor(named: ColorsBravve.textField.rawValue)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        
        let spaceCategoryNameLabel = UILabel()
        spaceCategoryNameLabel.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        spaceCategoryNameLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                             size: CGFloat(13).generateSizeForScreen)
        spaceCategoryNameLabel.text = space.space_category?.name?.uppercased()
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(spaceCategoryNameLabel)
        titleLabelView.backgroundColor = titleLabelView.getTitleLabelBackgroundColor(space.space_category?.name?.uppercased() ?? "")
        
        spaceCategoryNameLabel.constraintInsideTo(.top, titleLabelView,
                                                  CGFloat(2.5).generateSizeForScreen)
        spaceCategoryNameLabel.constraintInsideTo(.leading, titleLabelView,
                                                  CGFloat(2.5).generateSizeForScreen)
        spaceCategoryNameLabel.constraintInsideTo(.trailing, titleLabelView,
                                                  CGFloat(2.5).generateSizeForScreen)
        spaceCategoryNameLabel.constraintInsideTo(.bottom, titleLabelView,
                                                  CGFloat(2.5).generateSizeForScreen)
        
        let sloganLabel = UILabel()
        sloganLabel.text = space.slogan
        sloganLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                  size: CGFloat(20).generateSizeForScreen)
        sloganLabel.textColor = textColor
        sloganLabel.numberOfLines = 0
        
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        
        scrollView.addSubview(view)
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(DetailsClosedCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        photoCollectionView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        let localLabel = UILabel()
        localLabel.text = space.local_name
        localLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                size: CGFloat(20).generateSizeForScreen)
        localLabel.textColor = textColor
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = space.description
        descriptionLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        descriptionLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: 12)
        
        let hourlyLabel = UILabel()
        hourlyLabel.text = space.hourly_credits
        hourlyLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(30).generateSizeForScreen)
        hourlyLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        
        let creditHourLabel = UILabel()
        creditHourLabel.text = "crédito/hora"
        creditHourLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        creditHourLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let dailyLabel = UILabel()
        dailyLabel.text = space.daily_credits
        dailyLabel.textColor = textColor
        dailyLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(20).generateSizeForScreen)
        
        let creditDayLabel = UILabel()
        creditDayLabel.text = "crédito/dia"
        creditDayLabel.textColor = textColor
        creditDayLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let buttons = createCapsuleButtons([space.space_classification?.name ?? "", space.space_type?.name ?? "", space.space_noise_level?.name ?? ""],
                                           .capsuleButton,
                                           strokeColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) ?? UIColor())
        
        let tagsStackView = UIStackView(arrangedSubviews: buttons)
        tagsStackView.spacing = 5
        
        let briefingLabel = UILabel()
        briefingLabel.text = """
        Sentiu o cheirinho de café e já veio aquela energia extra? Pois é bem assim que a gente se sente neste espaço: renovado. Se é porquê a decoração suave e orgânica nos deixa mais concentrados ou por conta do silêncio da localização você que vai nos dizer.
        
        Um refúgio paulistano na esquina da Gabriel Monteiro da Silva com a Juquiá,  o paraíso do design. Com uma pegada cultural, o Kamy propicia a seus frequentadores encontrar exposições de diferentes artistas no seu espaço.
        
        Trabalho + Café + Cultura, precisa de mais? Então reserve =).
        """
        briefingLabel.textColor = black_White
        briefingLabel.numberOfLines = 0
        briefingLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let nameLabel = UILabel()
        nameLabel.text = "Giovanna"
        nameLabel.textColor = textColor
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let officeLabel = UILabel()
        officeLabel.text = "Community Manager"
        officeLabel.textColor = textColor
        officeLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        view.addSubviews([titleLabelView, sloganLabel, photoCollectionView, pageControl, tagsStackView, localLabel, descriptionLabel, hourlyLabel, creditHourLabel, dailyLabel, creditDayLabel, briefingLabel, nameLabel, officeLabel, localDetailsStackView, structureStackView, localFacilitiesStackView])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        titleLabelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: CGFloat(20).generateSizeForScreen).isActive = true
        
        sloganLabel.topAnchor.constraint(equalTo: spaceCategoryNameLabel.bottomAnchor,
                                         constant: CGFloat(20).generateSizeForScreen).isActive = true
        sloganLabel.leadingAnchor.constraint(equalTo: spaceCategoryNameLabel.leadingAnchor).isActive = true
        sloganLabel.widthAnchor.constraint(equalToConstant: CGFloat(215).generateSizeForScreen).isActive = true
        
        photoCollectionView.topAnchor.constraint(equalTo: sloganLabel.bottomAnchor,
                                                 constant: CGFloat(20).generateSizeForScreen).isActive = true
        photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        photoCollectionView.heightAnchor.constraint(equalToConstant: collectionViewFlowLayout.itemSize.height).isActive = true
        
        pageControl.centerXAnchor.constraint(equalTo: photoCollectionView.centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: photoCollectionView.bottomAnchor,
                                         constant: CGFloat(10).generateSizeForScreen).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: photoCollectionView.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: photoCollectionView.trailingAnchor).isActive = true
        
        localLabel.topAnchor.constraint(equalTo: photoCollectionView.bottomAnchor,
                                        constant: CGFloat(45).generateSizeForScreen).isActive = true
        localLabel.leadingAnchor.constraint(equalTo: sloganLabel.leadingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor,
                                        constant: CGFloat(7.5).generateSizeForScreen).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: localLabel.leadingAnchor).isActive = true
        
        hourlyLabel.centerYAnchor.constraint(equalTo: localLabel.centerYAnchor).isActive = true
        hourlyLabel.trailingAnchor.constraint(equalTo: creditHourLabel.leadingAnchor,
                                              constant: CGFloat(-5).generateSizeForScreen).isActive = true
        
        creditHourLabel.bottomAnchor.constraint(equalTo: hourlyLabel.bottomAnchor).isActive = true
        creditHourLabel.trailingAnchor.constraint(equalTo: photoCollectionView.trailingAnchor,
                                                  constant: CGFloat(-20).generateSizeForScreen).isActive = true
        
        dailyLabel.topAnchor.constraint(equalTo: hourlyLabel.bottomAnchor,
                                        constant: CGFloat(5).generateSizeForScreen).isActive = true
        dailyLabel.leadingAnchor.constraint(equalTo: hourlyLabel.leadingAnchor).isActive = true
        
        creditDayLabel.leadingAnchor.constraint(equalTo: dailyLabel.trailingAnchor,
                                                constant: CGFloat(5).generateSizeForScreen).isActive = true
        creditDayLabel.trailingAnchor.constraint(equalTo: photoCollectionView.trailingAnchor,
                                                 constant: CGFloat(-20).generateSizeForScreen).isActive = true
        creditDayLabel.bottomAnchor.constraint(equalTo: dailyLabel.bottomAnchor).isActive = true
        
        tagsStackView.topAnchor.constraint(equalTo: creditDayLabel.bottomAnchor,
                                           constant: CGFloat(20).generateSizeForScreen).isActive = true
        tagsStackView.leadingAnchor.constraint(equalTo: localLabel.leadingAnchor).isActive = true
        tagsStackView.trailingAnchor.constraint(equalTo: creditHourLabel.trailingAnchor).isActive = true
        
        briefingLabel.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor,
                                           constant: CGFloat(20).generateSizeForScreen).isActive = true
        briefingLabel.leadingAnchor.constraint(equalTo: tagsStackView.leadingAnchor).isActive = true
        briefingLabel.trailingAnchor.constraint(equalTo: tagsStackView.trailingAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: briefingLabel.bottomAnchor,
                                       constant: CGFloat(20).generateSizeForScreen).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: briefingLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: briefingLabel.trailingAnchor).isActive = true
        
        officeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        officeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        officeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        
        localDetailsStackView.topAnchor.constraint(equalTo: officeLabel.bottomAnchor,
                                                   constant: CGFloat(20).generateSizeForScreen).isActive = true
        localDetailsStackView.leadingAnchor.constraint(equalTo: officeLabel.leadingAnchor).isActive = true
        localDetailsStackView.trailingAnchor.constraint(equalTo: officeLabel.trailingAnchor).isActive = true
        
        structureStackView.topAnchor.constraint(equalTo: localDetailsStackView.bottomAnchor,
                                                constant: CGFloat(20).generateSizeForScreen).isActive = true
        structureStackView.leadingAnchor.constraint(equalTo: localFacilitiesStackView.leadingAnchor).isActive = true
        structureStackView.trailingAnchor.constraint(equalTo: localFacilitiesStackView.trailingAnchor).isActive = true
        
        localFacilitiesStackView.topAnchor.constraint(equalTo: structureStackView.bottomAnchor,
                                                      constant: CGFloat(20).generateSizeForScreen).isActive = true
        localFacilitiesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                          constant: CGFloat(20).generateSizeForScreen).isActive = true
        localFacilitiesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: CGFloat(-20).generateSizeForScreen).isActive = true
        localFacilitiesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                         constant: CGFloat(-20).generateSizeForScreen).isActive = true
        
        return scrollView
    }()
    
    init(_ space: SpaceDetail, spaceId: Int) {
        self.space = space
        self.spaceId = spaceId
        super.init(nibName: nil, bundle: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDefaults()
        setupConstraints()
        reserveButton.addTarget(self, action: #selector(reserveButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                                           itens: [UIStackView],
                                           titleColor: ColorsBravve = .buttonPink,
                                           downButtonImages: ButtonsBravve,
                                           upButtonImages: ButtonsBravve) -> UIStackView {
        let moreButton = UIButton()
        moreButton.setTitle("Ver Mais", for: .normal)
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
        moreButton.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        let lessButton = UIButton()
        lessButton.setTitle("Ver Menos", for: .normal)
        lessButton.setImage(UIImage(named: upButtonImages.rawValue),
                            for: .normal)
        lessButton.imageView?.contentMode = .scaleAspectFit
        lessButton.isHidden = true
        lessButton.setTitleColor(UIColor(named: titleColor.rawValue), for: .normal)
        lessButton.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue,
                                             size: CGFloat(12).generateSizeForScreen)
        
        lessButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        lessButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        lessButton.imageView?.constraintInsideTo(.height, lessButton.titleLabel,
                                                 multiplier: 0.5)
        lessButton.imageView?.widthAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        
        let seeMoreHandler = {(action: UIAction) in
            
            for i in range {
                
                itens[i].isHidden = false
            }
            moreButton.isHidden = true
            lessButton.isHidden = false
        }
        
        let seeLessHandler = {(action: UIAction) in
            
            for i in range {
                
                itens[i].isHidden = true
            }
            moreButton.isHidden = false
            lessButton.isHidden = true
        }
        
        moreButton.addAction(UIAction(handler: seeMoreHandler), for: .touchUpInside)
        lessButton.addAction(UIAction(handler: seeLessHandler), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [moreButton, lessButton])
        
        return stackView
    }
    
    @objc let reserveButton = UIButton()
    
    private func setupView() {
        
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        view.addSubviews([customBar, scrollView, reserveButton, tabBar])
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    private func setupDefaults() {
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço") {_ in
            
            self.dismiss(animated: false)
        }
        reserveButton.setToBottomButtonDefaultAbove("Reservar",
                                                    backgroundColor: .buttonPink,
                                                    above: tabBar)
        
    }
    
    @objc func reserveButtonTapped(){
        let reserveViewController = WorkPassBookingView(self.space, spaceId: spaceId)
        reserveViewController.modalPresentationStyle = .fullScreen
        present(reserveViewController, animated: true)
    }
    
    private func setupConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        customBar.translatesAutoresizingMaskIntoConstraints = false
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: customBar.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: reserveButton.topAnchor).isActive = true
        
        tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension DetailsClosedView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let pictures = space.pictures else { return 0 }
        
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DetailsClosedCollectionViewCell
        
        guard let pictures = space.pictures else { return UICollectionViewCell() }
        
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
