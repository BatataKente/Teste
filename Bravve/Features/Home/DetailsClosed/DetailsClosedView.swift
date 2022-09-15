//
//  DetailsCloseView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 11/08/22.
//

import UIKit
import SDWebImage

class DetailsClosedView: UIViewController {
    
    struct ViewElements {
        
        let scroll: UIScrollView, photoCollectionView: UICollectionView
    }
    
    let sessionManager = SessionManager()
    private let space: SpaceDetail
    private let spaceId: Int
    private let cellIdentifier = "Cell"
    
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
        pageControl.currentPageIndicatorTintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        pageControl.addTarget(self, action: #selector(pageControlTarget),
                              for: .touchUpInside)
        
        return pageControl
    }()
    
    private lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        title.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
        
        guard var business_hours = space.space_business_hours else {return UIStackView()}
        detailsClosedViewModel.sortBusinessHours(businessHours: &business_hours)
        
        var attributedTexts:[NSAttributedString] = detailsClosedViewModel.createBusinessHoursArray(businessHours: business_hours)
        
        var itens = [UIStackView]()
        let localDetailsStackView = UIStackView(arrangedSubviews: [title])
        
        detailsClosedViewModel.createItensStackView(itens: &itens,
                                                    attributedTexts: attributedTexts,
                                                    textColor: textColor ?? UIColor(), seats_qty: space.seats_qty ?? 0, street: space.partner_site_address?.address?.street ?? "", neighborhood: space.partner_site_address?.address?.neighborhood ?? "", streetNumber: space.partner_site_address?.address?.street_number ?? 0, cityName: space.partner_site_address?.address?.city_name ?? "", stateName: space.partner_site_address?.address?.state_name ?? "", postalCode: space.partner_site_address?.address?.postal_code ?? "")
        
        if !attributedTexts.isEmpty {
        let button = detailsClosedViewModel.createSeeButtonsStackView(3...itens.count-1,
                                                                    itens: itens, arrowDownImage: UIImage(named: ButtonsBravve.arrowDownPink.rawValue), arrowUpImage: UIImage(named: ButtonsBravve.arrowUpPink.rawValue))
            
        
            localDetailsStackView.addArrangedSubviews(itens + [button])
        }
        else {
            
            localDetailsStackView.addArrangedSubviews(itens)
        }
        
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
        title.font = UIFont(name: FontsBravve.koho.rawValue,
                            size: 24)
        title.textColor = textColor
        
        var texts:[String] = detailsClosedViewModel.createFacilitiesArray(facilities: space.space_facilities)
        
        var itens = [UIStackView]()
        
        let structureStackView = UIStackView()
        
        detailsClosedViewModel.addItemsInStructureStackView(texts: texts, itens: &itens, structureStackView: structureStackView, textColor: textColor, title: title, seeMoreColor: .blue, arrowUpImage: UIImage(named: ButtonsBravve.arrowUp.rawValue), arrowDownImage: UIImage(named: ButtonsBravve.arrowDownBlue.rawValue))

        structureStackView.axis = .vertical
        structureStackView.alignment = .leading
        structureStackView.spacing = CGFloat(10).generateSizeForScreen
        structureStackView.backgroundColor = UIColor(named: ColorsBravve.cardStructure.rawValue)
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
        title.font = UIFont(name: FontsBravve.koho.rawValue,
                            size: 24)
        title.textColor = .white
        
        var texts:[String] = detailsClosedViewModel.createFacilitiesArray(facilities: space.space_facilities)

        var itens = [UIStackView]()
        
        let localFacilitiesStackView = UIStackView()
        
        detailsClosedViewModel.addItemsInStructureStackView(texts: texts, itens: &itens, structureStackView: localFacilitiesStackView, textColor: UIColor(named: ColorsBravve.white_white.rawValue), title: title, seeMoreColor: .white_white, arrowUpImage: UIImage(named: ButtonsBravve.arrowUpWhite.rawValue), arrowDownImage: UIImage(named: ButtonsBravve.arrowDownWhite.rawValue))
        
        localFacilitiesStackView.axis = .vertical
        localFacilitiesStackView.alignment = .leading
        localFacilitiesStackView.spacing = CGFloat(10).generateSizeForScreen
        localFacilitiesStackView.backgroundColor = UIColor(named: ColorsBravve.cardFacilities.rawValue)
        localFacilitiesStackView.layer.cornerRadius = CGFloat(25).generateSizeForScreen
        localFacilitiesStackView.isLayoutMarginsRelativeArrangement = true
        localFacilitiesStackView.layoutMargins = UIEdgeInsets(top: margins,
                                                              left: margins,
                                                              bottom: margins,
                                                              right: margins)
        
        return localFacilitiesStackView
    }()
    
    private lazy var viewElements: ViewElements = {
        
        let itemSize = 300
        let black_White = UIColor(named: ColorsBravve.textField.rawValue)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.delegate = self
        
        let spaceCategoryNameLabel = UILabel()
        spaceCategoryNameLabel.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        spaceCategoryNameLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        spaceCategoryNameLabel.text = space.space_category?.name?.uppercased()
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(spaceCategoryNameLabel)
        titleLabelView.backgroundColor = titleLabelView.getTitleLabelBackgroundColor(space.space_category?.name?.uppercased() ?? "")
        
        spaceCategoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        spaceCategoryNameLabel.topAnchor.constraint(equalTo: titleLabelView.topAnchor, constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor, constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.trailingAnchor.constraint(equalTo: titleLabelView.trailingAnchor, constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        
        let sloganLabel = detailsClosedViewModel.createLabel(space.slogan,
                                                           UIFont(name: FontsBravve.regular.rawValue,
                                                                  size: CGFloat(20).generateSizeForScreen))
        
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        scrollView.addSubview(view)
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(OpenDetailsCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        photoCollectionView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        photoCollectionView.showsHorizontalScrollIndicator = false
        
        let localLabel = detailsClosedViewModel.createLabel(space.local_name,
                                                          UIFont(name: FontsBravve.bold.rawValue,
                                                                 size: CGFloat(20).generateSizeForScreen))
        
        let descriptionLabel = detailsClosedViewModel.createLabel(space.description,
                                                                textColor: UIColor(named: ColorsBravve.label.rawValue))
        
        let hourlyLabel = detailsClosedViewModel.createLabel(space.hourly_credits,
                                                           UIFont(name: FontsBravve.bold.rawValue,
                                                                  size: CGFloat(30).generateSizeForScreen),
                                                           textColor: UIColor(named: ColorsBravve.pink_white.rawValue))
        
        let creditHourLabel = detailsClosedViewModel.createLabel("crédito/hora",
                                                               textColor: UIColor(named: ColorsBravve.pink_white.rawValue))
        
        let dailyLabel = detailsClosedViewModel.createLabel(space.daily_credits)
        
        let creditDayLabel = detailsClosedViewModel.createLabel("crédito/dia")
        
        let buttons = createCapsuleButtons([space.space_classification?.name ?? "", space.space_type?.name ?? "", space.space_noise_level?.name ?? ""],
                                            .capsuleButton,
                                            strokeColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) ?? UIColor())
        
        let tagsStackView = UIStackView(arrangedSubviews: buttons)
        tagsStackView.spacing = CGFloat(5).generateSizeForScreen
        
        let briefingLabel = detailsClosedViewModel.createLabel("""
        Sentiu o cheirinho de café e já veio aquela energia extra? Pois é bem assim que a gente se sente neste espaço: renovado. Se é porquê a decoração suave e orgânica nos deixa mais concentrados ou por conta do silêncio da localização você que vai nos dizer.
        
        Um refúgio paulistano na esquina da Gabriel Monteiro da Silva com a Juquiá,  o paraíso do design. Com uma pegada cultural, o Kamy propicia a seus frequentadores encontrar exposições de diferentes artistas no seu espaço.

        Trabalho + Café + Cultura, precisa de mais? Então reserve =).
        """,
                                                             textColor: black_White)
        
        let spaceContact = detailsClosedViewModel.verifyContacts(space.contact)
//        necessario verificar todas as informacoes que serao apresentadas na tela returando informacoes mocadas, porem nao consegui verificar ainda, API vem incompleta
//        print(spaceContact,"$$$")
//        print(space,"$$$")
        
        let nameLabel = detailsClosedViewModel.createLabel(spaceContact[0].name,
                                                         UIFont(name: FontsBravve.bold.rawValue,
                                                                size: CGFloat(12).generateSizeForScreen))
        
        let officeLabel = detailsClosedViewModel.createLabel("Community Manager")
        
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
        
        
        return ViewElements(scroll: scrollView,
                            photoCollectionView: photoCollectionView)
    }()
    
    let detailsClosedViewModel = DetailsClosedViewModel()
    
    init(_ space: SpaceDetail, spaceId: Int) {
        
        self.space = space
        self.spaceId = spaceId
        super.init(nibName: nil, bundle: nil)
    }
    
    override var prefersStatusBarHidden: Bool {true}
    
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
    
    @objc let reserveButton = UIButton()
    
    private func setupView() {
        
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        view.addSubviews([customBar, viewElements.scroll, reserveButton, tabBar])
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
        
        viewElements.scroll.translatesAutoresizingMaskIntoConstraints = false
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        customBar.translatesAutoresizingMaskIntoConstraints = false
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewElements.scroll.topAnchor.constraint(equalTo: customBar.bottomAnchor).isActive = true
        viewElements.scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        viewElements.scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        viewElements.scroll.bottomAnchor.constraint(equalTo: reserveButton.topAnchor).isActive = true
        
        tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func pageControlTarget(_ sender: UIPageControl) {
        
        DispatchQueue.main.async {
            
            self.viewElements.photoCollectionView.scrollToItem(at: IndexPath(row: sender.currentPage,
                                                                             section: 0),
                                                               at: .centeredHorizontally, animated: true)
        }
    }
}

extension DetailsClosedView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let pictures = space.pictures else { return 0 }
        
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? OpenDetailsCollectionViewCell
        
        guard let pictures = space.pictures else { return UICollectionViewCell() }
        
        guard let picture = pictures[indexPath.row].url else { return UICollectionViewCell() }
        
        cell?.imageView.sd_setImage(with: URL(string: picture))
        
        guard let workpass = space.allow_workpass else {return cell ?? UICollectionViewCell()}
        if workpass {cell?.createWorkPassLabel()}
        
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

