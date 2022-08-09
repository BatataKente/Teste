//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class OpenDetailsView: UIViewController {
    
    let images = [ImagesBravve.homeOpen_1.rawValue,
                  ImagesBravve.homeOpen_2.rawValue,
                  ImagesBravve.homeOpen_3.rawValue,
                  ImagesBravve.homeOpen_4.rawValue,
                  ImagesBravve.imageReservs_1.rawValue,
                  ImagesBravve.imageReservs_2.rawValue,
                  ImagesBravve.imageReservs_3.rawValue,
                  ImagesBravve.imageReservs_4.rawValue,
                  ImagesBravve.example_1.rawValue,
                  ImagesBravve.example_2.rawValue,
                  ImagesBravve.example_3.rawValue]
    
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
        titleLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
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
        view.setToDefaultBackgroundColor()
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
        
        let label_1 = UILabel()
        label_1.text = reserveData.name
        label_1.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(20).generateSizeForScreen)
        label_1.textColor = textColor
        
        let label_2 = UILabel()
        label_2.text = "3,50"
        label_2.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(30).generateSizeForScreen)
        label_2.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        
        let label_3 = UILabel()
        label_3.text = "crédito/hora"
        label_3.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        label_3.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let label_4 = UILabel()
        label_4.text = "18,20"
        label_4.textColor = textColor
        label_4.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(20).generateSizeForScreen)
        
        let label_5 = UILabel()
        label_5.text = "crédito/hora"
        label_5.textColor = textColor
        label_5.font = UIFont(name: FontsBravve.bold.rawValue,
                              size: CGFloat(12).generateSizeForScreen)
        
        let buttons = createCapsuleButtons(["Tecnológico", "Sala de reunião", "Colaborativo"],
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
        label_6.textColor = UIColor(named: ColorsBravve.textField.rawValue)
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
        
        let localDetailsTableView = UITableView()
        localDetailsTableView.backgroundColor = .green
        
        view.addSubviews([titleLabelView, descriptionLabel, photoCollectionView, tagsStackView, label_1, label_2, label_3, label_4, label_5, label_6, label_7, label_8, localDetailsTableView])
        
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
        
        label_1.constraintOutsideTo(.top,  photoCollectionView, CGFloat(20).generateSizeForScreen)
        label_1.constraintInsideTo(.leading, photoCollectionView)
        
        label_2.constraintOutsideTo(.top, photoCollectionView, CGFloat(20).generateSizeForScreen)
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
        tagsStackView.constraintInsideTo(.leading, label_1)
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
        
        localDetailsTableView.constraintOutsideTo(.top, label_8,
                                                  CGFloat(20).generateSizeForScreen)
        localDetailsTableView.constraintInsideTo(.leading, label_8,
                                                 CGFloat(20).generateSizeForScreen)
        localDetailsTableView.constraintInsideTo(.trailing, label_8,
                                                 CGFloat(20).generateSizeForScreen)
        localDetailsTableView.heightAnchorInSuperview(100)
        
        localDetailsTableView.constraintInsideTo(.bottom, view,
                                                 CGFloat(20).generateSizeForScreen)
        
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
        reserveButton.setToBottomButtonDefaultAbove("Reservar",
                                                    backgroundColor: .buttonPink,
                                                    above: tabBar)
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
        
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? OpenDetailsCollectionViewCell
        
        cell?.imageView.image = UIImage(named: images[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}
