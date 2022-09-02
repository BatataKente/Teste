//
//  OpenDetailsView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import SDWebImage

class OpenDetailsView: UIViewController {
    
    private var space: SpaceDetail
    
    private let customBar = UIView()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
    private lazy var localDetailsStackView: UIStackView = {
        
        let textColor = UIColor(named: ColorsBravve.textField.rawValue)
        
        let title = UILabel()
        title.textColor = textColor
        title.text = "Detalhes do local"
        
        guard var business_hours = space.space_business_hours else { return UIStackView() }
        
        detailsOpenViewModel.sortBusinessHours(businessHours: &business_hours)
        
        var texts:[String] = detailsOpenViewModel.createBusinessHoursArray(businessHours: business_hours)
   
        var itens = [UIStackView]()
        
        detailsOpenViewModel.createItensStackView(itens: &itens, texts: texts, textColor: textColor ?? UIColor(), seats_qty: space.seats_qty ?? 0, street: space.partner_site_address?.address?.street ?? "", neighborhood: space.partner_site_address?.address?.neighborhood ?? "", streetNumber: space.partner_site_address?.address?.street_number ?? 0, cityName: space.partner_site_address?.address?.city_name ?? "", stateName: space.partner_site_address?.address?.state_name ?? "", postalCode: space.partner_site_address?.address?.postal_code ?? "")
        
        let button = detailsOpenViewModel.createSeeButtonsStackView(3...itens.count-1,
                                                                    itens: itens, arrowDownImage: UIImage(named: ButtonsBravve.arrowDownPink.rawValue), arrowUpImage: UIImage(named: ButtonsBravve.arrowUpPink.rawValue))
        
        let localDetailsStackView = UIStackView(arrangedSubviews: [title] +
                                                itens +
                                                [button])
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
                            size: 15)
        title.textColor = textColor
        
        var texts:[String] = detailsOpenViewModel.createFacilitiesArray(facilities: space.space_facilities)

        var itens = [UIStackView]()
        
        let structureStackView = UIStackView()
        
