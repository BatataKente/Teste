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
    
    private let viewElements: (leftStackView: UIStackView,
                               leftButton: UIButton,
                               rightStackView: UIStackView,
                               rightButton: UIButton) = {
        
        let leftButton = UIButton()
        let stateLabel = UILabel()
        let stateChosedLabel = UILabel()
        let rightButton = UIButton()
        let cityLabel = UILabel()
        let cityChosedLabel = UILabel()
        
        let stateHandler = {(action: UIAction) in

            stateChosedLabel.text = action.title
            stateLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        }

        stateLabel.text = "UF"
        leftButton.setMenuForButton([
            
            UIAction(title: "action1",handler: stateHandler),
            UIAction(title: "action2",handler: stateHandler)

        ])
        leftButton.setTitle("", for: .normal)
        
        let cityHandler = {(action: UIAction) in

            cityChosedLabel.text = action.title
            cityLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        }
        
        cityLabel.text = "Cidade"
        rightButton.setMenuForButton([

            UIAction(title: "action1",handler: cityHandler),
            UIAction(title: "action2",handler: cityHandler)

        ])
        rightButton.setTitle("", for: .normal)
        
        let leftStackView = UIStackView(arrangedSubviews: [stateLabel,
                                                           stateChosedLabel])
        leftStackView.axis = .vertical
        let rightStackView = UIStackView(arrangedSubviews: [cityLabel,
                                                            cityChosedLabel])
        rightStackView.axis = .vertical
        
        return (leftStackView: leftStackView,
                leftButton: leftButton,
                rightStackView: rightStackView,
                rightButton: rightButton)
    }()
    
    private lazy var navigationBar: (bar: UIView,
                                     filterButton: UIButton) = {
        
        let bar = UIView()
        bar.backgroundColor = UIColor(named: "BlueBravve")
        
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(viewElements.leftStackView)
        stackView.addArrangedSubview(viewElements.leftButton)
        stackView.addArrangedSubview(viewElements.rightStackView)
        stackView.addArrangedSubview(viewElements.rightButton)
        
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        stackView.setToDefaultBackgroundColor()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
        let filterButton = UIButton()
        filterButton.setImage(UIImage(named: "Filter-2"), for: .normal)
        
        bar.addSubviews([filterButton])
        
        filterButton.constraintInsideTo(.centerY, bar)
        filterButton.constraintInsideTo(.trailing, bar, 5)
        filterButton.sizeAnchorInSuperview(50)
        
        let titleLabel = UILabel()
        titleLabel.text = "Espaço"
        titleLabel.font = UIFont(name: "Ubuntu-Medium", size: 19)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        bar.addSubviews([stackView])
        
        return (bar: bar,
                filterButton: filterButton)
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
        
        view.addSubviews([scrollView, stackView, navigationBar.bar, tabBar, reserveButton])
        
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
        
        navigationBar.bar.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        navigationBar.bar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        navigationBar.bar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        navigationBar.bar.heightAnchorInSuperview(100)
        
        viewElements.leftStackView.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        viewElements.leftButton.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        viewElements.rightStackView.addLeadingLineWithColor(color: .red)
        viewElements.rightButton.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        
        stackView.constraintOutsideTo(.top, navigationBar.bar)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.bottom, tabBar)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        scrollView.constraintOutsideTo(.top, navigationBar.bar)
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
