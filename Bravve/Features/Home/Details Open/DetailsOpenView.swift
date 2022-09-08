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
        
        spaceCategoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        spaceCategoryNameLabel.topAnchor.constraint(equalTo: titleLabelView.topAnchor, constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor, constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.trailingAnchor.constraint(equalTo: titleLabelView.trailingAnchor, constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        spaceCategoryNameLabel.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
//        spaceCategoryNameLabel.constraintInsideTo(.top, titleLabelView,
//                                      CGFloat(2.5).generateSizeForScreen)
//        spaceCategoryNameLabel.constraintInsideTo(.leading, titleLabelView,
//                                      CGFloat(2.5).generateSizeForScreen)
//        spaceCategoryNameLabel.constraintInsideTo(.trailing, titleLabelView,
//                                      CGFloat(2.5).generateSizeForScreen)
//        spaceCategoryNameLabel.constraintInsideTo(.bottom, titleLabelView,
//                                      CGFloat(2.5).generateSizeForScreen)
        
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
        navigationSetup()
        reserveButton.addTarget(self, action: #selector(reserveButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Navigation Setup
    private func navigationSetup(){
        let navigationStatusBarView = UIView()
        navigationStatusBarView.translatesAutoresizingMaskIntoConstraints = false
        navigationStatusBarView.backgroundColor = UIColor(named: "blueBravve")
        self.view.addSubview(navigationStatusBarView)
         
        NSLayoutConstraint.activate([
            navigationStatusBarView.topAnchor.constraint(equalTo: self.view.topAnchor),
            navigationStatusBarView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            navigationStatusBarView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let label = UILabel()
        label.text = "Espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.textColor = UIColor(named: ColorsBravve.white_white.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        let titleView = UIView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
    
        
        self.navigationItem.titleView = titleView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ButtonsBravve.mostButton.rawValue), style: .plain, target: self, action: #selector(searchBarButtonTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: ButtonsBravve.backWhite.rawValue), style: .plain, target: self, action: #selector(menuBarButtonTapped))
        self.navigationController?.navigationBar.tintColor = UIColor(named: ColorsBravve.white_white.rawValue)
    }
    
    @objc func searchBarButtonTapped(){
        print("right")
    }
    
    @objc func menuBarButtonTapped(){
        self.navigationController?.popViewController(animated: true)
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
        self.navigationController?.pushViewController(reserveViewController, animated: true)
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

