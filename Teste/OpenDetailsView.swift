//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class OpenDetailsView: UIViewController {
    
    init(_ reserveData: ReserveData) {
        
        self.reserveData = reserveData
        
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
        
        setupView()
        setupDefaults()
        setupConstraints()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
    
    private var reserveData: ReserveData
    
    private let customBar = UIView()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
    private lazy var scrollView: UIScrollView = {
        
        let itemSize = 256
        let textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        
        let titleLabel = UILabel()
        titleLabel.textColor = textColor
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        titleLabel.text = reserveData.title
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(titleLabel)
        titleLabelView.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        
        titleLabel.constraintInsideTo(.top, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.leading, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.trailing, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.bottom, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = reserveData.description
        descriptionLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                       size: CGFloat(20).generateSizeForScreen)
        descriptionLabel.textColor = textColor
        descriptionLabel.numberOfLines = 0
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        scrollView.addSubview(view)
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(OpenDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        let nameLabel = UILabel()
        nameLabel.text = reserveData.name
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                size: CGFloat(20).generateSizeForScreen)
        nameLabel.textColor = textColor
        
        let hourPriceLabel = UILabel()
        hourPriceLabel.text = "3,50"
        hourPriceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                     size: CGFloat(30).generateSizeForScreen)
        hourPriceLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        
        let hourPriceDescriptionLabel = UILabel()
        hourPriceDescriptionLabel.text = "crédito/hora"
        hourPriceDescriptionLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        hourPriceDescriptionLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                                size: CGFloat(12).generateSizeForScreen)
        
        let dayPriceLabel = UILabel()
        dayPriceLabel.text = "18,20"
        dayPriceLabel.textColor = textColor
        dayPriceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                    size: CGFloat(20).generateSizeForScreen)
        
        let dayPriceDescriptionLabel = UILabel()
        dayPriceDescriptionLabel.text = "crédito/hora"
        dayPriceDescriptionLabel.textColor = textColor
        dayPriceDescriptionLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                               size: CGFloat(12).generateSizeForScreen)
        
        let buttons = createCapsuleButtons(["Tecnológico", "Sala de reunião", "Colaborativo"],
                                            .capsuleButton,
                                            strokeColor: UIColor(named: ColorsBravve.buttonPink.rawValue) ?? UIColor())
        
        let tagsStackView = UIStackView(arrangedSubviews: buttons)
        tagsStackView.spacing = 5
        
        view.addSubviews([titleLabelView, descriptionLabel, photoCollectionView, nameLabel, hourPriceLabel, hourPriceDescriptionLabel, dayPriceLabel, dayPriceDescriptionLabel, tagsStackView])
        
        view.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        titleLabelView.constraintInsideTo(.top, view)
        titleLabelView.constraintInsideTo(.leading, view, CGFloat(20).generateSizeForScreen)
        
        descriptionLabel.constraintOutsideTo(.top, titleLabel, CGFloat(20).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.leading, titleLabel)
        descriptionLabel.widthAnchorInSuperview(CGFloat(215).generateSizeForScreen)
        
        photoCollectionView.constraintOutsideTo(.top, descriptionLabel, CGFloat(20).generateSizeForScreen)
        photoCollectionView.constraintInsideTo(.leading, descriptionLabel)
        photoCollectionView.constraintInsideTo(.trailing, view)
        photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        nameLabel.constraintOutsideTo(.top,  photoCollectionView, CGFloat(20).generateSizeForScreen)
        nameLabel.constraintInsideTo(.leading, photoCollectionView)
        
        hourPriceLabel.constraintOutsideTo(.top, photoCollectionView, CGFloat(20).generateSizeForScreen)
        hourPriceLabel.constraintOutsideTo(.trailing, hourPriceDescriptionLabel, CGFloat(5).generateSizeForScreen)
        
        hourPriceDescriptionLabel.constraintInsideTo(.bottom, hourPriceLabel)
        hourPriceDescriptionLabel.constraintInsideTo(.trailing, photoCollectionView, CGFloat(20).generateSizeForScreen)
        
        dayPriceLabel.constraintOutsideTo(.top, hourPriceLabel, CGFloat(5).generateSizeForScreen)
        dayPriceLabel.constraintInsideTo(.leading, hourPriceLabel)
        
        dayPriceDescriptionLabel.constraintOutsideTo(.leading, dayPriceLabel, CGFloat(5).generateSizeForScreen)
        dayPriceDescriptionLabel.constraintInsideTo(.bottom, dayPriceLabel)
        
        tagsStackView.constraintOutsideTo(.top, dayPriceDescriptionLabel, CGFloat(20).generateSizeForScreen)
        tagsStackView.constraintInsideTo(.leading, nameLabel)
        tagsStackView.constraintInsideTo(.trailing, hourPriceDescriptionLabel)
        tagsStackView.constraintInsideTo(.bottom, view, CGFloat(20).generateSizeForScreen)
        
        return scrollView
    }()
    
    let reserveButton = UIButton()
    
    private func setupView() {
        
        view.setToDefaultBackgroundColor()
        view.addSubviews([customBar, scrollView, reserveButton, tabBar])
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    private func setupDefaults() {
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Espaço") {_ in
            
            self.dismiss(animated: false)
        }
        
        reserveButton.setToBottomButtonDefaultAbove("Reservar", above: tabBar)
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
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? OpenDetailsCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
}
