//
//  OpenDetailsView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import SDWebImage

class OpenDetailsView: UIViewController {
    
    init(_ space: SpaceDetail) {
        
        self.space = space
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    let sessionManager = SessionManager()
    
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
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    
    private var space: SpaceDetail
    
    private let customBar = UIView()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
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
    
    private lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        
        guard var business_hours = space.space_business_hours else { return UIStackView() }
        business_hours.sort { (lhs: SpaceBusinessHours, rhs: SpaceBusinessHours) in
            
            guard let lhsWeekDay = lhs.week_day else {return false}
            guard let rhsWeekDay = rhs.week_day else {return false}
            
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
    
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        
        guard let pictures = space.pictures else { return pageControl }
        pageControl.numberOfPages = pictures.count
        pageControl.backgroundStyle = .prominent
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        return pageControl
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let itemSize = 256
        let textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        let black_White = UIColor(named: ColorsBravve.textField.rawValue)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        
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
        view.layer.cornerRadius = 12
        
        scrollView.addSubview(view)
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(OpenDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        photoCollectionView.setToDefaultBackgroundColor()
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        let nameLabel = UILabel()
        nameLabel.text = space.local_name
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(20).generateSizeForScreen)
        nameLabel.textColor = textColor
        
        let label_1 = UILabel()
        label_1.text = space.description
        label_1.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label_1.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: 12)
        
        let label_2 = UILabel()
        label_2.text = space.hourly_credits
        label_2.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(30).generateSizeForScreen)
        label_2.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        
        let label_3 = UILabel()
        label_3.text = "crédito/hora"
        label_3.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        label_3.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let label_4 = UILabel()
        label_4.text = space.daily_credits
        label_4.textColor = textColor
        label_4.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(20).generateSizeForScreen)
        
        let label_5 = UILabel()
        label_5.text = "crédito/dia"
        label_5.textColor = textColor
        label_5.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let buttons = createCapsuleButtons([space.space_classification?.name ?? "", space.space_type?.name ?? "", space.space_noise_level?.name ?? ""],
                                            .capsuleButton,
                                            strokeColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) ?? UIColor())
        
        let tagsStackView = UIStackView(arrangedSubviews: buttons)
        tagsStackView.spacing = 5
        
        let label_6 = UILabel()
        label_6.text = """
        Sentiu o cheirinho de café e já veio aquela energia extra? Pois é bem assim que a gente se sente neste espaço: renovado. Se é porquê a decoração suave e orgânica nos deixa mais concentrados ou por conta do silêncio da localização você que vai nos dizer.
        
        Um refúgio paulistano na esquina da Gabriel Monteiro da Silva com a Juquiá,  o paraíso do design. Com uma pegada cultural, o Kamy propicia a seus frequentadores encontrar exposições de diferentes artistas no seu espaço.

        Trabalho + Café + Cultura, precisa de mais? Então reserve =).
        """
        label_6.textColor = black_White
        label_6.numberOfLines = 0
        label_6.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let label_7 = UILabel()
        label_7.text = "Giovanna"
        label_7.textColor = textColor
        label_7.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let label_8 = UILabel()
        label_8.text = "Community Manager"
        label_8.textColor = textColor
        label_8.font = UIFont(name: FontsBravve.regular.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        view.addSubviews([titleLabelView, sloganLabel, photoCollectionView, pageControl, tagsStackView, nameLabel, label_1, label_2, label_3, label_4, label_5, label_6, label_7, label_8, localDetailsStackView, structureStackView, localFacilitiesStackView])
        
        view.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        titleLabelView.constraintInsideTo(.top, view)
        titleLabelView.constraintInsideTo(.leading, view, CGFloat(20).generateSizeForScreen)
        
        sloganLabel.constraintOutsideTo(.top, spaceCategoryNameLabel, CGFloat(20).generateSizeForScreen)
        sloganLabel.constraintInsideTo(.leading, spaceCategoryNameLabel)
        sloganLabel.widthAnchorInSuperview(CGFloat(215).generateSizeForScreen)
        
        photoCollectionView.constraintOutsideTo(.top, sloganLabel, CGFloat(20).generateSizeForScreen)
        photoCollectionView.constraintInsideTo(.leading, sloganLabel)
        photoCollectionView.constraintInsideTo(.trailing, view)
        photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        pageControl.constraintInsideTo(.centerX, photoCollectionView)
        pageControl.constraintOutsideTo(.top, photoCollectionView,
                                        CGFloat(10).generateSizeForScreen)
        pageControl.constraintInsideTo(.leading, photoCollectionView)
        pageControl.constraintInsideTo(.trailing, photoCollectionView)
        
        nameLabel.constraintOutsideTo(.top,  photoCollectionView, CGFloat(45).generateSizeForScreen)
        nameLabel.constraintInsideTo(.leading, photoCollectionView)
        
        label_1.constraintOutsideTo(.top, nameLabel, CGFloat(7.5).generateSizeForScreen)
        label_1.constraintInsideTo(.leading, nameLabel)
        
        label_2.constraintInsideTo(.centerY, nameLabel)
        label_2.constraintOutsideTo(.trailing, label_3, CGFloat(5).generateSizeForScreen)
        
        label_3.constraintInsideTo(.bottom, label_2)
        label_3.constraintInsideTo(.trailing, photoCollectionView, CGFloat(20).generateSizeForScreen)
        
        label_4.constraintOutsideTo(.top, label_2,
                                    CGFloat(5).generateSizeForScreen)
        label_4.constraintInsideTo(.leading, label_2)
        
        label_5.constraintOutsideTo(.leading, label_4,
                                    CGFloat(5).generateSizeForScreen)
        label_5.constraintInsideTo(.bottom, label_4)
        
        tagsStackView.constraintOutsideTo(.top, label_5,
                                          CGFloat(20).generateSizeForScreen)
        tagsStackView.constraintInsideTo(.leading, nameLabel)
        tagsStackView.constraintInsideTo(.trailing, label_3)
        
        label_6.constraintOutsideTo(.top, tagsStackView,
                                    CGFloat(20).generateSizeForScreen)
        label_6.constraintInsideTo(.leading, tagsStackView)
        label_6.constraintInsideTo(.trailing, tagsStackView)
        
        label_7.constraintOutsideTo(.top, label_6,
                                    CGFloat(20).generateSizeForScreen)
        label_7.constraintInsideTo(.leading, label_6)
        label_7.constraintInsideTo(.trailing, label_6)
        
        label_8.constraintOutsideTo(.top, label_7)
        label_8.constraintInsideTo(.leading, label_7)
        label_8.constraintInsideTo(.trailing, label_7)
        
        localDetailsStackView.constraintOutsideTo(.top, label_8,
                                                  CGFloat(20).generateSizeForScreen)
        localDetailsStackView.constraintInsideTo(.leading, label_8)
        localDetailsStackView.constraintInsideTo(.trailing, label_8)
        
        structureStackView.constraintOutsideTo(.top, localDetailsStackView,
                                               CGFloat(20).generateSizeForScreen)
        structureStackView.constraintInsideTo(.leading, localFacilitiesStackView)
        structureStackView.constraintInsideTo(.trailing, localFacilitiesStackView)
        
        localFacilitiesStackView.constraintOutsideTo(.top, structureStackView,
                                                     CGFloat(20).generateSizeForScreen)
        localFacilitiesStackView.constraintInsideTo(.leading, view,
                                                    CGFloat(20).generateSizeForScreen)
        localFacilitiesStackView.constraintInsideTo(.trailing, view,
                                                    CGFloat(20).generateSizeForScreen)
        
        localFacilitiesStackView.constraintInsideTo(.bottom, view,
                                                    CGFloat(20).generateSizeForScreen)
        
        return scrollView
    }()
    
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
        let reserveViewController = LoginView()
        reserveViewController.modalPresentationStyle = .fullScreen
        present(reserveViewController, animated: true)
    }
    
    private func setupConstraints() {
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        scrollView.constraintOutsideTo(.bottom, reserveButton)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension OpenDetailsView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let pictures = space.pictures else { return 0 }
        
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? OpenDetailsCollectionViewCell
        
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