        detailsOpenViewModel.addItemsInStructureStackView(texts: texts, itens: &itens, structureStackView: structureStackView, textColor: textColor, title: title, seeMoreColor: .blue, arrowUpImage: UIImage(named: ButtonsBravve.arrowUp.rawValue), arrowDownImage: UIImage(named: ButtonsBravve.arrowDownBlue.rawValue))

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
                            size: 15)
        title.textColor = .white
        
        var texts:[String] = detailsOpenViewModel.createFacilitiesArray(facilities: space.space_facilities)

        var itens = [UIStackView]()
        
        let localFacilitiesStackView = UIStackView()
        
        detailsOpenViewModel.addItemsInStructureStackView(texts: texts, itens: &itens, structureStackView: localFacilitiesStackView, textColor: UIColor(named: ColorsBravve.white_white.rawValue), title: title, seeMoreColor: .white_white, arrowUpImage: UIImage(named: ButtonsBravve.arrowUpWhite.rawValue), arrowDownImage: UIImage(named: ButtonsBravve.arrowDownWhite.rawValue))
        
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
        
        let itemSize = 300
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
        
        let sloganLabel = detailsOpenViewModel.createLabel(space.slogan,
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
        
        photoCollectionView.register(OpenDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        photoCollectionView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        let localLabel = detailsOpenViewModel.createLabel(space.local_name,
                                                          UIFont(name: FontsBravve.bold.rawValue,
                                                                 size: CGFloat(20).generateSizeForScreen))
        
        let descriptionLabel = detailsOpenViewModel.createLabel(space.description,
                                                                textColor: UIColor(named: ColorsBravve.label.rawValue))
        
        let hourlyLabel = detailsOpenViewModel.createLabel(space.hourly_credits,
                                                           UIFont(name: FontsBravve.bold.rawValue,
                                                                  size: CGFloat(30).generateSizeForScreen),
                                                           textColor: UIColor(named: ColorsBravve.pink_white.rawValue))
        
        let creditHourLabel = detailsOpenViewModel.createLabel("crédito/hora",
                                                               textColor: UIColor(named: ColorsBravve.pink_white.rawValue))
        
        let dailyLabel = detailsOpenViewModel.createLabel(space.daily_credits)
        
        let creditDayLabel = detailsOpenViewModel.createLabel("crédito/dia")
        
        let buttons = createCapsuleButtons([space.space_classification?.name ?? "", space.space_type?.name ?? "", space.space_noise_level?.name ?? ""],
                                            .capsuleButton,
                                            strokeColor: UIColor(named: ColorsBravve.pink_cyan.rawValue) ?? UIColor())
        
        let tagsStackView = UIStackView(arrangedSubviews: buttons)
        tagsStackView.spacing = CGFloat(5).generateSizeForScreen
        
        let briefingLabel = detailsOpenViewModel.createLabel("""
        Sentiu o cheirinho de café e já veio aquela energia extra? Pois é bem assim que a gente se sente neste espaço: renovado. Se é porquê a decoração suave e orgânica nos deixa mais concentrados ou por conta do silêncio da localização você que vai nos dizer.
        
        Um refúgio paulistano na esquina da Gabriel Monteiro da Silva com a Juquiá,  o paraíso do design. Com uma pegada cultural, o Kamy propicia a seus frequentadores encontrar exposições de diferentes artistas no seu espaço.

        Trabalho + Café + Cultura, precisa de mais? Então reserve =).
        """,
                                                             textColor: black_White)
        
        let nameLabel = detailsOpenViewModel.createLabel("Giovanna")
        
        let officeLabel = detailsOpenViewModel.createLabel("Community Manager")
        
        view.addSubviews([titleLabelView, sloganLabel, photoCollectionView, pageControl, tagsStackView, localLabel, descriptionLabel, hourlyLabel, creditHourLabel, dailyLabel, creditDayLabel, briefingLabel, nameLabel, officeLabel, localDetailsStackView, structureStackView, localFacilitiesStackView])
        
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
        photoCollectionView.constraintInsideTo(.leading, view)
        photoCollectionView.constraintInsideTo(.trailing, view)
        photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        pageControl.constraintInsideTo(.centerX, photoCollectionView)
        pageControl.constraintOutsideTo(.top, photoCollectionView,
                                        CGFloat(10).generateSizeForScreen)
        pageControl.constraintInsideTo(.leading, photoCollectionView)
        pageControl.constraintInsideTo(.trailing, photoCollectionView)
        
        localLabel.constraintOutsideTo(.top,  photoCollectionView, CGFloat(45).generateSizeForScreen)
        localLabel.constraintInsideTo(.leading, sloganLabel)
        
        descriptionLabel.constraintOutsideTo(.top, localLabel, CGFloat(7.5).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.leading, localLabel)
        
        hourlyLabel.constraintInsideTo(.centerY, localLabel)
        hourlyLabel.constraintOutsideTo(.trailing, creditHourLabel, CGFloat(5).generateSizeForScreen)
        
        creditHourLabel.constraintInsideTo(.bottom, hourlyLabel)
        creditHourLabel.constraintInsideTo(.trailing, photoCollectionView, CGFloat(20).generateSizeForScreen)
        
        dailyLabel.constraintOutsideTo(.top, hourlyLabel,
                                    CGFloat(5).generateSizeForScreen)
        dailyLabel.constraintInsideTo(.leading, hourlyLabel)
        
        creditDayLabel.constraintOutsideTo(.leading, dailyLabel,
                                    CGFloat(5).generateSizeForScreen)
        creditDayLabel.constraintInsideTo(.bottom, dailyLabel)
        
        creditDayLabel.constraintInsideTo(.trailing, photoCollectionView, CGFloat(20).generateSizeForScreen)
        
        tagsStackView.constraintOutsideTo(.top, creditDayLabel,
                                          CGFloat(20).generateSizeForScreen)
        tagsStackView.constraintInsideTo(.leading, localLabel)
        tagsStackView.constraintInsideTo(.trailing, creditHourLabel)
        
        briefingLabel.constraintOutsideTo(.top, tagsStackView,
                                    CGFloat(20).generateSizeForScreen)
        briefingLabel.constraintInsideTo(.leading, tagsStackView)
        briefingLabel.constraintInsideTo(.trailing, tagsStackView)
        
        nameLabel.constraintOutsideTo(.top, briefingLabel,
                                    CGFloat(20).generateSizeForScreen)
        nameLabel.constraintInsideTo(.leading, briefingLabel)
        nameLabel.constraintInsideTo(.trailing, briefingLabel)
        
        officeLabel.constraintOutsideTo(.top, nameLabel)
        officeLabel.constraintInsideTo(.leading, nameLabel)
        officeLabel.constraintInsideTo(.trailing, nameLabel)
        
        localDetailsStackView.constraintOutsideTo(.top, officeLabel,
                                                  CGFloat(20).generateSizeForScreen)
        localDetailsStackView.constraintInsideTo(.leading, officeLabel)
        localDetailsStackView.constraintInsideTo(.trailing, officeLabel)
        
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
    
    let reserveButton = UIButton()
    
    private let detailsOpenViewModel = DetailsOpenViewModel()
    
    init(_ space: SpaceDetail) {
        
        self.space = space
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        setupView()
        setupDefaults()
        setupConstraints()
        reserveButton.addTarget(self, action: #selector(reserveButtonTapped), for: .touchUpInside)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
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

