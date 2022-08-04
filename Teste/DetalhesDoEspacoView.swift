//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class DetalhesDoEspacoView: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupDefaults()
        setupConstraints()
    }
    
    let customBar = UIView()
    
    lazy var tabBar = BravveTabBar()
    
    lazy var scrollView: UIScrollView = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: 256, height: 256)
        
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemGreen
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        
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
        
        photoCollectionView.register(HomeAbertaCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        let nameLabel = UILabel()
        nameLabel.text = "Hotel Saint"
        
        let hourPriceLabel = UILabel()
        hourPriceLabel.text = "3,50 crédito/ hora"
        
        let dayPriceLabel = UILabel()
        dayPriceLabel.text = "18,20 crédito/dia"
        
        view.addSubviews([titleLabel, descriptionLabel,
                          photoCollectionView, nameLabel,
                          hourPriceLabel, dayPriceLabel])
        
        view.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        view.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        titleLabel.constraintInsideTo(.top, view)
        titleLabel.constraintInsideTo(.leading, view, 21)
        
        descriptionLabel.constraintOutsideTo(.top, titleLabel, 23)
        descriptionLabel.constraintInsideTo(.leading, titleLabel)
        descriptionLabel.widthAnchorInSuperview(215)
        
        photoCollectionView.constraintOutsideTo(.top, descriptionLabel, 22)
        photoCollectionView.constraintInsideTo(.leading, descriptionLabel)
        photoCollectionView.constraintInsideTo(.trailing, view)
        photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        dayPriceLabel.constraintOutsideTo(.top, hourPriceLabel)
        dayPriceLabel.constraintInsideTo(.leading, hourPriceLabel)
        dayPriceLabel.constraintInsideTo(.bottom, view, 18)
        
        nameLabel.constraintOutsideTo(.top,  photoCollectionView, 23)
        nameLabel.constraintInsideTo(.leading, photoCollectionView)
        
        hourPriceLabel.constraintOutsideTo(.top, nameLabel, 23)
        hourPriceLabel.constraintInsideTo(.leading, nameLabel)
        
        return scrollView
    }()
    
    let reserveButton = UIButton()
    
    private func setupView() {
        
        view.setToDefaultBackgroundColor()
        view.addSubviews([customBar, scrollView, reserveButton, tabBar])
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

extension DetalhesDoEspacoView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeAbertaCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
}
