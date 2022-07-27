//
//  HomeView.swift
//  Teste
//
//  Created by Josicleison on 22/07/22.
//

import UIKit

class HomeAbertaView: UIViewController {
    
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: 256, height: 256)
        
        return collectionViewFlowLayout
    }()
    
    lazy var scrollViewElements: (view: UIView,
                                  titleLabel: UILabel,
                                  descriptionLabel: UILabel,
                                  photoCollectionView: UICollectionView,
                                  nameLabel: UILabel,
                                  hourPriceLabel: UILabel,
                                  dayPriceLabel: UILabel) = {
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemGreen
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
//        view.layer.shadowOffset
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(HomeAbertaCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        let nameLabel = UILabel()
        nameLabel.text = "Hotel Saint"
        
        let hourPriceLabel = UILabel()
        hourPriceLabel.text = "3,50 crédito/ hora"
        
        let dayPriceLabel = UILabel()
        dayPriceLabel.text = "18,20 crédito/dia"
        
        view.addSubviews([titleLabel, descriptionLabel,
                          photoCollectionView, nameLabel,
                          hourPriceLabel, dayPriceLabel])
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                photoCollectionView: photoCollectionView,
                nameLabel: nameLabel,
                hourPriceLabel: hourPriceLabel,
                dayPriceLabel: dayPriceLabel)
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollViewElements.view)
        scrollView.isHidden = true
        scrollView.alwaysBounceVertical = false
        
        return scrollView
    }()
    
    private var espacos = 10
    
    private let titleLabel = UILabel()
    
    private let reserveButton: UIButton = {
        
        let reserveButton = UIButton()
        reserveButton.isHidden = true
        
        return reserveButton
    }()
    
    private lazy var customBar: UIView = {
        
        let customBar = UIView()
        customBar.setToDefaultCustomBarWithFilter()
        
        return customBar
    }()
    
    private lazy var filterStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
        return stackView
    }()
    
    let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.register(HomeAbertaTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.layoutMargins = UIEdgeInsets(top: 20,
                                               left: 20,
                                               bottom: 20,
                                               right: 20)
        
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [filterStackView,
                                                       tableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let tabBar: UITabBar = {

        let tabBar = UITabBar()
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "PinkBravve")
        
        let location = UITabBarItem()
        location.image = UIImage(named: "locationGray")
        
        let calendar = UITabBarItem()
        calendar.image = UIImage(named: "calendarGray")
        
        let user = UITabBarItem()
        user.image = UIImage(named: "userLoginGray")
        
        tabBar.setItems([location, calendar, user], animated: true)
        tabBar.selectedItem = location

        return tabBar
    }()
    
    var filterButtons = [UIButton]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupDefaults()
    }
    
    private func setupView() {
        
        view.addSubviews([scrollView, stackView, customBar, tabBar, reserveButton])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        scrollViewElements.photoCollectionView.dataSource = self
        scrollViewElements.photoCollectionView.delegate = self
        
        filterButtons = createCapsuleButtons(["a"])
        
        filterStackView.addArrangedSubviews(filterButtons)
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        reserveButton.setToBottomButtonDefault("reservar",
                                               aboveWhom: tabBar)
    }
    
    private func setupConstraints() {
        
        customBar.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        customBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        customBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        customBar.heightAnchorInSuperview(100)
        
        stackView.constraintOutsideTo(.top, customBar)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.bottom, tabBar)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        scrollView.constraintOutsideTo(.bottom, reserveButton)
        
        scrollViewElements.view.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        scrollViewElements.titleLabel.constraintInsideTo(.top, scrollViewElements.view)
        scrollViewElements.titleLabel.constraintInsideTo(.leading, scrollViewElements.view, 21)
        
        scrollViewElements.descriptionLabel.constraintOutsideTo(.top, scrollViewElements.titleLabel, 23)
        scrollViewElements.descriptionLabel.constraintInsideTo(.leading, scrollViewElements.titleLabel)
        scrollViewElements.descriptionLabel.widthAnchorInSuperview(215)
        
        scrollViewElements.photoCollectionView.constraintOutsideTo(.top, scrollViewElements.descriptionLabel, 22)
        scrollViewElements.photoCollectionView.constraintInsideTo(.leading, scrollViewElements.descriptionLabel)
        scrollViewElements.photoCollectionView.constraintInsideTo(.trailing, scrollViewElements.view)
        scrollViewElements.photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        scrollViewElements.nameLabel.constraintOutsideTo(.top, scrollViewElements.photoCollectionView, 23)
        scrollViewElements.nameLabel.constraintInsideTo(.leading, scrollViewElements.photoCollectionView)
        
        scrollViewElements.hourPriceLabel.constraintOutsideTo(.top, scrollViewElements.nameLabel, 23)
        scrollViewElements.hourPriceLabel.constraintInsideTo(.leading, scrollViewElements.nameLabel)
        
        scrollViewElements.dayPriceLabel.constraintOutsideTo(.top, scrollViewElements.hourPriceLabel)
        scrollViewElements.dayPriceLabel.constraintInsideTo(.leading, scrollViewElements.hourPriceLabel)
        scrollViewElements.dayPriceLabel.constraintInsideTo(.bottom, scrollViewElements.view, 18)
    }
}

extension HomeAbertaView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.count > 1 {
            
            if indexPath.row == 0 {
                
                let cell = UITableViewCell()
                cell.textLabel?.setToDefault(text: "Espaços", .left)
                
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeAbertaTableViewCell
                cell?.delegate = self
                
                return cell ?? UITableViewCell()
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

extension HomeAbertaView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = scrollViewElements.photoCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeAbertaCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    
    @objc func backAction() {
        
        reserveButton.isHidden = true
        stackView.isHidden = false
        scrollView.isHidden = true
    }
}

extension HomeAbertaView: HomeAbertaTableViewCellProtocol {
    
    func chosePlace() {
        
        reserveButton.isHidden = false
        stackView.isHidden = true
        scrollView.isHidden = false
    }
}
